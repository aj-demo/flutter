
import 'package:flutter_demo/providers/global_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void useGlobal(WidgetRef ref) {
  ref.read(globalProvider);
}