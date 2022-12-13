import 'package:flutter_riverpod/flutter_riverpod.dart';

// riverpodで状態管理を行う変数を定義(今回はリザルト画面で扱うデータモデルを対象とする)
final resultModelProvider = Provider(((ref) => ResultModel()));

class ResultModel {
  // タップ回数
  int counter;

  // コンストラクタ(タップ回数のデフォルト値は0)
  ResultModel({this.counter = 0});
}
