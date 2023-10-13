import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/register/pages/register_email.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomBackButton(context, () {
                          Navigator.pop(context);
                        })
                      ],
                    ),
                    const SizedBox(height: 45),
                    const Center(
                      child: Text(
                        'Ayúdanos con tus Nombres',
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
                      const Icon(Icons.person),
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nombres requeridos';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextImputWithLabel(
                      'Apellidos',
                      lastNameController,
                      TextInputType.name,
                      context,
                      const Icon(Icons.person),
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Apellidos requeridos';
                        }
                        return null;
                      },
                    ),
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