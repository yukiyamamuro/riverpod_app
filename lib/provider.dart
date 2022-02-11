import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/count_data.dart';

final titleProvider = Provider<String>((ref) {
  return 'Riverpod APP!';
});

final basecolorProvider = Provider<int>((ref) {
  return 0xff7f1184;
});

final bodyTextProvider = Provider<String>((ref) {
  return 'Click!';
});

final countProvider = StateProvider<int>((ref) => 0);

final countDataProvider = StateProvider<CountData>(
  (ref) => CountData(
    count: 0,
    countUp: 0,
    countDown: 0,
  ),
);
