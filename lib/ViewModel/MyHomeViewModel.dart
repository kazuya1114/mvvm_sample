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
    /// then：Futureクラスの関数で、呼び出し先のFuture型関数の実行が終わるとthenで指定した処理を実行する
    /// async：非同期処理関数の関数名(引数)の後に宣言(void incrementCounter() async {...})。
    /// 関数内の処理を非同期処理で実行。
    /// await：非同期処理関数の呼び出し前に宣言(await repository?.incrementCounter();)。
    /// 非同期処理が終わるまで待機する。
    repository?.incrementCounter().then((resultModel) {
      _counter = resultModel.counter;

      // 呼び出し元(repositoryクラス)に変更が通知され、画面がリビルドされる(setStateと同等の効果)
      notifyListeners();
    });
  }
}
