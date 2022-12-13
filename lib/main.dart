import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyApp.dart';

void main() {
  /// MyAppウィジェットをriverpodで管理する
  /// riverpod：複数の画面で利用する変数等を保持、状態の管理を行う(保持した値はどこでも呼び出せるため、
  /// 引数で値の受け渡しをしないでいい)。riverpodはproviderの欠点をなくすために作られた後天的なライブラリ
  /// riverpodとproviderの違いは下記URL参照
  /// https://zenn.dev/kikuchy/articles/5feec4fa7444c6
  runApp(ProviderScope(child: MyApp()));
}
