import 'package:flutter/material.dart';
import 'package:fl_umeng/fl_umeng.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ///注册友盟
  initUM(androidAppKey: '5f895b5a94846f78a9749090', iosAppKey: '5f89595094846f78a9748eca', channel: 'channel');

  ///是否开启log
  setLogEnabledUM(true);
  runApp(MaterialApp(
    title: 'UMeng example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('UMeng example')), body: const Center(child: Text('UMeng 初始化完成')));
  }
}
