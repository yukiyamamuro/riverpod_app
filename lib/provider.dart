import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod APP!';
});

final bodyTextProvider = Provider<String>((ref) {
  return 'Click!';
});

final countProvider = StateProvider<int>((ref) => 0);
