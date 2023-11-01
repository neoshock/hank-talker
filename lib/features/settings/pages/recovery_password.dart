import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/features/settings/pages/settings_page.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
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
          title: 'Recuperar Contraseña', showBackButton: true),
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
                    Text(
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
                  'Recuperar Contraseña',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
