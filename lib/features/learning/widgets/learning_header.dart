import 'package:flutter/material.dart';

class LearningHeader extends StatelessWidget {
  const LearningHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.27,
        decoration: const BoxDecoration(
            color: Color(0XFF3A85A5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿Qué deseas aprender?',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: Colors.white,
                                )),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Aprende lengua de señas rápido y fácil',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ))
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/clouds.png')
          ],
        ));
  }
}
