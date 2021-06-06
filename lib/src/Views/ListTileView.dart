import 'package:flutter/material.dart';

class ListTileView extends StatelessWidget {
  final EdgeInsets contentPadding;
  final Widget title;
  final Function onTap;
  final Widget leading;
  final Widget trailing;

  ListTileView({
    this.contentPadding,
    this.title,
    this.onTap,
    this.leading,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      contentPadding: contentPadding ?? EdgeInsets.only(left: 12, right: 12),
      onTap: onTap,
      trailing: trailing,
      leading: leading,
    );
  }
}
