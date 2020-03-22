import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: AnimatonBody(),
    );
  }
}

class AnimatonBody extends StatefulWidget {
  @override
  _AnimatonBodyState createState() => _AnimatonBodyState();
}

class _AnimatonBodyState extends State<AnimatonBody>
    with TickerProviderStateMixin {
  AnimationController picAnimCont;
  Animation<double> picAnimation;
  @override
  void initState() {
    super.initState();
    picAnimCont = new AnimationController(
        vsync: this, duration: Duration(microseconds: 500));
    picAnimation = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: picAnimCont, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      child: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              height: 263.0,
              width: 253.0,
              color: Colors.brown,
            ),
            // anmaition.value
          ],
        ),
      ),
    );
  }
}

// Widget picAnimBuild (Tween x ){

//   return TweenAnimationBuilder(tween: x, duration: null, builder: null);
// }
// __controller.forward().orCancel; to be safe in some case add onCancel()
