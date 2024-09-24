import 'package:flutter/material.dart';

class TopAppBarSub extends StatelessWidget implements PreferredSizeWidget {
  // final List<Widget> actions;
  final String title;
  TopAppBarSub({required this.title});
  // TopAppBarSub({required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title:
          Text(title),
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new));
      }),
      // actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
