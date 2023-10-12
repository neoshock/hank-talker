import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_email.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
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
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomBackButton(context, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterEmail()),
                  );
                })
              ],
            ),
            const SizedBox(height: 45),
            const Center(
              child: Text(
                'Configura tu contraseña',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 40),
            CusttomButtonRounded(context, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }, 'Comenzar'),
          ],
        ),
      ),
    )));
  }
}
