// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: BezierClipper(),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      decoration: BoxDecoration(color: color),
                    ),
                  ),
                  Image.asset(
                    'assets/images/welcome_page.png',
                    height: 255,
                  ),
                ],
              ),
              const Center(
                child: Text(
                  'Create un nuevo',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const Center(
                child: Text(
                  'perfil',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ahora!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                // ignore: lines_longer_than_80_chars, lines_longer_than_80_chars
                child: const Text(
                  '¡Crea un perfil para guardar tu progreso de aprendizaje y sigue aprendiendo gratis!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Regresar',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  CusttomButtonRounded(
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BirthDatePage()),
                      );
                    },
                    'Comenzar',
                  ),
                ],
              ),
            ],
          )),
        ));
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // ignore: cascade_invocations
    path
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(
        size.width * 0.65,
        size.height * 1.1,
        size.width,
        size.height * 0.75,
      )
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
