import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  final AnimatedIconData animatedIconData;
  final Function onPressed;
  final double size;
  
  AnimatedIconButton({
    @required this.animatedIconData,
    @required this.onPressed,
    @required this.size
  });
  
  @override
  _AnimatedIconButtonState createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return InkWell(
      child: AnimatedIcon(
        icon: widget.animatedIconData,
        progress: _animationController,
        size: widget.size,
      ),
      onTap: () => _handleOnPressed(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
