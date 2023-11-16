import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// show image network if file type is image
// show svg network if file type is svg
Widget FileTypeInterceptor(String fileUrl) {
  if (fileUrl.contains('.svg')) {
    return SvgPicture.network(
      fileUrl,
      placeholderBuilder: (BuildContext context) => Container(
          padding: const EdgeInsets.all(15),
          child: const CircularProgressIndicator()),
    );
  } else {
    return Image.network(
      fileUrl,
      fit: BoxFit.cover,
    );
  }
}
