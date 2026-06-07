import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noctis_aenigmata/models/genre.dart';

class GenreTile extends StatelessWidget {
  final Genre genre;
  final void Function()? onTap;

  const GenreTile({
    super.key,
    required this.genre,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260.w,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 75, 75, 75),
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.only(left: 20.w),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 200.h,
              child: Image.asset(
                genre.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Text(
                genre.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.pirataOne(
                  fontSize: 24.sp,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  shadows: [
                    const Shadow(
                      blurRadius: 15.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
