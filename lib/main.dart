import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itestified/src/config/providers.dart';
import 'package:itestified/src/config/theme/app_theme.dart';
import 'package:itestified/src/core/routes/routes.dart';
import 'package:itestified/src/features/auth/presentation/screens/otp_screen.dart';
import 'package:itestified/src/features/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:itestified/src/config/service_locators.dart' as service_locator;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await service_locator.setupLocator();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.portraitUp, // Optional: Keep portrait enabled
//   ]);
//   runApp(MultiProvider(providers: providers, child: const MyApp()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await service_locator.setupLocator();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    runApp(MultiProvider(providers: providers, child: const MyApp()));
  } catch (e, stackTrace) {
    debugPrint('💥 Startup error: $e\n$stackTrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppThemes.lightTheme, // Light theme
        darkTheme: AppThemes.darkTheme, // Dark theme
        themeMode: ThemeMode.system, // Follow system theme
        debugShowCheckedModeBanner: false,
        //  initialRoute: SplashScreen.routeName,
        onGenerateRoute: onGenerateRoute,
        home: //OTPScreen(args: Arguments(email: 'itiest@.com')));
            //DisplayScreen()
            const SplashScreen());

    // );
  }
}

// areas not yet responsive
// notifications
//
