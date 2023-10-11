import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class RegisterEmail extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();

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
                '¿Cuál es tu correo electrónico?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            CustomTextImputWithOutLabel(
              emailcontroller,
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
            CusttomButtonRounded(context, Name, 'Siguiente'),
          ],
        ),
      ),
    );
  }
}
