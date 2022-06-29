import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  static const String path = '/third_page';
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn));
    super.initState();
  }

  final List<IconData> myList = [
    Icons.home,
    Icons.search,
    Icons.business,
    Icons.abc,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flow(
          delegate: CustomFlowDelegate(myAnimation: _animation!),
          children: myList
              .map((e) => FloatingActionButton(
                    onPressed: () {
                      _animationController!.status == AnimationStatus.completed
                          ? _animationController!.reverse()
                          : _animationController!.forward();
                    },
                    child: Icon(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CustomFlowDelegate extends FlowDelegate {
  final Animation<double> myAnimation;
  const CustomFlowDelegate({required this.myAnimation})
      : super(repaint: myAnimation);
  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      double dy = (context.getChildSize(i)!.height + 10) * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(0, dy * myAnimation.value, 0));
    }
  }

  @override
  bool shouldRepaint(CustomFlowDelegate oldDelegate) {
    return oldDelegate != oldDelegate.myAnimation;
  }

  Size? getChildSize(int i) {
    return const Size(50, double.infinity);
  }
}
