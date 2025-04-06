import 'package:flutter/material.dart';
import 'package:intellij_tourism_designer/pages/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'http/dio_instance.dart';
import 'models/global_model.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dio_database.instance().initDio();
  setWindowTitle('Flutter Fullscreen App');
  setWindowMinSize(const Size(800, 600)); // 设置最小窗口大小
  setWindowMaxSize(const Size(1920, 1080)); // 设置最大窗口大小
  setWindowFrame(Rect.zero); // 将窗口移动到屏幕左上角
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<GlobalModel>(
        create: (context) => GlobalModel(),
        child: OKToast(
          child: MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            home: const LoginPage(),//MobilePage()
              ),
        ));
  }
}
