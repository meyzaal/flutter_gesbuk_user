import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GesbukUserScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home Screen'),
            const Divider(),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password_rounded),
                suffixIcon: Icon(Icons.remove_red_eye_rounded),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppSizes.textFieldRadius)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppSizes.textFieldRadius),
                  ),
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                  ),
                  padding: const EdgeInsets.all(AppSizes.sidePadding),
                ),
                child: const Text('Button'),
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                  ),
                  padding: const EdgeInsets.all(AppSizes.sidePadding),
                ),
                icon: const Icon(Icons.android_rounded),
                label: const Text('Icon Button'),
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.mainColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                  ),
                  padding: const EdgeInsets.all(AppSizes.sidePadding),
                ),
                child: const Text('Button'),
              ),
            ),
            const Divider(),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.mainColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                  ),
                  padding: const EdgeInsets.all(AppSizes.sidePadding),
                ),
                icon: const Icon(Icons.android_rounded),
                label: const Text('Icon Button'),
              ),
            ),
            const Divider(),
            ListTile(
              tileColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      style: BorderStyle.solid,
                      width: 0.4,
                      color: Colors.black12),
                  borderRadius:
                      BorderRadius.circular(AppSizes.widgetBorderRadius)),
              leading: const Icon(Icons.label_rounded),
              title: const Text('Title'),
              subtitle: const Text('Subtitle'),
              trailing: const Icon(Icons.beach_access_rounded),
              onTap: () {},
            )
          ],
        ),
      ),
      bottomMenuIndex: 0,
    );
  }
}
