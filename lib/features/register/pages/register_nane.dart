import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class RegisterNane extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void Name() {
    // Acción para el botón "Siguiente"
    // Implementa la lógica para guardar los nombres y apellidos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Acción al presionar el botón de regresar
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    );
  }
}
