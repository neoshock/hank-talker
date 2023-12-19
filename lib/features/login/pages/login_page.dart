import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/features/settings/pages/recovery_password.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
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

  Future<void> login() async {
    if (formGlobalKey.currentState!.validate()) {
      final loginResponse = await context
          .read<AuthProvider>()
          .login(emailController.text, passwordController.text);
      if (loginResponse.code == 200) {
        // ignore: use_build_context_synchronously
        await showSuccessDialog('Bienvenido', loginResponse.message, context);

        // ignore: use_build_context_synchronously
        await Navigator.pushAndRemoveUntil(
          context,
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(builder: (context) => const BottomBar()),
          (Route<dynamic> route) => false,
        );
      } else {
        // ignore: use_build_context_synchronously
        await showErrorDialog(
            'Hubo un problema', loginResponse.message, context);
      }
    }
  }

  // validateEmail

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: SafeArea(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Agrega la imagen centrada en la parte superior
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom:
                                    20), // Ajusta el margen inferior según sea necesario
                            child: Image.asset(
                              'assets/images/Logo_HT_general.png',
                              fit: BoxFit.cover,
                              width: MediaQuery.sizeOf(
                                    context,
                                  ).width *
                                  0.6,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomTextImputWithLabel(
                            'Correo electrónico',
                            emailController,
                            TextInputType.emailAddress,
                            context,
                            const Icon(
                              PhosphorIcons.envelope,
                              color: Colors.grey,
                            ), (value) {
                          if (value == null || value == '') {
                            return 'Correo electrónico es requerido';
                          }
                          const emailPattern =
                              r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                          final regex = RegExp(emailPattern);
                          if (!regex.hasMatch(value!)) {
                            return 'Ingrese un correo electrónico válido';
                          }
                          return null;
                        }, false),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(
                              PhosphorIcons.lock,
                              color: Colors.grey,
                            ),
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
                            context,
                            login,
                            'Iniciar sesión',
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                // ignore: inference_failure_on_instance_creation
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RecoveryPasswordPage()));
                          },
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        GestureDetector(
                          onTap: () {
                            //  print("Registrarse Tocado"); // ejecutando
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
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
