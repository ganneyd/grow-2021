part of 'default_ui_elements.dart';

//Constants Colors
///Primary G.R.O.W org color
const Color primaryColor = Colors.lightGreen;

///Color that complements the primary color
const Color highlightColor = Color(0xFF64DD17);

///Text color 1
const Color textColor = Color(0xFF212121);

///Text color 2 darker than Text Color 1
const Color textColorDD = Color(0xFF212121);

///Text color 3 lightest
const Color textColorL = Color(0xFFF1F8E9);

///
const Color lightBlueBase = Color(0xFFE1F5FE);

///
const Color lightRedBase = Color(0xFFFFEBEE);

///Light verison of the primary color
const Color lightPrimary = Color(0xFFDCEDC8);

///
const Color lightBlue = Color(0xFFB3E5FC);

///
const Color lightRed = Color(0xFFF8BBD0);

///
const Color boyGender = Color(0xFF1E88E5);

///
const Color boyGenderAccent = Color(0xFF2979FF);

///
const Color girlGender = Color(0xFFD81B60);

///
const Color red = Colors.red;

///
const Color redAccent = Colors.redAccent;

///Graident that blends the primary color into the highlight color
const LinearGradient gradient1 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, // 10% of the width, so there are ten blinds.
  colors: [primaryColor, highlightColor], // primary color to highlight color
  tileMode: TileMode.repeated,
);
