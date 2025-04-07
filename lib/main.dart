import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'http/dio_instance.dart';
import 'models/global_model.dart';
import 'package:intellij_tourism_designer/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    fullScreen: false,
    skipTaskbar: false
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.maximize();
    await windowManager.show();
    //await windowManager.focus();
  });

  Dio_database.instance().initDio();

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<GlobalModel>(
        create: (context) => GlobalModel(),
        child: const OKToast(
          child: MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            home: LoginPage(),//MobilePage()
              ),
        ));
  }
}
