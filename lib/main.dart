import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/data/count_data.dart';
import 'package:riverpod_app/provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          ref.watch(titleProvider),
        ),
        backgroundColor: Color(ref.read(basecolorProvider)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ref.watch(bodyTextProvider),
            ),
            Text(
              ref.watch(countDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CountData countData =
                        ref.read(countDataProvider.state).state;
                    ref.read(countDataProvider.state).state =
                        countData.copyWith(
                      count: countData.count + 1,
                      countUp: countData.countUp + 1,
                    );
                  },
                  child: const Icon(CupertinoIcons.add),
                  backgroundColor: Color(ref.read(basecolorProvider)),
                ),
                FloatingActionButton(
                  onPressed: () {
                    CountData countData =
                        ref.read(countDataProvider.state).state;
                    ref.read(countDataProvider.state).state =
                        countData.copyWith(
                      count: countData.count - 1,
                      countDown: countData.countDown + 1,
                    );
                  },
                  child: const Icon(CupertinoIcons.minus),
                  backgroundColor: Color(ref.read(basecolorProvider)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(ref
                    .watch(countDataProvider.select((val) => val.countUp))
                    .toString()),
                Text(ref
                    .watch(countDataProvider.select((val) => val.countDown))
                    .toString()),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isElevated = !_isElevated;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 100,
                width: 100,
                child: const Center(child: Text('Neumorphism')),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: _isElevated
                        ? [
                            BoxShadow(
                              color: Colors.grey[500]!,
                              offset: const Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ]
                        : null),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countDataProvider.state).state = const CountData(
            count: 0,
            countUp: 0,
            countDown: 0,
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
        backgroundColor: Color(ref.read(basecolorProvider)),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
