import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
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

  void login() async {
    if (formGlobalKey.currentState!.validate()) {
      final loginResponse = await context
          .read<AuthProvider>()
          .login(emailController.text, passwordController.text);
      if (loginResponse.code == 200) {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Bienvenido'),
                content: Text(loginResponse.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              );
            });

        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
          (Route<dynamic> route) => false,
        );
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(loginResponse.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              );
            });
      }
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
                        }, true, showPassword),
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
