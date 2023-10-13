import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/theme_data.dart';
import 'package:hank_talker_mobile/core/register/providers/regi_provider.dart';
import 'package:hank_talker_mobile/features/register/pages/register_nane.dart';
import 'package:hank_talker_mobile/features/register/pages/register_page.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';

class BirthDatePage extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final RegiProvider regiProvider = RegiProvider();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != dateController.text) {
      dateController.text = pickedDate.day.toString().padLeft(2, '0') +
          '/' +
          pickedDate.month.toString().padLeft(2, '0') +
          '/' +
          pickedDate.year.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomBackButton(context, () {
                  Navigator.pop(context);
                })
              ],
            ),
            const SizedBox(height: 45),
            const Text(
              'Cual es tu fecha de nacimiento',
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
                        decoration: const InputDecoration(
                          hintText: 'DD/MM/YYYY',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child:
                          const Icon(Icons.calendar_today, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CusttomButtonRounded(
                  context,
                  () => {
                        intoDate(),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterNane()),
                        ),
                      },
                  'Siguiente'),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterNane()),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Saltar',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    ));
  }

  void intoDate() {
    regiProvider.enterDateBirthday(dateController.text);
  }
}
