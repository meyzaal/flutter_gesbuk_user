import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen'),
            GesbukUserPrimaryButtonIcon(
              label: 'Lanjutkan dengan Google',
              icon: Icons.g_mobiledata,
              onPressed: () {},
            ),
            Divider(),
            GesbukUserPrimaryButton(label: 'Button', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
