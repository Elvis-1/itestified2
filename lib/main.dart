import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/providers.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/routes/routes.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/display_screen.dart';
import 'package:itestified/src/features/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:itestified/src/config/service_locators.dart' as service_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.setupLocator();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeViewmodel>(context);
    return ScreenUtilInit(
      designSize: const Size(430.0, 812.0),
      builder: (context, child) {
        return MaterialApp(
            theme: appTheme.themeData,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            onGenerateRoute: onGenerateRoute,
            home:
                //DisplayScreen()
                const SplashScreen());
      },
    );
  }
}
