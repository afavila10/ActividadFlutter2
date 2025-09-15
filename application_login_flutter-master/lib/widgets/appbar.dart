import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onMenuPressed;
  final Color? titleColor; // 👈 nuevo parámetro
  final Color? iconColor;  // 👈 nuevo parámetro

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onMenuPressed,
    this.titleColor,
    this.iconColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white, // 👈 ahora puedes cambiar el color del título
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: IconThemeData(
        color: iconColor ?? Colors.white, // 👈 color de íconos
      ),
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? null
          : onMenuPressed != null
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: onMenuPressed,
                )
              : null,
      actions: actions,
    );
  }
}
