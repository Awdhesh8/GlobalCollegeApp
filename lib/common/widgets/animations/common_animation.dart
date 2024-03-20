import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final Widget child;
  final String animationType;

  AnimationWidget({required this.child, required this.animationType});

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    switch (widget.animationType) {
      case 'fade':
        _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
        break;
      case 'slide':
        _animation = Tween<double>(begin: -1, end: 0).animate(_controller);
        break;
    // Add cases for other animation types like scale, translate, etc.
      default:
        _animation = null;
    }

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        switch (widget.animationType) {
          case 'fade':
            return Opacity(
              opacity: _animation!.value,
              child: widget.child,
            );
          case 'slide':
            return Transform.translate(
              offset: Offset(_animation!.value * MediaQuery.of(context).size.width, 0),
              child: widget.child,
            );
        // Add cases for other animation types
          default:
            return SizedBox(); // Return empty widget by default
        }
      },
    );
  }
}



// import 'package:flutter/material.dart';
//
// class FadeTransitionWidget extends StatefulWidget {
//   final Widget child;
//
//   FadeTransitionWidget({required this.child});
//
//   @override
//   _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
// }
//
// class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return Opacity(
//           opacity: _animation.value,
//           child: widget.child,
//         );
//       },
//     );
//   }
// }
