
import 'package:flutter/widgets.dart';


class Globel {
  late Widget? upstairsChild;
  late int brancheIndex = 0;
  Globel({ this.upstairsChild, this.brancheIndex = 0 });
  Globel copyWith({
    int? brancheIndex,
    Widget? upstairsChild,
  }) {
    return Globel(
      brancheIndex: brancheIndex ?? this.brancheIndex,
      upstairsChild: upstairsChild ?? this.upstairsChild,
    );
  }
}