import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/utils/app_text/app_text_type.dart';

TextStyle selectTextStyle(AppTextType appTextType) {
  if (appTextType == AppTextType.heading) {
    return GoogleFonts.inter(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      color: ColorConstant.white,
    );
  }
  if (appTextType == AppTextType.bigText) {
    return GoogleFonts.inter(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: ColorConstant.white,
    );
  }
  if (appTextType == AppTextType.bigTextDark) {
    return GoogleFonts.inter(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: ColorConstant.bgColor,
    );
  }
  if (appTextType == AppTextType.smallText) {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: ColorConstant.white,
    );
  }
  if (appTextType == AppTextType.smallTextLight) {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: ColorConstant.white,
    );
  }
  if (appTextType == AppTextType.cardHeading) {
    return GoogleFonts.inter(
      color: ColorConstant.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }
  if (appTextType == AppTextType.cardSubheading) {
    return GoogleFonts.inter(
      color: Colors.grey[300],
      fontSize: 14.sp,
    );
  }
  if (appTextType == AppTextType.cardSubheadingBlue) {
    return GoogleFonts.inter(
      color: ColorConstant.blue,
      fontSize: 12.sp,
    );
  }
  if (appTextType == AppTextType.cardText) {
    return GoogleFonts.inter(
      color: Colors.grey[400],
      fontSize: 12.sp,
    );
  }
  return const TextStyle();
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextType appTextType;
  final TextAlign? textAlign;
  final int? maxLines;
  const AppText({
    super.key,
    required this.text,
    required this.appTextType,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: selectTextStyle(appTextType),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
