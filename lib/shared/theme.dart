import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWhiteColor = Color(0xffFFFFFF);
const Color kGradasi = Color(0xffE2E5FB);
const Color kLightGreyColor = Color(0xffBABFC9);
const Color kGreyColor = Color(0xff696D74);
const Color kBlueColor = Color(0xff546EE5);
const Color kBlackPrimary = Color(0xff1B1E25);
const Color kBlackSecondary = Color(0xff252932);
const Color kYellowColor = Color(0xffFFA235);

TextStyle whiteTextStyle = GoogleFonts.nunito(
  color: kWhiteColor,
);

TextStyle greyTextStyle = GoogleFonts.nunito(
  color: kGreyColor,
);

TextStyle blackTextStyle = GoogleFonts.nunito(
  color: kBlackPrimary,
);

TextStyle blueTextSyle = GoogleFonts.nunito(
  color: kBlueColor,
);

TextStyle lightGreyTextStyle = GoogleFonts.nunito(
  color: kLightGreyColor,
);

TextStyle yellowTextStyle = GoogleFonts.nunito(
  color: kYellowColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight bold = FontWeight.bold;

ThemeData lightTheme = ThemeData(
  primaryColor: kBlueColor,
  scaffoldBackgroundColor: kWhiteColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: blackTextStyle.copyWith(fontWeight: bold),
    elevation: 1,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: kBlackPrimary,
  scaffoldBackgroundColor: kBlackPrimary,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    backgroundColor: kBlackPrimary,
    titleTextStyle: whiteTextStyle.copyWith(fontWeight: bold),
    elevation: 0,
  ),
);
