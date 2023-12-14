import 'package:flutter/material.dart';
import './app/modules/modules.dart';
import './routes/pages.dart';
import 'package:get/get.dart';
import './core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initialize();
  // FirebaseHelper.initialize(); // uncomment this line if you want to use Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Base App",
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
    );
  }
}
