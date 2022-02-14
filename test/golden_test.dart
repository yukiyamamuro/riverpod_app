import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/view_model.dart';

void main() {
  testGoldens('normal', (tester) async {
    const iPhoneN = Device(
      name: 'iPhoneN',
      size: Size(414, 736),
      devicePixelRatio: 3.0,
    );

    List<Device> devices = [iPhoneN];

    ViewModel viewModel = ViewModel();

    await tester.pumpWidgetBuilder(ProviderScope(
      child: MyHomePage(viewModel),
    ));

    await multiScreenGolden(
      tester,
      'myHomePage_0init',
      devices: devices,
    );
  });
}
