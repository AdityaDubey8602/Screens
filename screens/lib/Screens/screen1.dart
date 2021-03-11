import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  void method() {}

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Screen 1',
          style: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              page('Page 1', 1),
              page('Page 2', 2),
              page('Page 3', 3),
              page('Page 4', 4),
              page('Page 5', 0),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              // horizontal: 10.0,
              vertical: 60.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 5,
                      effect: WormEffect(),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.bounceOut,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget page(String s, int n) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 250.0,
          ),
          Text(
            s,
            style: TextStyle(
              fontSize: 50.0,
              fontFamily: 'Nunito',
            ),
          ),
          SizedBox(
            height: 150.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange[300],
            ),
            onPressed: () {
              if (_controller.hasClients) {
                _controller.animateToPage(
                  n,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            color: Colors.grey,
            endIndent: 150.0,
            indent: 150.0,
            height: 10.0,
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
