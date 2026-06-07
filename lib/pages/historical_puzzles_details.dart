import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noctis_aenigmata/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/puzzle.dart';
import 'package:noctis_aenigmata/components/animated_background.dart';

class HistoricalPuzzlesDetails extends StatefulWidget {
  final Puzzle puzzle;

  const HistoricalPuzzlesDetails({super.key, required this.puzzle});

  @override
  State<HistoricalPuzzlesDetails> createState() =>
      _HistoricalPuzzlesDetailsState();
}

class _HistoricalPuzzlesDetailsState extends State<HistoricalPuzzlesDetails> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      colors: const [
        Color.fromARGB(255, 50, 50, 50),
        Color.fromARGB(255, 244, 67, 54)
      ],
      particleColor: const Color.fromARGB(255, 244, 67, 54),
      gradientAnimationDuration: const Duration(seconds: 10),
      particleAnimationDuration: const Duration(seconds: 6),
      particleSpeedMultiplier: 2.0,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 50, 50, 50),
                  Color.fromARGB(255, 244, 67, 54),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          title: Text(
            widget.puzzle.title,
            style: GoogleFonts.pirataOne(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 30.sp,
              shadows: [
                const Shadow(
                  blurRadius: 25.0,
                  color: Color.fromARGB(255, 244, 67, 54),
                  offset: Offset(2.0, 2.0),
                )
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 35.sp,
              color: const Color.fromARGB(255, 255, 255, 255),
              shadows: const [
                Shadow(
                  blurRadius: 25.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  offset: Offset(2.0, 2.0),
                )
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.puzzle.imagePath,
              fit: BoxFit.cover,
              color: const Color.fromARGB(255, 75, 75, 75),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    const Color.fromARGB(255, 244, 67, 54)
                        .withValues(alpha: 0.55),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 48, 11, 11)
                                .withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: const Color.fromARGB(255, 244, 67, 54),
                              width: 2.w,
                            ),
                          ),
                          child: Text(
                            widget.puzzle.description,
                            style: GoogleFonts.bellefair(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 23.sp,
                              shadows: [
                                const Shadow(
                                  blurRadius: 25.0,
                                  color: Color.fromARGB(255, 244, 67, 54),
                                  offset: Offset(2.0, 2.0),
                                )
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: AnimatedBackground(
                                colors: const [
                                  Color.fromARGB(255, 50, 50, 50),
                                  Color.fromARGB(255, 244, 67, 54)
                                ],
                                particleColor:
                                    const Color.fromARGB(255, 244, 67, 54),
                                gradientAnimationDuration:
                                    const Duration(seconds: 8),
                                particleAnimationDuration:
                                    const Duration(seconds: 4),
                                particleSpeedMultiplier: 2.4,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      widget.puzzle.imagePath,
                                      fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.darken,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            const Color.fromARGB(
                                                255, 50, 50, 50),
                                            const Color.fromARGB(
                                                    255, 244, 67, 54)
                                                .withValues(alpha: 0.7),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 244, 67, 54),
                                          width: 2.w,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20.w),
                                      child: SingleChildScrollView(
                                        child: Center(
                                          child: Container(
                                            padding: EdgeInsets.all(20.w),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      255, 48, 11, 11)
                                                  .withValues(alpha: 0.8),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 244, 67, 54),
                                                width: 2.w,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .answerLabel,
                                                  style: GoogleFonts.pirataOne(
                                                    fontSize: 30.sp,
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      const Shadow(
                                                        blurRadius: 25.0,
                                                        color: Color.fromARGB(
                                                            255, 244, 67, 54),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20.h),
                                                Text(
                                                  widget.puzzle.answer,
                                                  style: GoogleFonts.bellefair(
                                                    fontSize: 23.sp,
                                                    color: Colors.white,
                                                    shadows: [
                                                      const Shadow(
                                                        blurRadius: 25.0,
                                                        color: Color.fromARGB(
                                                            255, 244, 67, 54),
                                                        offset:
                                                            Offset(2.0, 2.0),
                                                      )
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(height: 20.h),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r)),
                                                    side: BorderSide(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 244, 67, 54),
                                                        width: 2.w),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                                255, 50, 50, 50)
                                                            .withValues(
                                                                alpha: 0.6),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30.w,
                                                            vertical: 15.h),
                                                    elevation: 5.0,
                                                  ),
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .hide,
                                                    style: GoogleFonts.federant(
                                                      fontSize: 25.sp,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                      shadows: [
                                                        const Shadow(
                                                          blurRadius: 25.0,
                                                          color: Color.fromARGB(
                                                              255, 244, 67, 54),
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 244, 67, 54),
                          width: 2.w,
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 48, 11, 11)
                          .withValues(alpha: 0.7),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 15.h),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.showAnswer,
                      style: GoogleFonts.federant(
                        fontSize: 25.sp,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shadows: [
                          const Shadow(
                            blurRadius: 25.0,
                            color: Color.fromARGB(255, 244, 67, 54),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
