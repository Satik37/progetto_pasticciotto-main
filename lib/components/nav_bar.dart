import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/categories_page.dart';
import '../pages/credits_and_support_page.dart';
import '../pages/intro_page.dart';
import '../pages/language_page.dart';
import '../pages/settings_page.dart';
import 'package:noctis_aenigmata/l10n/app_localizations.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: const Color.fromARGB(255, 255, 255, 255),
          iconColor: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(30.w),
                margin: EdgeInsets.only(bottom: 100.w),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  'Menu',
                  style: GoogleFonts.pirataOne(
                    color: Colors.white,
                    fontSize: 50.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 255, 145, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
              ),

              // --- HOME
              ListTile(
                leading: Icon(
                  Icons.home,
                  size: 25.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 255, 145, 0),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                title: Text(
                  l10n.home,
                  style: GoogleFonts.federant(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
              ),

              SizedBox(height: 10.h),
              // --- GENRES
              ListTile(
                leading: Icon(
                  Icons.book,
                  size: 25.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 255, 145, 0),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                title: Text(
                  l10n.genres,
                  style: GoogleFonts.federant(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoriesPage()),
                  );
                },
              ),

              SizedBox(height: 10.h),
              // --- SETTINGS
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 25.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 255, 145, 0),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                title: Text(
                  l10n.settings,
                  style: GoogleFonts.federant(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
              ),

              SizedBox(height: 10.h),
              // --- LANGUAGE
              ListTile(
                leading: Icon(
                  Icons.translate,
                  size: 25.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 255, 145, 0),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                title: Text(
                  l10n.language,
                  style: GoogleFonts.federant(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LanguagePage()),
                  );
                },
              ),

              SizedBox(height: 10.h),
              // --- CREDITS AND SUPPORT
              ListTile(
                leading: Icon(
                  Icons.info,
                  size: 25.sp,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                      blurRadius: 25.0,
                      color: Color.fromARGB(255, 255, 145, 0),
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                title: Text(
                  l10n.creditsAndSupport,
                  style: GoogleFonts.federant(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25.sp,
                    shadows: [
                      const Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreditsAndSupport()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
