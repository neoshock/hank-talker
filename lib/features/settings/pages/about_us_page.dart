import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbarWidget(context, title: 'Acerca de', showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Acerca de HandTalker',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'HandTalker es una aplicación móvil que permite a los usuarios aprender la lengua de señas de una manera fácil y divertida. La aplicación está dirigida a personas con discapacidad auditiva y a personas que desean aprender el lenguaje de señas.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Lideres de proyecto',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Andy Ninasunta',
              role: 'Lider de proyecto',
              imageUrl: 'assets/images/contributors/andy.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/andy-ninasunta/',
              email: '',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Josue Alcivar',
              role: 'Lider de desarrollo movil',
              imageUrl: 'assets/images/contributors/lino.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/josue-alcivar/',
              email: 'lino.alcivar2017@uteq.edu.ec',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Celso Turriago',
              role: 'Lider de recursos',
              imageUrl: 'assets/images/contributors/celso.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 20),
            Text(
              'Desarrolladores',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Heydi Litardo',
              role: 'Mobile Developer',
              imageUrl: 'assets/images/contributors/armocito.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Cristopher Zambrano',
              role: 'Mobile Developer',
              imageUrl: 'assets/images/category.png',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Roberto Suarez',
              role: 'Full Stack Developer',
              imageUrl: 'assets/images/contributors/roberto.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Jean David Cabrera',
              role: 'Frontend Developer',
              imageUrl: 'assets/images/contributors/jean.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Rino Arias',
              role: 'Backend Developer',
              imageUrl: 'assets/images/contributors/rino.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 20),
            Text(
              'Recursos didacticos',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Kelvin Estrada',
              role: 'Diseñador de niveles',
              imageUrl: 'assets/images/contributors/kelvin.jpeg',
              linkedinUrl: 'https://www.linkedin.com/in/jorge-lino-9b1b3b1b9/',
            ),
            const SizedBox(height: 10),
            Text(
              'Dirigido por',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            // Orlando Erazo, Director del proyecto de vinculación
            const SizedBox(height: 10),
            const AboutDeveloperItem(
              name: 'Orlando Erazo',
              role: 'Director del proyecto de vinculación',
              imageUrl: 'assets/images/category.png',
              email: '',
            ),
            const SizedBox(height: 20),
            Text(
              'En la administración de',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Eduardo Díaz (Rector)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Jenny Torres (Vicerrectora Académica)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Roberto Pico (Vicerrector Administrativo)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Leonardo Matute (Director de Vinculación)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Patricio Alcócer (Decano)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Stalin Carreño (Unidad de TIC)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Con la colaboración de:',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Rosa Andrade (Directora Desarrollo Social GADM Quevedo)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Sergio Yépez (Colaborador Desarrollo Social GADM Quevedo)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            //             © 2023 Universidad Técnica Estatal de Quevedo
            // Campus "Ingeniero Manuel Agustín Haz Álvarez"
            // Av. Quito km. 1 1/2 vía a Santo Domingo de los Tsáchilas
            // (+593) 5 3702-220 Ext. 8039
            // Email: info@uteq.edu.ec
            // Quevedo - Los Ríos - Ecuador
            // www.uteq.edu.ec
            const SizedBox(height: 30),
            Text(
              '© 2023 Universidad Técnica Estatal de Quevedo',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Campus "Ingeniero Manuel Agustín Haz Álvarez"',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Av. Quito km. 1 1/2 vía a Santo Domingo de los Tsáchilas',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '(+593) 5 3702-220 Ext. 8039',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Email: info@uteq.edu.ec',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Quevedo - Los Ríos - Ecuador',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'www.uteq.edu.ec',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDeveloperItem extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final String? linkedinUrl;
  final String? email;
  const AboutDeveloperItem(
      {Key? key,
      required this.name,
      required this.role,
      required this.imageUrl,
      this.linkedinUrl,
      this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const SizedBox(
            height: 270,
            width: double.infinity,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 175,
            child: Text(
              name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Positioned(
            top: 200,
            child: Text(
              role,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Positioned(
            bottom: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (linkedinUrl != null)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(PhosphorIcons.linkedin_logo),
                  ),
                if (email != null)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
