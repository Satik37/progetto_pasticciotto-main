import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:noctis_aenigmata/components/animated_background.dart';
import 'package:noctis_aenigmata/l10n/app_localizations.dart';
import '../components/nav_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _advancedDrawerController = AdvancedDrawerController();

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
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25.r),
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
                      color: Color.fromARGB(255, 255, 217, 0),
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),

          // --- BODY
          body: Padding(
            padding: EdgeInsets.all(25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                // icon
                Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Image.asset('assets/images/knife.png'),
                ),
                SizedBox(
                  height: 25.h,
                ),
                // title
                Text(
                  l10n.settings.toUpperCase(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
