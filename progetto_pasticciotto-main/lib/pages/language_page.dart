import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/components/nav_bar.dart';
import 'package:sushi/l10n/app_localizations.dart';
import 'package:sushi/services/app_locale.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage>
    with SingleTickerProviderStateMixin {
  final _advancedDrawerController = AdvancedDrawerController();

  late final AnimationController _controller;
  late final Animation<Alignment> _topAlignmentAnimation;
  late final Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _topAlignmentAnimation = _createAnimation([
      Alignment.topLeft,
      Alignment.topRight,
    ]);
    _bottomAlignmentAnimation = _createAnimation([
      Alignment.bottomRight,
      Alignment.bottomLeft,
    ]);
    _controller.repeat();
  }

  Animation<Alignment> _createAnimation(List<Alignment> alignments) {
    return TweenSequence<Alignment>(
      alignments
          .asMap()
          .entries
          .map((entry) => TweenSequenceItem(
                tween: Tween(
                  begin: entry.value,
                  end: alignments[(entry.key + 1) % alignments.length],
                ),
                weight: 1,
              ))
          .toList(),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ValueListenableBuilder<Locale>(
      valueListenable: appLocaleNotifier,
      builder: (context, currentLocale, _) {
        return AdvancedDrawer(
          backdrop: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: _topAlignmentAnimation.value,
                    end: _bottomAlignmentAnimation.value,
                    colors: const [
                      Color.fromARGB(255, 50, 50, 50),
                      Color.fromARGB(255, 75, 75, 75),
                      Color.fromARGB(255, 100, 100, 100),
                      Color.fromARGB(255, 140, 100, 65),
                      Color.fromARGB(255, 255, 145, 0),
                    ],
                  ),
                ),
              );
            },
          ),
          controller: _advancedDrawerController,
          openScale: 0.85,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          drawer: const NavDrawer(),
          childDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.r)),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: _topAlignmentAnimation.value,
                    end: _bottomAlignmentAnimation.value,
                    colors: const [
                      Color.fromARGB(255, 150, 150, 150),
                      Color.fromARGB(255, 50, 50, 50),
                    ],
                  ),
                ),
                child: child,
              );
            },
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
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
                          size: 30.sp,
                          color: Colors.white,
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
                  l10n.languagePageTitle,
                  style: GoogleFonts.pirataOne(
                    color: Colors.white,
                    fontSize: 35.sp,
                    shadows: const [
                      Shadow(
                        blurRadius: 25.0,
                        color: Color.fromARGB(255, 255, 217, 0),
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      l10n.chooseLanguage,
                      style: GoogleFonts.federant(
                        fontSize: 30.sp,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            blurRadius: 25.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(2.0, 2.0),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _LanguageOptionCard(
                      label: 'English',
                      subtitle: 'Use the app in English',
                      value: 'en',
                      selected: currentLocale.languageCode == 'en',
                      onTap: () => appLocaleNotifier.value = const Locale('en'),
                    ),
                    SizedBox(height: 14.h),
                    _LanguageOptionCard(
                      label: 'Italiano',
                      subtitle: 'Usa l’app in italiano',
                      value: 'it',
                      selected: currentLocale.languageCode == 'it',
                      onTap: () => appLocaleNotifier.value = const Locale('it'),
                    ),
                    const Spacer(),
                    MyButton(
                      text: l10n.backToHome,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/intropage',
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LanguageOptionCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final String value;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOptionCard({
    required this.label,
    required this.subtitle,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromARGB(255, 255, 145, 0).withValues(alpha: 0.25)
              : const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: selected
                ? const Color.fromARGB(255, 255, 217, 0)
                : const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.25),
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.federant(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.bellefair(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(200, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              value.toUpperCase(),
              style: GoogleFonts.pirataOne(
                fontSize: 20.sp,
                color: selected
                    ? const Color.fromARGB(255, 255, 217, 0)
                    : const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
