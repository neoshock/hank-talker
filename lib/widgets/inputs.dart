import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

Widget CustomTextImputWithLabel(
    String label,
    TextEditingController controller,
    TextInputType keyboardType,
    BuildContext context,
    Icon icon,
    Function validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.bodyLarge),
      const SizedBox(height: 5),
      SizedBox(
        height: 54,
        child: TextFormField(
          controller: controller,
          validator: validator as String? Function(String?)?,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.error)),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.error),
            fillColor: Theme.of(context).colorScheme.surface,
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
    Function validator,
    bool showPassword) {
  return SizedBox(
    height: 54,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator as String? Function(String?)?,
      obscureText: !showPassword
          ? true
          : false, // If password is not visible then it's value will be true
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
        suffixIcon: IconButton(
          onPressed: () {
            showPassword = !showPassword;
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
  );
}
