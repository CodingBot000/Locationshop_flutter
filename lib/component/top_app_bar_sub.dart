import 'package:flutter/material.dart';
class TopAppBarSub extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLikeButton;
  final bool isLiked;
  final VoidCallback? onLikePressed;

  const TopAppBarSub({
    super.key,
    required this.title,
    this.showLikeButton = false,
    this.isLiked = false,
    this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: showLikeButton
          ? [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.black,
          ),
          onPressed: onLikePressed,
        ),
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}