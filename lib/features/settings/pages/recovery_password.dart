import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({Key? key});

  @override
  _RecoveryPasswordPageState createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  Future<void> recoveryPassword() async {
    if (formGlobalKey.currentState!.validate()) {
      final authResponse = await context
          .read<AuthProvider>()
          .recoveryPassword(emailController.text);
      if (authResponse.code == 200) {
        // ignore: use_build_context_synchronously
        await showSuccessDialog('Atención!', authResponse.message, context);

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        await showErrorDialog(
            'Hubo un problema', authResponse.message, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context,
          title: 'Recuperar contraseña', showBackButton: true),
      body: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Loren ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextImputWithLabel(
                      'Correo electrónico',
                      emailController,
                      TextInputType.emailAddress,
                      context,
                      const Icon(
                        PhosphorIcons.envelope,
                        color: Colors.grey,
                      ),
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
                      false,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: CusttomButtonRounded(
                  context,
                  recoveryPassword,
                  'Recuperar contraseña',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
