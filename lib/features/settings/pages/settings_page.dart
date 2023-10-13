import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        //padding: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  CustomBackButton(context, () {
                    Navigator.pop(context);
                  }),
                  SizedBox(width: 95), // Espacio entre el botón y el texto
                  Text(
                    'Ajustes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // Espacio entre el texto y el primer ListTile
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 213, 231, 223), // Color del borde gris claro
                  width: 1.0, // Ancho del borde
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(10)), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: ListTile(
                  //tileColor:
                  //    Colors.transparent, // Fondo del ListTile transparente
                  title: Text(
                    'País',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  subtitle: Row(
                    children: [
                      SizedBox(height: 50),
                      Image.asset(
                        'assets/images/ecuador_logo.png', // Ruta de la imagen de Ecuador
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 20), // Espaciado entre el logo y el texto
                      Text(
                        'Ecuador',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Acción cuando se hace clic en este ListTile
                  },
                ),
              ),
            ),

            SizedBox(height: 40), // Espacio entre el primer y segundo ListTile
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Fondo blanco
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 213, 231, 223), // Color del borde gris claro
                  width: 1.0, // Ancho del borde
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(10)), // Bordes redondeados
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0), // Agrega espacio superior
                child: ListTile(
                  title: Text(
                    'Otros Ajustes',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  subtitle: Column(
                    children: [
                      ListTile(
                        title: Text('Notificaciones'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                      ListTile(
                        title: Text('Política de Privacidad'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Acción cuando se hace clic en "Política de Privacidad"
                        },
                      ),
                      ListTile(
                        title: Text('Terminos y Condiciones'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Acción cuando se hace clic en "Terminos y Condiciones"
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Acción cuando se hace clic en "Otros Ajustes"
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
