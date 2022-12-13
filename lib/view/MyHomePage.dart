import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/ViewModel/MyHomeViewModel.dart';
import 'package:sample/view/MySecondPage.dart';

/// viewクラス：画面の構造(UI)を定義
/// riverpodを利用する場合、継承をConsumerWidgetにする
class MyHomePage extends ConsumerWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// read：値の更新
    /// watchでも値の更新は可能だが、onPressed等のプロパティで使用する場合はread推奨
    final _viewModel = ref.read(myHomeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_viewModel.getCounter()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            // 画面遷移ボタン
            ElevatedButton(
                child: const Text('次へ'),
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const MySecondPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
