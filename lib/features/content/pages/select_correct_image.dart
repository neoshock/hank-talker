import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class SelectCorrectImage extends StatefulWidget {
  const SelectCorrectImage({required this.onCheckAnswer, super.key});

  final ValueSetter<String> onCheckAnswer;

  @override
  _SelectCorrectImageState createState() => _SelectCorrectImageState();
}

class _SelectCorrectImageState extends State<SelectCorrectImage> {
  int? currentImage;
  List<String> images = [
    'assets/images/Logo.png',
    'assets/images/Logo.png',
    'assets/images/Logo.png',
    'assets/images/Logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selecciona la imagen correcta',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            '¿Cuál es el numero uno?',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 45,
          ),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentImage = index;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.25),
                          blurRadius: 6,
                        )
                      ],
                      color: currentImage == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          )),
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CusttomButtonRounded(context, () {
                String answer = "La respuesta es 42"; // Tu string
                widget.onCheckAnswer(
                    answer); // Llama a la función de retorno de llamada con el string como argumento
              }, 'Revisar respuesta'))
        ],
      ),
    );
  }
}
