import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/features/register/pages/register_email.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class RegisterNane extends StatefulWidget {
  @override
  _RegisterNaneState createState() => _RegisterNaneState();
}

class _RegisterNaneState extends State<RegisterNane> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void Name() {
    // Acción para el botón "Siguiente"
    // Implementa la lógica para guardar los nombres y apellidos
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterEmail()),
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
                SizedBox(
                    height:
                        15), // Espacio adicional arriba del botón de retroceso
                Row(
                  children: [
                    CustomBackButton(context, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BirthDatePage()),
                      );
                    })
                  ],
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Ayúdanos con tus Nombres',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomTextImputWithLabel(
                  'Nombres',
                  nameController,
                  TextInputType.name,
                  context,
                  Icon(Icons.person),
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nombres requeridos';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomTextImputWithLabel(
                  'Apellidos',
                  lastNameController,
                  TextInputType.name,
                  context,
                  Icon(Icons.person),
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Apellidos requeridos';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                CusttomButtonRounded(context, Name, 'Siguiente'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}   // Compare this snippet from lib/features/register/pages/register_nac.dart: