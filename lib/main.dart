import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'MyApp.dart';

void main() {
  /// MyAppウィジェットをriverpodで管理する
  /// riverpod：複数の画面で利用する変数等を保持、状態の管理を行う(保持した値はどこでも呼び出せるため、
  /// 引数で値の受け渡しをしないでいい)。riverpodはproviderの欠点をなくすために作られた後天的なライブラリ
  /// riverpodとproviderの違いは下記URL参考：https://zenn.dev/kikuchy/articles/5feec4fa7444c6
  /// MVVM + Repositoryパターン参考：https://wasabeef.medium.com/flutter-%E3%82%92-mvvm-%E3%81%A7%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B-861c5dbcc565
  runApp(ProviderScope(child: MyApp()));
}
