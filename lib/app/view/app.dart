import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => RegiProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider())
        ],
        builder: (context, child) {
          return MaterialApp(
            theme: CustomThemeData.lightTheme,
            darkTheme: CustomThemeData.darkTheme,
            home: Provider.of<AuthProvider>(context).isAuth
                ? const BottomBar()
                : const WelcomePage(),
          );
        });
  }
}
