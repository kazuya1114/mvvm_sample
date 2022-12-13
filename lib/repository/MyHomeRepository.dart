import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/model/ResultModel.dart';

/// read：値の更新
/// incrementCounter関数で監視対象のResultModelの値(counter)が更新される可能性
/// があるため、readで読み取る
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
  /// 処理１～３があり、処理２の時間が長い場合の処理２の返却型をFutureにすれば、
  /// 処理２を実行しながら処理３を実行できる、といった非同期処理を実装する際に使用
  /// 本関数は、非同期処理の返却型はResultModel
  @override
  Future<ResultModel> incrementCounter() {
    _model.counter++;
    return Future.value(_model);
  }
}
