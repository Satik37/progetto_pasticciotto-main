import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/puzzles_tile.dart';
import 'package:sushi/components/animated_background.dart';
import 'package:sushi/pages/logic_puzzles_details.dart';
import 'package:sushi/models/puzzle.dart';
import 'package:sushi/services/app_locale.dart';
import 'package:sushi/services/puzzle_repository.dart';

class LogicPage extends StatefulWidget {
  const LogicPage({super.key});

  @override
  State<LogicPage> createState() => _LogicPageState();
}

class _LogicPageState extends State<LogicPage> {
  // List of puzzles
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
      ).loadLogicPuzzles();
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
        Color.fromARGB(255, 33, 149, 243),
        Color.fromARGB(255, 40, 100, 145),
        Color.fromARGB(255, 50, 50, 50),
      ],
      particleColor: const Color.fromARGB(255, 33, 149, 243),
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
                              Color.fromARGB(250, 33, 149, 243),
                              Color.fromARGB(250, 50, 50, 50),
                            ],
                          ),
                        ),
                      ),
                      FlexibleSpaceBar(
                        background: Image.asset(
                          'assets/images/devilDrugs.png',
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.logicPageTitle,
                          style: GoogleFonts.pirataOne(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 35.sp,
                            shadows: [
                              const Shadow(
                                blurRadius: 25.0,
                                color: Color.fromARGB(255, 33, 149, 243),
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
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 25.0,
                          color: Color.fromARGB(255, 33, 149, 243),
                          offset: Offset(2.0, 2.0),
                        ),
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
                            color: const Color.fromARGB(255, 33, 150, 243),
                            width: 2,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                          bottom: 0,
                          top: 20.h,
                        ),
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
                                        .logicPageSubtitle,
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

                            // Add more content widgets here
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
                    AppLocalizations.of(context)!
                        .errorLoadingPuzzles(snapshot.error.toString()),
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
                  puzzleColor: const Color.fromARGB(175, 33, 150, 243),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PuzzleDetailPage(puzzle: puzzle),
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
