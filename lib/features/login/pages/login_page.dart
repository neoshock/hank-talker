import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:hank_talker_mobile/widgets/inputs.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  void login() {
    if (formGlobalKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Login'),
              content: Text('Login'),
            );
          });
    }
  }

  // validateEmail

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
                child: Form(
                    key: formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextImputWithLabel(
                          'Email',
                          emailController,
                          TextInputType.emailAddress,
                          context,
                          const Icon(PhosphorIcons.envelope),
                          (value) {
                            if (value == null || value == '') {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomImputPassword(
                            passwordController,
                            TextInputType.visiblePassword,
                            context,
                            const Icon(PhosphorIcons.lock),
                            'Password', (value) {
                          if (value == null || value == '') {
                            return 'Password is required';
                          }
                          return null;
                        }, false),
                        const SizedBox(height: 15),
                        CusttomButtonRounded(context, () => login(), 'Login'),
                      ],
                    )))));
  }
}
