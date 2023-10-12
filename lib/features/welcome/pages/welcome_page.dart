import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/welcome/widgets/welcome_smooth_page_widget.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Image.asset('assets/images/Logo.png'),
              const Spacer(),
              Container(
                width: MediaQuery.sizeOf(
                  context,
                ).width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  Container(
                    width: 80,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const WelcomeSmoothPageWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonOutLine(context, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }, 'Comenzar'),
                  SizedBox(height: 30)
                ]),
              )
            ],
          )),
    );
  }
}
