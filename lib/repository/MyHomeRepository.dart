import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/model/ResultModel.dart';

/// read：値の更新
/// incrementCounter関数で監視対象のResultModelの値(counter)が更新される可能性
/// があるため、readで読み取る
/// DDD(ドメイン駆動設計)、リポジトリパターンについては下記URLが分かりやすい
/// https://zenn.dev/kohii/articles/e4f325ed011db8
final myHomeRepositoryProvider = Provider(
    (ref) => MyHomeRepositoryImpl(model: ref.read(resultModelProvider)));

// 抽象クラス
abstract class MyHomeRepository {
  Future<ResultModel> incrementCounter();
}

/// リポジトリクラス
/// MyHomeRepositoryを継承したため、incrementCounter関数のオーバーライド必須
class MyHomeRepositoryImpl implements MyHomeRepository {
  final ResultModel _model;

  MyHomeRepositoryImpl({required ResultModel model}) : _model = model;

  /// Future：関数内に非同期処理がある場合に仕様。<>の中は最終的な返却型
  @override
  Future<ResultModel> incrementCounter() {
    _model.counter++;
    return Future.value(_model);
  }
}
