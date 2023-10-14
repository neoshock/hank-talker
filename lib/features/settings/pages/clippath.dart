import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nac.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class MyClippath extends StatelessWidget {
  const MyClippath({Key? key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.96,
              ),
              ClipPath(
                clipper: BezierClipper(),
                child: Container(
                  color: color,
                  height: 400,
                ),
              ),
              Positioned(
                top: 90,
                child: Image.asset(
                  'assets/images/welcome_page.png',
                  height: 255,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 375),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Create un nuevo',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Center(
                      child: Text(
                        'perfil',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Ahora!',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        '¡Crea un perfil para guardar tu progreso de aprendizaje y sigue aprendiendo gratis!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15, //posición vertical de los botones
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Regresar',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    CusttomButtonRounded(
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BirthDatePage()),
                        );
                      },
                      'Comenzar',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 1.1,
      size.width,
      size.height * 0.75,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
