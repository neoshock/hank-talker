import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/core/auth/models/user_model.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/features/profile/widgets/curved_background.dart';
import 'package:hank_talker_mobile/features/settings/widgets/custom_avatar_edit.dart';
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
  bool _showPassword = false;

  Future<void> updateUserData() async {
    if (formKey.currentState!.validate()) {
      final user = UserModel(
        uid: Provider.of<AuthProvider>(context, listen: false).user.uid,
        displayName: textControllers['name']!.text,
        email: textControllers['email']!.text,
        photoUrl:
            Provider.of<AuthProvider>(context, listen: false).user.photoUrl,
      );
      await Provider.of<AuthProvider>(context, listen: false)
          .updateUserData(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
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
                  const Positioned(bottom: 15, child: CustomAvatarEdit()),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      user.displayName!,
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
                        const Icon(PhosphorIcons.user_circle_bold),
                        (value) {
                          if (value!.isEmpty) {
                            return 'El nombre no puede estar vacío';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextImputWithLabel(
                        'Apellidos',
                        textControllers['lastName']!,
                        TextInputType.name,
                        context,
                        const Icon(PhosphorIcons.user_circle_bold),
                        (value) {},
                      ),
                      const SizedBox(height: 15),
                      CustomTextImputWithLabel(
                        'Correo electrónico',
                        textControllers['email']!,
                        TextInputType.emailAddress,
                        context,
                        const Icon(PhosphorIcons.envelope),
                        (value) {},
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CusttomButtonRounded(
                          context,
                          updateUserData,
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
