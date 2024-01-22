import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_dimens.dart';
import 'app_fonts.dart';

const DarkColors _darkColors = DarkColors();
const LightColors _lightColors = LightColors();

final ThemeData darkTheme = ThemeData.dark().copyWith(
  // extensions: <ThemeExtension>[ThemeColors.dark],
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
    brightness: Brightness.dark,
  ),
  // scaffoldBackgroundColor: _darkColors.bgScreenPrimary,
  appBarTheme: _getAppBarTheme(_darkColors),
  textTheme: _getTextTheme(_darkColors),
  inputDecorationTheme: _getInputDecorationTheme(_darkColors),
  bottomNavigationBarTheme: _getBottomNavigationBarTheme(_darkColors),
  // primaryColor: _darkColors.bgScreenPrimary,
  brightness: Brightness.dark,
  // primaryColor: colors.bgScreenPrimary,,
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  // extensions: <ThemeExtension>[ThemeColors.light],
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.grey,
  ),
  // scaffoldBackgroundColor: _lightColors.bgScreenPrimary,
  appBarTheme: _getAppBarTheme(_lightColors),
  textTheme: _getTextTheme(_lightColors),
  inputDecorationTheme: _getInputDecorationTheme(_lightColors),
  bottomNavigationBarTheme: _getBottomNavigationBarTheme(_lightColors),
  // primaryColor: _lightColors.bgScreenPrimary,
);

AppBarTheme _getAppBarTheme(AppColors colors) {
  return AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(
        // color: colors.collectionStart,
        ),
  );
}

TextTheme _getTextTheme(AppColors colors) {
  return const TextTheme().apply(
      // bodyColor: colors.textPrimary,
      // displayColor: colors.textPrimary,
      );
}

InputDecorationTheme _getInputDecorationTheme(AppColors colors) {
  final TextStyle normalInterInputStyle = TextStyle(
    fontSize: AppDimens.fontSize16,
    // color: colors.grey30,
  );

  return InputDecorationTheme(
    // errorStyle: AppFonts.normalInter.copyWith(
    //   fontSize: 0,
    //   color: Colors.transparent,
    // ),
    labelStyle: normalInterInputStyle,
    floatingLabelStyle: normalInterInputStyle,
    hintStyle: normalInterInputStyle,
    // suffixIconColor: colors.grey30,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );
}

BottomNavigationBarThemeData _getBottomNavigationBarTheme(AppColors colors) {
  return BottomNavigationBarThemeData(
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    // backgroundColor: colors.bgScreenSecondary,
    showUnselectedLabels: false,
    showSelectedLabels: false,
  );
}

//
// ThemeData appThemeDark() {
//   return ThemeData(
//     extensions: <ThemeExtension>[ThemeColors.dark],
//     useMaterial3: true,
//     colorScheme: ColorScheme.fromSwatch(
//       primarySwatch: Colors.grey,
//       brightness: Brightness.dark,
//     ),
//     scaffoldBackgroundColor: AppColors.bgScreenPrimary,
//     brightness: Brightness.dark,
//     appBarTheme: const AppBarTheme(
//       systemOverlayStyle: SystemUiOverlayStyle.dark,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: AppColors.white,
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       errorStyle: AppFonts.inter400.copyWith(fontSize: 0, color: Colors.transparent),
//       labelStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       floatingLabelStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       hintStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       suffixIconColor: AppColors.grey,
//       border: InputBorder.none,
//       enabledBorder: InputBorder.none,
//       focusedBorder: InputBorder.none,
//       errorBorder: InputBorder.none,
//       focusedErrorBorder: InputBorder.none,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       elevation: 0,
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: AppColors.black,
//       showUnselectedLabels: false,
//       showSelectedLabels: false,
//     ),
//   );
// }
//
//
// ThemeData appThemeLight() {
//   return ThemeData(
//     extensions: <ThemeExtension>[ThemeColors.light],
//     useMaterial3: true,
//     colorScheme: ColorScheme.fromSwatch(
//       primarySwatch: Colors.grey,
//     ),
//     scaffoldBackgroundColor: AppColors.mainBackground,
//     brightness: Brightness.light,
//     appBarTheme: const AppBarTheme(
//       systemOverlayStyle: SystemUiOverlayStyle.light,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: AppColors.white,
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       errorStyle: AppFonts.inter400.copyWith(fontSize: 0, color: Colors.transparent),
//       labelStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       floatingLabelStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       hintStyle: AppFonts.inter400.copyWith(fontSize: 16, color: AppColors.grey),
//       suffixIconColor: AppColors.grey,
//       border: InputBorder.none,
//       enabledBorder: InputBorder.none,
//       focusedBorder: InputBorder.none,
//       errorBorder: InputBorder.none,
//       focusedErrorBorder: InputBorder.none,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       elevation: 0,
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: AppColors.black,
//       showUnselectedLabels: false,
//       showSelectedLabels: false,
//     ),
//   );
// }
