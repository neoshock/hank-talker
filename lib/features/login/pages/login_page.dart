import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool showPassword = false;

  void login() {
    if (formGlobalKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // print("No Validado"); // ejecutando
    }
  }

  // validateEmail

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Agrega la imagen centrada en la parte superior
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    20), // Ajusta el margen inferior según sea necesario
                            child: Image.asset(
                              'assets/images/Logo.png', // Ruta de la imagen en tus assets
                            ),
                          ),
                        ),

                        CustomTextImputWithLabel(
                          'Correo electrónico',
                          emailController,
                          TextInputType.emailAddress,
                          context,
                          const Icon(PhosphorIcons.envelope),
                          (value) {
                            if (value == null || value == '') {
                              return 'Correo electrónico es requerido';
                            }
                            String emailPattern =
                                r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                            RegExp regex = RegExp(emailPattern);
                            if (!regex.hasMatch(value!)) {
                              return 'Ingrese un correo electrónico válido';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(PhosphorIcons.lock),
                            'Contraseña', (value) {
                          if (value == null || value == '') {
                            return 'Contraseña es requerida';
                          }
                          return null;
                        }, () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        }, showPassword),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: CusttomButtonRounded(
                              context, () => login(), 'Iniciar Sesión'),
                        ),
                        const SizedBox(height: 60),
                        GestureDetector(
                          onTap: () {
                            //  print("Registrarse Tocado"); // ejecutando
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: '¿No tienes una cuenta? ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Registrarse',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))));
  }
}
