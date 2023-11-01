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
            padding: EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
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
                            const Icon(PhosphorIcons.lock),
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
                            const Icon(PhosphorIcons.lock),
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
                            const Icon(PhosphorIcons.lock),
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
                              () => ChangePassword(), 'Cambiar Contraseña'),
                        ),
                      ],
                    )))));
  }
}
