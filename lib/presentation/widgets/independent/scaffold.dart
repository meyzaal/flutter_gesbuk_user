import 'package:flutter/material.dart';
import 'package:flutter_gesbuk_user/presentation/widgets/widgets.dart';

class GesbukUserScaffold extends StatelessWidget {
  final String? appBarTitle;
  final Widget body;
  final bool? backButton;
  final int? bottomMenuIndex;
  final List<String>? tabBarList;
  final TabController? tabController;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;
  final bool blankAppBar;
  final List<Widget>? actions;

  const GesbukUserScaffold(
      {super.key,
      this.appBarTitle,
      required this.body,
      this.backButton,
      this.bottomMenuIndex,
      this.tabBarList,
      this.tabController,
      this.bottomNavBar,
      this.floatingActionButton,
      this.blankAppBar = true,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null
          ? AppBar(
              automaticallyImplyLeading: false,
              title: Text(appBarTitle!),
              leading: backButton == true
                  ? IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: Theme.of(context).iconTheme.color),
                    )
                  : null,
              actions: actions,
            )
          : blankAppBar
              ? BlankAppBar(
                  context: context,
                )
              : null,
      body: body,
      bottomNavigationBar: bottomMenuIndex != null
          ? GesbukUserBottomMenu(bottomMenuIndex!)
          : bottomNavBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

class BlankAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlankAppBar({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
