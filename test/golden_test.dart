import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:riverpod_app/main.dart';
import 'package:riverpod_app/view_model.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });
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

    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    await multiScreenGolden(
      tester,
      'myHomePage_1tapped',
      devices: devices,
    );
  });
}
