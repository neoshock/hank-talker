import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<Widget> fileTypeInterceptor(String fileUrl) async {
  try {
    if (fileUrl.contains('.svg')) {
      final svgPicture = SvgPicture.network(
        fileUrl,
        placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(15),
          child: const CircularProgressIndicator(),
        ),
      );
      return svgPicture;
    } else {
      final image = Image.network(
        fileUrl,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Icon(Icons.flag_circle_rounded, color: Colors.black);
        },
      );
      return image;
    }
  } catch (e) {
    // Manejar errores de conexión aquí
    print('Error al cargar el archivo: $e');
    return const Icon(Icons.error, color: Colors.red);
  }
}

class FileInterceptorWidget extends StatelessWidget {
  final String fileUrl;

  const FileInterceptorWidget({required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: fileTypeInterceptor(fileUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data ??
              const SizedBox(); // Mostrar el widget o un contenedor vacío en caso de error
        } else {
          // Puedes mostrar un indicador de carga mientras se carga el archivo
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
