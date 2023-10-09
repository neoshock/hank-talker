import 'package:flutter/material.dart';

Widget CusttomButtonRounded(
    BuildContext context, Function onPressed, String title) {
  return SizedBox(
    width: double.infinity,
    height: 54,
    child: ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: const Color(0xFFF1F5F9)),
      ),
    ),
  );
}

Widget CustomButtonOutLine(
    BuildContext context, Function onPressed, String title) {
  return SizedBox(
    width: double.infinity,
    height: 54,
    child: OutlinedButton(
      onPressed: () => onPressed(),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Theme.of(context).primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(title, style: Theme.of(context).textTheme.displaySmall),
    ),
  );
}

Widget CustomButtonElevated(
    Color color, BuildContext context, Function onPressed, String title) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.6),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(3, 6),
        ),
      ],
    ),
    height: 54,
    child: ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(title, style: Theme.of(context).textTheme.displaySmall),
    ),
  );
}
