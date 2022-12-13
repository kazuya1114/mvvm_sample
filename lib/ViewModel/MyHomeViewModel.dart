import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/repository/MyHomeRepository.dart';

final myHomeViewModelProvider = ChangeNotifierProvider(
    (ref) => MyHomeViewModel(repository: ref.read(myHomeRepositoryProvider)));

/// ViewModel：ロジックを記載
/// ChangeNotifierを継承することで呼び出し元に変更を通知可能になる
class MyHomeViewModel extends ChangeNotifier {
  int _counter = 0;
  MyHomeRepository? repository;

  MyHomeViewModel({this.repository});

  // ゲッター
  int getCounter() {
    return _counter;
  }

  void incrementCounter() {
    /// repositoryがnull以外の場合、_counterにモデルクラスで保持している値を代入
    /// then：Futureクラスの関数で、呼び出し先のFuture型関数の実行が終わる前にthenで指定した処理を実行する(非同期処理のため、処理は同時進行)
    /// incrementCounterがFuture型、そしてthen関数が使用されているため、_counterにresultModelのcounterの値を代入してからincrementCounterを実行
    repository?.incrementCounter().then((resultModel) {
      _counter = resultModel.counter;

      // 呼び出し元(repositoryクラス)に変更が通知され、画面がリビルドされる(setStateと同等の効果)
      notifyListeners();
    });
  }
}
