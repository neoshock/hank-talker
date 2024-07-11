import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nane.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class BirthDatePage extends StatefulWidget {
  @override
  _BirthDatePageState createState() => _BirthDatePageState();
}

class _BirthDatePageState extends State<BirthDatePage> {
  final TextEditingController dateController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    dateController.addListener(_formatBirthDate);
  }

  void _formatBirthDate() {
    final text = dateController.text;
    if (text.isNotEmpty && text.length <= 10) {
      var newText =
          text.replaceAll(RegExp(r'/'), ''); // Remueve las barras existentes

      // Agrega las barras en las posiciones correctas
      if (newText.length > 2) {
        newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
      }
      if (newText.length > 5) {
        newText = '${newText.substring(0, 5)}/${newText.substring(5)}';
      }

      // Actualiza el controlador si el texto ha cambiado
      if (newText != text) {
        dateController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
  }

  @override
  void dispose() {
    dateController
      ..dispose()
      ..removeListener(_formatBirthDate);
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text =
          '${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}';
    }
  }

  void registerBirthDate(BuildContext context) {
    // Validate the date and set the error message if it's not valid
    final validationResult = _validateDate(dateController.text);
    if (validationResult == null) {
      setState(() {
        errorMessage = null;
      });
      context.read<RegiProvider>().enterDateBirthday(dateController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterNane(),
        ),
      );
    } else {
      setState(() {
        errorMessage = validationResult;
      });
    }
  }

  String? _validateDate(String value) {
    if (value.isEmpty) {
      return 'Por favor ingrese su fecha de nacimiento';
    }
    final dateRegExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Ingrese la fecha en el formato DD/MM/AAAA';
    }
    final parts = value.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) {
      return 'Fecha no válida';
    }
    final birthDate = DateTime(year, month, day);
    if (birthDate.isAfter(DateTime.now())) {
      return 'La fecha de nacimiento no puede ser en el futuro';
    }
    if (birthDate.isBefore(DateTime(1900))) {
      return 'Fecha de nacimiento demasiado antigua';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context, showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¿Cuál es tu fecha de nacimiento?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 66,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: dateController,
                              keyboardType: TextInputType.datetime,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                hintText: 'DD/MM/YYYY',
                                border: InputBorder.none,
                                counterText: '',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: const Icon(Icons.calendar_today,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Text(
                        errorMessage!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 15,
                        ),
                      ),
                    )
                  else
                    const SizedBox(height: 15),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: CusttomButtonRounded(
                      context,
                      () => registerBirthDate(context),
                      'Siguiente',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
