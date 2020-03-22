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
    with SingleTickerProviderStateMixin {
  AnimationController picAnimCont;
  Animation<double> picAnimation;
  @override
  void initState() {
    super.initState();
    picAnimCont = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 950));
    picAnimation = Tween(begin: 0.0099, end: 1.0).animate(
      CurvedAnimation(parent: picAnimCont, curve: Curves.bounceIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white38,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow
                    .visible, // stuff out of stack ! clip or visible / when use positioned in stack
                children: <Widget>[
                  Container(
                    height: 263.0,
                    width: 253.0,
                    color: Colors.blue,
                  ),
                  AnimatedBuilder(
                    animation: picAnimation,
                    builder: (context, _) {
                      return Container(
                        height: 263.0,
                        width: 253.0,
                        child: Opacity(
                          opacity: picAnimation.value,
                          child: Image.asset("assets/images/mypic.jpg"),
                        ),
                      );
                    },
                  )
                  // anmaition.value
                ],
              ),
              RaisedButton(
                onPressed: () {
                  if (AnimationStatus.dismissed == picAnimation.status) {
                    picAnimCont.forward().orCancel;
                  } else if (AnimationStatus.completed == picAnimation.status) {
                    picAnimCont.reverse().orCancel;
                  }
                },
                child: Text("run animation"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget picAnimBuild (Tween x ){

//   return TweenAnimationBuilder(tween: x, duration: null, builder: null);
// }
// __controller.forward().orCancel; to be safe in some case add onCancel()
// positioned ; transformwidget ;
