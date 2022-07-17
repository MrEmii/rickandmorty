import 'package:flutter/widgets.dart';

class NoGlowList extends ScrollBehavior {
  const NoGlowList();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
