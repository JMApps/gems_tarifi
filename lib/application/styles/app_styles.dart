import 'package:flutter/cupertino.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  static const RoundedRectangleBorder appBarBroder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.elliptical(35, 25),
      bottomLeft: Radius.elliptical(35, 25),
    ),
  );

  static const RoundedRectangleBorder bottomNavigationBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.elliptical(35, 25),
      topLeft: Radius.elliptical(35, 25),
    ),
  );
}
