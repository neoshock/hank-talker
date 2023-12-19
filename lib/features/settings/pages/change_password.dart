// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordActualController = TextEditingController();
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool showActualPassword = false;
  bool showNewPassword = false;
  bool showRepeatPassword = false;

  Future<void> ChangePassword() async {
    if (formGlobalKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(context,
            title: 'Cambiar Contraseña', showBackButton: true),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'La contraseña debe tener al menos seis caracteres e incluir una combinación de números, letras y caracteres especiales(!@%)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomImputPassword(
                            passwordActualController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(
                              PhosphorIcons.lock,
                              color: Colors.grey,
                            ),
                            'Contraseña actual', (value) {
                          if (value == null || value == '') {
                            return 'Contraseña es requerida';
                          }
                          return null;
                        }, () {
                          setState(() {
                            showActualPassword = !showActualPassword;
                          });
                        }, true, showActualPassword),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordNewController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(
                              PhosphorIcons.lock,
                              color: Colors.grey,
                            ),
                            'Contraseña nueva', (value) {
                          if (value == null || value == '') {
                            return 'Contraseña es requerida';
                          }
                          return null;
                        }, () {
                          setState(() {
                            showNewPassword = !showNewPassword;
                          });
                        }, true, showNewPassword),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordRepeatController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(
                              PhosphorIcons.lock,
                              color: Colors.grey,
                            ),
                            'Repetir contraseña actual', (value) {
                          if (value == null || value == '') {
                            return 'Contraseña es requerida';
                          }
                          return null;
                        }, () {
                          setState(() {
                            showRepeatPassword = !showRepeatPassword;
                          });
                        }, true, showRepeatPassword),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: CusttomButtonRounded(context,
                              ChangePassword, 'Cambiar Contraseña',),
                        ),
                      ],
                    )))));
  }
}
