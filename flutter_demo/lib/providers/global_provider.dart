
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/global.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalNotifier extends Notifier<Globel> {
  @override
  Globel build() {
    return Globel();
  }
  bool isUpstairsShow() => state.upstairsChild == null;
  void setUpstairs(Widget child) {
    state = state.copyWith(upstairsChild: child);
  }
  void clearUpstairs() {
    state.upstairsChild = null;
    state = state.copyWith();
  }

  void changeBranche(index) {
    state = state.copyWith(brancheIndex: index);
  }
}

final globalProvider = NotifierProvider<GlobalNotifier, Globel>(GlobalNotifier.new);

void useUpstairs(ref, Widget upstairsChild) {
  final notifier = ref.read(globalProvider.notifier);
  useEffect(() {
    Future.microtask(() {
      notifier.setUpstairs(upstairsChild);
    });
    
    return () {
      notifier.clearUpstairs();
    };
  }, const []);
}