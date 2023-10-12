import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class RegisterPage extends StatelessWidget {
  void Register() {
    // Acciones al hacer clic en el botón "Comenzar" o "Atrás"
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.45,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(1000),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Image.asset(
                        'assets/images/welcome_page.png',
                        height: 250,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Text(
                          '¡Crea un perfil para guardar tu progreso de aprendizaje y sigue aprendiendo gratis!',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Regresar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        )),
                    CusttomButtonRounded(context, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BirthDatePage()),
                      );
                    }, 'Comenzar'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
