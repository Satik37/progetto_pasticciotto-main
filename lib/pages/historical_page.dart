import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/puzzles_tile.dart';
import '../components/animated_background.dart';
import '../models/puzzle.dart';
import '../services/app_locale.dart';
import '../services/puzzle_repository.dart';
import 'historical_puzzles_details.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({super.key});

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  late final Future<List<Puzzle>> _futurePuzzles;

  @override
  void initState() {
    super.initState();
    _reloadPuzzles();
    appLocaleNotifier.addListener(_reloadPuzzles);
  }

  void _reloadPuzzles() {
    final localeCode = appLocaleNotifier.value.languageCode;
    setState(() {
      _futurePuzzles = PuzzleRepository(
        localeCode: localeCode.isNotEmpty ? localeCode : 'en',
      ).loadHistoricalPuzzles();
    });
  }

  @override
  void dispose() {
    appLocaleNotifier.removeListener(_reloadPuzzles);
    super.dispose();
  }

// --- MAIN BUILDING

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      colors: const [
        Color.fromARGB(255, 244, 67, 54),
        Color.fromARGB(255, 152, 58, 52),
        Color.fromARGB(255, 50, 50, 50),
      ],
      particleColor: const Color.fromARGB(255, 244, 67, 54),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,

          // ----- Add background image
          children: [
            //   Image.asset(
            //     'assets/images/skull18.png',
            //     fit: BoxFit.cover,
            //   ),

            // ----- sliver app bar

            CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 200.h,
                  floating: true,
                  pinned: true,
                  flexibleSpace: Stack(
                    children: [
                      // Custom gradient background for SliverAppBar
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 244, 67, 54),
                              Color.fromARGB(255, 50, 50, 50),
                            ],
                          ),
                        ),
                      ),
                      FlexibleSpaceBar(
                        background: Image.asset(
                          'assets/images/knightHorse.png',
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.historicalPageTitle,
                          style: GoogleFonts.pirataOne(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 35.sp,
                            shadows: [
                              const Shadow(
                                blurRadius: 25.0,
                                color: Color.fromARGB(255, 244, 67, 54),
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                        ),
                        centerTitle: true,
                      ),
                    ],
                  ),

                  // Arrow to move back to the previous page
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 35.sp,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shadows: const [
                        Shadow(
                          blurRadius: 25.0,
                          color: Color.fromARGB(255, 244, 67, 54),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // end of bar

                // sliver list

                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // promo banner

                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(155, 50, 50, 50),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 244, 67, 54),
                            width: 2.w,
                          ),
                        ),
                        margin: EdgeInsets.only(
                            left: 25.w, right: 25.w, bottom: 0, top: 20.h),
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // promo message

                                  Text(
                                    AppLocalizations.of(context)!
                                        .historicalPageSubtitle,
                                    style: GoogleFonts.federant(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      shadows: [
                                        const Shadow(
                                          blurRadius: 25.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          offset: Offset(2.0, 2.0),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ),

                            // add more widgets here
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                buildImages(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // image grid

  Widget buildImages() => SliverToBoxAdapter(
        child: FutureBuilder<List<Puzzle>>(
          future: _futurePuzzles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    AppLocalizations.of(context)!.errorLoadingHistoricalPuzzles(
                        snapshot.error.toString()),
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            final puzzles = snapshot.data ?? <Puzzle>[];

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.all(10.w),
              itemCount: puzzles.length,
              itemBuilder: (context, index) {
                final puzzle = puzzles[index];
                return PuzzlesTile(
                  imagePath: puzzle.imagePath,
                  puzzleName: puzzle.title,
                  puzzleColor: const Color.fromARGB(175, 244, 67, 54)
                      .withValues(alpha: 0.7),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HistoricalPuzzlesDetails(puzzle: puzzle),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      );
}
