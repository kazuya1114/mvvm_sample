import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/ViewModel/MyHomeViewModel.dart';

class MySecondPage extends ConsumerWidget {
  const MySecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _viewModel = ref.watch(myHomeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('Number of taps'),
            Text(
              '${_viewModel.getCounter()}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('戻る'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
