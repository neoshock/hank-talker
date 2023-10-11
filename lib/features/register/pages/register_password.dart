import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RegisterPassword extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;
  void Name() {
    // Acción para el botón "Siguiente"
    // Implementa la lógica para guardar los nombres y apellidos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [CustomBackButton(context, () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Configura tu contraseña',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
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
              /* setState(() {
                showPassword = !showPassword;
              });*/
            }, showPassword),
            SizedBox(height: 40),
            CusttomButtonRounded(context, Name, 'Comenzar'),
          ],
        ),
      ),
    );
  }
}
