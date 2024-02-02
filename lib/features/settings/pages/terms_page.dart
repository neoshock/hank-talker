import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context,
          title: 'Términos y condiciones', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Términos y Condiciones de Uso de HandTalker',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Bienvenido a HandTalker, la aplicación para aprender lenguaje de señas. Al utilizar nuestra aplicación, usted acepta los siguientes términos y condiciones, que junto con nuestra política de privacidad rigen la relación de HandTalker con usted en relación con esta aplicación. Si no está de acuerdo con alguno de estos términos y condiciones, no utilice nuestra aplicación.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              '1. Aceptación de los Términos',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Al acceder y utilizar HandTalker, usted acuerda estar sujeto a estos términos y condiciones',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              '2. Modificación de los Términos',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'HandTalker se reserva el derecho de modificar estos términos y condiciones en cualquier momento. Usted será notificado de cualquier cambio en los términos y condiciones a través de la aplicación. El uso continuado de la aplicación después de la notificación de los cambios constituirá su aceptación de dichos cambios.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              '3. Uso de la Aplicación',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Usted acepta utilizar la aplicación únicamente para fines legales y de una manera que no infrinja los derechos de, restrinja o inhiba el uso y disfrute de la aplicación por parte de cualquier tercero. Esto incluye conductas que sean ilegales o que puedan dañar, deshabilitar, sobrecargar o perjudicar el funcionamiento de la aplicación de cualquier manera, así como el envío de correo electrónico no deseado.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              '4. Contenido de la Aplicación',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'El contenido de la aplicación se proporciona únicamente con fines informativos. No constituye asesoramiento profesional ni recomendación de ningún tipo. No nos hacemos responsables de ninguna pérdida que pueda surgir del uso de la aplicación o de cualquier información contenida en ella.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            Text(
              '5. Propiedad Intelectual',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Todo el contenido de la aplicación, incluyendo, entre otros, texto, gráficos, logotipos, iconos de botones, imágenes, clips de audio, descargas digitales, compilaciones de datos y software, es propiedad de HandTalker y está protegido por las leyes de derechos de autor internacionales. No puede extraer y/o reutilizar sistemáticamente partes del contenido de la aplicación sin el permiso expreso por escrito de HandTalker.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
