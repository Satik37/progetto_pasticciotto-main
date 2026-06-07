import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noctis_aenigmata/components/animated_background.dart';
import 'package:noctis_aenigmata/l10n/app_localizations.dart';
import '../components/nav_bar.dart';

class CreditsAndSupport extends StatefulWidget {
  const CreditsAndSupport({super.key});

  @override
  State<CreditsAndSupport> createState() => _CreditsAndSupportState();
}

class _CreditsAndSupportState extends State<CreditsAndSupport> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // handle menu button
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  // --- ADVANCED SIDEBAR

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
      //openRatio: 0.5,
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
      // --- DRAWER
      drawer: const NavDrawer(),

      // --- MAIN BUILDING

      // --- app bar
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
              // --- icon
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
                        size: 30.sp,
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

              // title
              title: Text(
                'noctis_aenigmata',
                style: GoogleFonts.pirataOne(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 35.sp,
                  shadows: [
                    const Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),

          // --- BODY
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(
                //   height: 25.h,
                // ),

                // image with color filter and shadow
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withValues(alpha: 0.7),
                          spreadRadius: 5,
                          blurRadius: 100,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.red.withValues(alpha: 0.7),
                        BlendMode.srcATop,
                      ),
                      child: Image.asset('assets/images/writerWoman.png'),
                    ),
                  ),
                ),
// --- text
                Text(
                  l10n.creditsAndSupport.toUpperCase(),
                  style: GoogleFonts.federant(
                    fontSize: 35.sp,
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
// --- second app bar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/theDeathOfOenone.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.all(5.w),
                  padding: EdgeInsets.all(20.w),
                  height: 200.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 25.sp,
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                blurRadius: 25.0,
                                color: Color.fromARGB(255, 255, 145, 0),
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Marina',
                            style: GoogleFonts.felipa(
                              fontSize: 25.sp,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              shadows: [
                                const Shadow(
                                  blurRadius: 25.0,
                                  color: Color.fromARGB(255, 255, 145, 0),
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Icon(
                            Icons.code,
                            size: 25.sp,
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                blurRadius: 25.0,
                                color: Color.fromARGB(255, 255, 145, 0),
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Saturnas',
                            style: GoogleFonts.felipa(
                              fontSize: 25.sp,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              shadows: [
                                const Shadow(
                                  blurRadius: 25.0,
                                  color: Color.fromARGB(255, 255, 145, 0),
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // image
                      // Expanded(
                      //   child: Image.asset(
                      //     'assets/images/inkPen.png',
                      //     //  height: 100,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      //SizedBox(width: 10.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
