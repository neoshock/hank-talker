import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CustomStartedScreen extends StatefulWidget {
  const CustomStartedScreen({Key? key}) : super(key: key);

  @override
  _CustomStartedScreenState createState() => _CustomStartedScreenState();
}

class _CustomStartedScreenState extends State<CustomStartedScreen> {
  Future<void> autoLogin() async {
    final authProvider = context.read<AuthProvider>();
    final response = await authProvider.autoLogin();
    if (response.code == 200) {
      // set 2 seconds to show the loading screen
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushAndRemoveUntil(
        context,
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(builder: (context) => const BottomBar()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
          LottieBuilder.asset(
              'assets/animations/Animation - 1710271718521.json'),
          Text(
            'Cargando...',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    ));
  }
}
