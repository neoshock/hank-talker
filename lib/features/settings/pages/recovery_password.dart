import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({Key? key});

  @override
  _RecoveryPasswordPageState createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  TextEditingController emailController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  Future<void> RecoveryPassword() async {
    if (formGlobalKey.currentState!.validate()) {}
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
                padding: EdgeInsets.all(15),
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
              child: Container(
                width: double.infinity,
                child: CusttomButtonRounded(
                  context,
                  () => RecoveryPassword(),
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
