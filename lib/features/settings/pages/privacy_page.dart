import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/profile/widgets/curved_background.dart';
import 'package:hank_talker_mobile/features/settings/pages/change_password.dart';
import 'package:hank_talker_mobile/features/settings/widgets/custom_avatar_edit.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:provider/provider.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final formKey = GlobalKey<FormState>(debugLabel: '_privacySettings');
  final Map<String, TextEditingController> textControllers = {
    'name': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
  };

  Future<void> updateUser() async {
    if (formKey.currentState!.validate()) {
      showLoadingDialog(context);
      final updateResponse =
          await context.read<ProfileProvider>().updateProfile(
                textControllers['name']!.text,
                textControllers['lastName']!.text,
                '12/12/2000',
              );
      if (updateResponse.code == 200) {
        Navigator.of(context).pop();
        // ignore: use_build_context_synchronously
        await showSuccessDialog('Éxito', updateResponse.message, context);
      } else {
        Navigator.of(context).pop();
        // ignore: use_build_context_synchronously
        await showErrorDialog(
            'Hubo un problema', updateResponse.message, context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    final user = context.read<ProfileProvider>().userProfileModel;
    textControllers['name']?.text = user.firstName;
    textControllers['lastName']?.text = user.lastName;
    textControllers['email']?.text = user.email;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ProfileProvider>().userProfileModel;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Transform.scale(
                    scaleX: -1,
                    child: const CurvedBackground(),
                  ),
                  CustomAppbarWidget(
                    context,
                    showBackButton: true,
                    title: 'Privacidad',
                    textColor: Colors.white,
                  ),
                  const Positioned(
                      bottom: 15,
                      child: CustomAvatarEdit(
                        url:
                            'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                      )),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      '${user!.firstName} ${user!.lastName}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomTextImputWithLabel(
                          'Nombres',
                          textControllers['name']!,
                          TextInputType.name,
                          context,
                          const Icon(
                            PhosphorIcons.user_circle_bold,
                            color: Colors.grey,
                          ), (value) {
                        if (value!.isEmpty) {
                          return 'El nombre no puede estar vacío';
                        }
                        if (value.length < 3) {
                          return 'El nombre debe tener al menos 3 caracteres';
                        }
                        if (value.length > 50) {
                          return 'El nombre no puede tener más de 50 caracteres';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Nombres no válidos';
                        }
                        return null;
                      }, false),
                      const SizedBox(height: 15),
                      CustomTextImputWithLabel(
                          'Apellidos',
                          textControllers['lastName']!,
                          TextInputType.name,
                          context,
                          const Icon(
                            PhosphorIcons.user_circle_bold,
                            color: Colors.grey,
                          ), (value) {
                        if (value!.isEmpty) {
                          return 'El apellido no puede estar vacío';
                        }
                        if (value.length < 3) {
                          return 'El apellido debe tener al menos 3 caracteres';
                        }
                        if (value.length > 50) {
                          return 'El apellido no puede tener más de 50 caracteres';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Apellidos no válidos';
                        }
                      }, false),
                      const SizedBox(height: 15),
                      CustomTextImputWithLabel(
                          'Correo electrónico',
                          textControllers['email']!,
                          TextInputType.emailAddress,
                          context,
                          const Icon(
                            PhosphorIcons.envelope,
                            color: Colors.grey,
                          ),
                          (value) {},
                          true),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  // ignore: inference_failure_on_instance_creation
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Cambiar contraseña',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CusttomButtonRounded(
                          context,
                          updateUser,
                          'Guardar',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
