import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Hola, Juan!',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('¿Qué idioma local te gustaría aprender?',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ],
            )),
        Image.asset('assets/images/Ilustration - Home Page.png')
      ],
    );
  }
}
