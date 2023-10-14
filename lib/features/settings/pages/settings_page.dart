import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Ajustes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leadingWidth: 76,
          leading: Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.all(3),
            child: CustomBackButton(context, () {
              Navigator.pop(context);
            }),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            //padding: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                    height: 30), // Espacio entre el texto y el primer ListTile
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo blanco
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 213, 231, 223), // Color del borde gris claro
                      width: 1.0, // Ancho del borde
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)), // Bordes redondeados
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: ListTile(
                      //tileColor:
                      //    Colors.transparent, // Fondo del ListTile transparente
                      title: const Text(
                        'País',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      subtitle: Row(
                        children: [
                          const SizedBox(height: 50),
                          Image.asset(
                            'assets/images/ecuador_logo.png', // Ruta de la imagen de Ecuador
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(
                              width: 20), // Espaciado entre el logo y el texto
                          const Text(
                            'Ecuador',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Acción cuando se hace clic en este ListTile
                      },
                    ),
                  ),
                ),

                const SizedBox(
                    height: 40), // Espacio entre el primer y segundo ListTile
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo blanco
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 213, 231, 223), // Color del borde gris claro
                      width: 1.0, // Ancho del borde
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)), // Bordes redondeados
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0), // Agrega espacio superior
                    child: ListTile(
                      title: const Text(
                        'Otros Ajustes',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      subtitle: Column(
                        children: [
                          ListTile(
                            title: const Text('Notificaciones'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                          ),
                          ListTile(
                            title: const Text('Política de Privacidad'),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              // Acción cuando se hace clic en "Política de Privacidad"
                            },
                          ),
                          ListTile(
                            title: const Text('Terminos y Condiciones'),
                            trailing: const Icon(Icons.arrow_forward),
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
        ));
  }
}
