// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_email.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({Key? key}) : super(key: key);

  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  final passwordController = TextEditingController(text: '');
  final RegiProvider regiProvider = RegiProvider();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(context, showBackButton: true),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Configura tu contraseña',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  r'La contraseña debe tener al menos seis caracteres e incluir una combinación de números, letras mayúsculas, minúscula y al menos 2 caracteres especiales (!@#$&*~).',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
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
                  if (value == null || value.isEmpty) {
                    return 'Contraseña es requerida';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  const pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]?.*?[!@#\$&*~]?).{6,}$';
                  final regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return r'Incluir números, letras y uno o dos caracteres especiales (!@#$&*~)';
                  }
                  return null;
                }, () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                }, false, showPassword),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CusttomButtonRounded(
                    context,
                    intoPassword,
                    'Comenzar',
                  ),
                )
              ],
            ),
          ),
        )));
  }

  Future<void> intoPassword() async {
    final result =
        await context.read<RegiProvider>().register(passwordController.text);
    if (result.code == 200) {
      // ignore: use_build_context_synchronously
      await showSuccessDialog('¡Felicidades!', result.message, context);
      // ignore: use_build_context_synchronously
      await Navigator.pushAndRemoveUntil(
        context,
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    } else {
      // ignore: use_build_context_synchronously
      await showErrorDialog('Error', result.message, context);
    }
  }
}
