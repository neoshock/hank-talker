// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/content/provider/content_provider.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)), // Espera 1 segundo
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AuthProvider()),
              ChangeNotifierProvider(create: (_) => RegiProvider()),
              ChangeNotifierProvider(create: (_) => ProfileProvider()),
              ChangeNotifierProvider(create: (_) => LearningProvider()),
              ChangeNotifierProvider(create: (_) => ContentProvider()),
            ],
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: CustomThemeData.lightTheme,
                home: Provider.of<AuthProvider>(context).isAuth
                    ? const BottomBar()
                    : const WelcomePage(),
              );
            },
          );
        } else {
          // Muestra un indicador de carga mientras espera
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: CustomThemeData.lightTheme,
            home: Scaffold(
              backgroundColor: const Color(0xFF4FA53A),
              body: Center(
                  child: Image.asset(
                'assets/images/logo_splash.png',
                width: 300,
              )),
            ),
          );
        }
      },
    );
  }
}
