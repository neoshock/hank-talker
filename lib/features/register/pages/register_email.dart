import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nane.dart';
import 'package:hank_talker_mobile/features/register/pages/register_password.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:provider/provider.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final TextEditingController emailController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  void email(BuildContext context) {
    // Acción para el botón "Siguiente"
    // Implementa la lógica para guardar el correo electrónico
    if (formGlobalKey.currentState!.validate()) {
      intoEmail();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPassword()),
      );
    } else {
      // print("No Validado"); // ejecutando
    }
  }

  void intoEmail() {
    context.read<RegiProvider>().enterEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context, showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        '¿Cuál es tu correo electrónico?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextImputWithOutLabel(
                      emailController,
                      TextInputType.emailAddress,
                      context,
                      const Icon(Icons.email),
                      'john.Doe@gmail.com',
                      (value) {
                        if (value == null || value == '') {
                          print("Validating email");
                          return 'Correo electrónico es requerido';
                        }
                        final String emailPattern =
                            r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                        final RegExp regex = RegExp(emailPattern);
                        if (!regex.hasMatch(value!)) {
                          return 'Ingrese un correo electrónico válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CusttomButtonRounded(
                          context, () => email(context), 'Siguiente'),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
