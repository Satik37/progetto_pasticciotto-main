import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noctis_aenigmata/components/genre_tile.dart';
import 'package:noctis_aenigmata/components/animated_background.dart';
import 'package:noctis_aenigmata/l10n/app_localizations.dart';
import 'package:noctis_aenigmata/models/genre.dart';
import 'package:noctis_aenigmata/pages/logic_page.dart';
import 'package:noctis_aenigmata/pages/historical_page.dart';
import '../components/nav_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

// --- advanced drawer
class _CategoriesPageState extends State<CategoriesPage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    super.dispose();
  }

  List<Genre> _buildGenres(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      Genre(
          name: l10n.logicPageTitle,
          imagePath: 'assets/images/manAndSkull.png'),
      Genre(
          name: l10n.historicalPageTitle,
          imagePath: 'assets/images/medievalWriting.png'),
    ];
  }

// handle menu button
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  // navigate to genre page
  void navigateToGenre(Genre genre) {
    switch (genre.name) {
      case 'Logic and Deduction':
      case 'Logica e Deduzione':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LogicPage()),
        );
        break;
      case 'Historical Fiction':
      case 'Narrativa Storica':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoricalPage()),
        );
        break;
      // Add other cases here as needed
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: AnimatedBackground(
        colors: const [
          Color.fromARGB(255, 50, 50, 50),
          Color.fromARGB(255, 75, 75, 75),
          Color.fromARGB(255, 100, 100, 100),
          Color.fromARGB(255, 125, 125, 125),
          Color.fromARGB(255, 165, 125, 85),
          Color.fromARGB(255, 255, 145, 0),
        ],
        particleColor: const Color.fromARGB(255, 255, 145, 0),
      ),
      controller: _advancedDrawerController,
      openScale: 0.85,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      drawer: const NavDrawer(),
      child: AnimatedBackground(
        colors: const [
          Color.fromARGB(255, 150, 150, 150),
          Color.fromARGB(255, 50, 50, 50),
        ],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 450),
                      child: Icon(
                        value.visible ? Icons.close : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                        size: 23.w,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadows: const [
                          Shadow(
                            blurRadius: 25.0,
                            color: Color.fromARGB(255, 255, 145, 0),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              title: Text(
                'Noctis Aenigmata',
                style: GoogleFonts.pirataOne(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 37.sp,
                  shadows: [
                    const Shadow(
                      blurRadius: 25.0,
                      color: Colors.amberAccent,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildTabletLayout();
              } else {
                return _buildMobileLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    final l10n = AppLocalizations.of(context)!;
    final genres = _buildGenres(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // --- PROMO BAR ---
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 75, 75, 75),
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:
                      // promo message
                      Text(
                    l10n.categoriesSubtitle,
                    style: GoogleFonts.federant(
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 215, 215, 215),
                      shadows: [
                        const Shadow(
                          blurRadius: 25.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                  ),
                ),
                // image
                Expanded(
                  child: Image.asset(
                    'assets/images/skull18.png',
                    height: 80.h,
                  ),
                ),
              ],
            ),
          ),
          // categories list
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              l10n.categoriesTitle,
              style: GoogleFonts.pirataOne(
                fontSize: 33.sp,
                color: const Color.fromARGB(255, 255, 255, 255),
                shadows: [
                  const Shadow(
                    blurRadius: 25.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(2.0, 2.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) => GenreTile(
                genre: genres[index],
                onTap: () => navigateToGenre(genres[index]),
              ),
            ),
          ),
          // --- APP BAR DOWN ---
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 75, 75, 75),
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.all(20.w),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // image
                Expanded(
                  child: Image.asset(
                    'assets/images/ancientGreekBoat.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // text
                Flexible(
                  child: Text(
                    l10n.categoriesFooter,
                    style: GoogleFonts.federant(
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 215, 215, 215),
                      shadows: [
                        const Shadow(
                          blurRadius: 25.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    final l10n = AppLocalizations.of(context)!;
    final genres = _buildGenres(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // --- PROMO BAR ---
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 75, 75, 75),
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // promo message
                      Text(
                        l10n.categoriesSubtitle,
                        style: GoogleFonts.federant(
                          fontSize: 20.sp,
                          color: const Color.fromARGB(255, 215, 215, 215),
                          shadows: [
                            const Shadow(
                              blurRadius: 25.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                              offset: Offset(2.0, 2.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // image
                Expanded(
                  child: Image.asset(
                    'assets/images/skull18.png',
                    height: 80.h,
                  ),
                ),
              ],
            ),
          ),
          // categories list
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              l10n.categoriesTitle,
              style: GoogleFonts.pirataOne(
                fontSize: 32.sp,
                color: const Color.fromARGB(255, 255, 255, 255),
                shadows: [
                  const Shadow(
                    blurRadius: 25.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                    offset: Offset(2.0, 2.0),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) => GenreTile(
                genre: genres[index],
                onTap: () => navigateToGenre(genres[index]),
              ),
            ),
          ),
          // --- APP BAR DOWN ---
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 75, 75, 75),
              borderRadius: BorderRadius.circular(20.r),
            ),
            margin: EdgeInsets.all(20.w),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // image
                Expanded(
                  child: Image.asset(
                    'assets/images/ancientGreekBoat.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // text
                Flexible(
                  child: Text(
                    l10n.categoriesFooter,
                    style: GoogleFonts.federant(
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 215, 215, 215),
                      shadows: [
                        const Shadow(
                          blurRadius: 25.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                          offset: Offset(2.0, 2.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
