import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/register/pages/register_email.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:provider/provider.dart';

class RegisterNane extends StatefulWidget {
  @override
  _RegisterNaneState createState() => _RegisterNaneState();
}

class _RegisterNaneState extends State<RegisterNane> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  final RegiProvider regiProvider = RegiProvider();

  void Name() {
    // Acción para el botón "Siguiente"
    // Implementa la lógica para guardar los nombres y apellidos
    if (formGlobalKey.currentState!.validate()) {
      intoNames();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterEmail()),
      );
    } else {
      // print("No Validado"); // ejecutando
    }
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
                        'Ayúdanos con tus nombres',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextImputWithLabel(
                        'Nombres',
                        nameController,
                        TextInputType.name,
                        context,
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ), (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nombres requeridos';
                      }
                      // validate if the name is valid and not use characters special
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                        return 'Nombres no válidos';
                      }
                      if (value.length < 3) {
                        return 'El nombre debe tener al menos 3 caracteres';
                      }
                      if (value.length > 50) {
                        return 'El nombre no puede tener más de 50 caracteres';
                      }
                      return null;
                    }, false),
                    const SizedBox(height: 20),
                    CustomTextImputWithLabel(
                        'Apellidos',
                        lastNameController,
                        TextInputType.name,
                        context,
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ), (value) {
                      if (value == null || value.isEmpty) {
                        return 'Apellidos requeridos';
                      }
                      // validate if the last name is valid and not use characters special
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                        return 'Apellidos no válidos';
                      }
                      if (value.length < 3) {
                        return 'El apellido debe tener al menos 3 caracteres';
                      }
                      if (value.length > 50) {
                        return 'El apellido no puede tener más de 50 caracteres';
                      }
                      return null;
                    }, false),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CusttomButtonRounded(context, Name, 'Siguiente'),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void intoNames() {
    context
        .read<RegiProvider>()
        .enterNames(nameController.text, lastNameController.text);
  }
}   // Compare this snippet from lib/features/register/pages/register_nac.dart: