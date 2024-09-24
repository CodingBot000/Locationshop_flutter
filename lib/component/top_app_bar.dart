import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final List<Widget> actions;

  TopAppBar({required this.backgroundColor, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title:
          Center(child: Image.asset('assets/images/logo/logo.png', height: 30)),
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu));
      }),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
