import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';

Widget CustomTextImputWithLabel(
    String label,
    TextEditingController controller,
    TextInputType keyboardType,
    BuildContext context,
    Icon icon,
    String? Function(String?)? validator,
    bool readOnly) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.bodyLarge),
      const SizedBox(height: 5),
      SizedBox(
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(20)),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.error),
            fillColor: Theme.of(context).colorScheme.onPrimary,
            hintText: label,
            prefixIconColor: Theme.of(context).colorScheme.primaryContainer,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget CustomTextImputWithOutLabel(
    TextEditingController controller,
    TextInputType keyboardType,
    BuildContext context,
    Icon icon,
    String hintText,
    String? Function(String?)? validator) {
  return SizedBox(
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.error),
        fillColor: Theme.of(context).colorScheme.onPrimary,
        hintText: hintText,
        prefixIconColor: Theme.of(context).colorScheme.primaryContainer,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget CustomImputWithSuffixIcon(
    TextEditingController controller,
    TextInputType keyboardType,
    BuildContext context,
    Icon icon,
    String hintText,
    Icon suffixIcon,
    Function validator) {
  return SizedBox(
    height: 54,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator as String? Function(String?)?,
      decoration: InputDecoration(
        filled: true,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.error),
        fillColor: Theme.of(context).colorScheme.surface,
        hintText: hintText,
        prefixIconColor: Theme.of(context).colorScheme.primaryContainer,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}

Widget CustomImputPassword(
    TextEditingController controller,
    TextInputType keyboardType,
    BuildContext context,
    Icon icon,
    String hintText,
    String? Function(String?)? validator,
    Function onPressed,
    bool label,
    bool showPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label
          ? Text(hintText, style: Theme.of(context).textTheme.bodyLarge)
          : SizedBox(),
      const SizedBox(height: 5),
      SizedBox(
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: !showPassword,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error),
                borderRadius: BorderRadius.circular(20)),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.error),
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: hintText,
            prefixIconColor: Theme.of(context).colorScheme.primaryContainer,
            prefixIcon: icon,
            suffixIcon: IconButton(
              onPressed: () {
                onPressed();
              },
              icon: Icon(
                showPassword ? PhosphorIcons.eye_slash : PhosphorIcons.eye,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      )
    ],
  );
}
