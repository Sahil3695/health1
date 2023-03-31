import 'package:flutter/material.dart';
import 'package:health1/yoga/widgets/backgroundcircle.dart';
import 'package:health1/yoga/yoga.dart';

class Yoga extends StatefulWidget {
  const Yoga({super.key});

  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> with SingleTickerProviderStateMixin {
  bool _isContainerVisible = false;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _updatesize();
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) controller.reverse();
        if (status == AnimationStatus.dismissed) controller.forward();
      });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  _updatesize() {
    setState(() {
      _isContainerVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final res_width = MediaQuery.of(context).size.width;
    final res_height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: res_height * 0.08,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            height: _isContainerVisible ? res_height * 0.4 : 0.0,
            width: _isContainerVisible ? res_width * 0.8 : 0.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircle(
                    cicleOpacity: 0.1,
                    circleBorderWidth: 60.0,
                    circleColor: Colors.grey,
                    circleWidth: res_width * 0.9),
                BackgroundCircle(
                  cicleOpacity: 0.1,
                  circleBorderWidth: 40.0,
                  circleColor: Color.fromARGB(19, 73, 112, 228),
                  circleWidth: res_width * 0.8,
                ),
                SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(0, -0.15), end: Offset(0, 0.15))
                        .animate(controller),
                    child: Image.asset('lib/images/character-2.png'))
              ],
            ),
          ),
          SizedBox(height: res_height * 0.15),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
                "'Yoga is a way to freedom. By its constant practice, we can free ourselves from fear, anguish and loneliness.'",
                // style: Theme.of(context)
                //     .textTheme
                //     .titleLarge!
                //     .merge(TextStyle(color: Colors.grey)),
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(175, 255, 64, 128),
                          Colors.deepPurpleAccent,
                          Color.fromARGB(171, 73, 112, 228),
                          Color.fromARGB(175, 255, 64, 128),
                          Color.fromARGB(171, 73, 112, 228),

                          //add more color here.
                        ],
                      ).createShader(Rect.fromLTWH(0.0, 0.0, 500.0, 100.0)))),
          ),
          SizedBox(height: res_height * 0.1),
          Container(
            width: res_width * 0.32,
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()));
                },
                icon: Icon(Icons.forward),
                label: Text(
                  "Let's Start",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .merge(TextStyle(color: Colors.white)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(171, 73, 112, 228),
                    fixedSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 50

                    // padding: const EdgeInsets.symmetric(
                    //     horizontal: 10, vertical: 20)),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
