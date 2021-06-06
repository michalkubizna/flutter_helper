import 'package:flutter_helper/flutter_helper.dart';
import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  final String info;
  final String text;
  final String buttonText;
  final Function() navigate;
  final bool validate;
  final Widget child;
  final Widget footer;

  InputView({
    this.info,
    this.text,
    this.buttonText,
    this.navigate,
    this.validate,
    this.child,
    this.footer
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: Text("Sign Up"),
      ),
      body: PlatformUtil().getResizedWidget(
        context,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ChildrenUtil().getAllPaddedChildren([
              Text(text, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              info != null ? Text(info, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontSize: 16.0)) : Container(),
              child,
              ButtonView(
                  text: buttonText ?? "Next",
                  onPressed: validate ?? true ? navigate : null
              ),
              footer ?? Container()
            ])
        ),
      ),
    );
  }
}
