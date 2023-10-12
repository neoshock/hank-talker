import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nane.dart';
import 'package:hank_talker_mobile/features/register/pages/register_password.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final TextEditingController emailController = TextEditingController();

  void email(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPassword()),
    );
  }

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
                SizedBox(height: 15),
                Row(
                  children: [
                    CustomBackButton(context, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterNane()),
                      );
                    })
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    '¿Cuál es tu correo electrónico?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomTextImputWithOutLabel(
                  emailController,
                  TextInputType.emailAddress,
                  context,
                  Icon(Icons.email),
                  'john.Doe@gmail.com',
                  (value) {
                    if (value == null || value == '') {
                      print("Validating email");
                      return 'Correo electrónico es requerido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                CusttomButtonRounded(
                    context, () => email(context), 'Siguiente'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
