import 'package:flutter/widgets.dart';

class ScaleAnimationWrapper extends StatefulWidget {
  final Widget child;
  final double lowerBound;
  const ScaleAnimationWrapper({
    Key? key,
    required this.child,
    this.lowerBound = 0.5,
  }) : super(key: key);

  @override
  _ScaleAnimationWrapperState createState() => _ScaleAnimationWrapperState();
}

class _ScaleAnimationWrapperState extends State<ScaleAnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: 1,
    );
    _animation = CurvedAnimation(
      curve: Curves.easeInOutQuint,
      parent: _controller,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
