import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final Widget title;
  final PreferredSizeWidget bottom;
  final Function onPressed;
  final List<Widget> actions;
  final Color firstColor;
  final Color secondColor;
  final Widget leading;
  final bool centerTitle;
  final bool automaticallyImplyLeading;

  AppBarView({
    Key key,
    this.color,
    this.title,
    this.bottom,
    this.onPressed,
    this.actions,
    this.firstColor,
    this.secondColor,
    this.leading,
    this.centerTitle,
    this.automaticallyImplyLeading
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).appBarTheme.color ?? Colors.blue;

    return AppBar(
      toolbarHeight: 80,
      backgroundColor: color,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      titleSpacing: 0.0,
      centerTitle: centerTitle ?? true,
      leading: leading,
      title: title,
      bottom: bottom,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,
                end: Alignment.bottomCenter, stops: [0.0, 1.0], colors: [firstColor ?? accentColor, secondColor ?? accentColor])
        ),
      ),
      actions: actions
    );
  }
}