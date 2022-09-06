import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/app/config/theme.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/independent/bottom_menu.dart';

class GesbukUserScaffold extends StatelessWidget {
  final String? appBarTitle;
  final Widget body;
  final bool? backButton;
  final int? bottomMenuIndex;
  final List<String>? tabBarList;
  final TabController? tabController;

  const GesbukUserScaffold(
      {super.key,
      this.appBarTitle,
      required this.body,
      this.backButton,
      this.bottomMenuIndex,
      this.tabBarList,
      this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBarTitle != null
          ? AppBar(
              title: Text(appBarTitle!),
              leading: backButton == true
                  ? IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: Theme.of(context).iconTheme.color),
                    )
                  : null,
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.sidePadding, vertical: 8.0),
        child: body,
      ),
      bottomNavigationBar: bottomMenuIndex != null
          ? GesbukUserBottomMenu(bottomMenuIndex!)
          : null,
    );
  }
}
