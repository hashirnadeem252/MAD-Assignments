import 'package:flutter/material.dart';

void main() {
  runApp(MyInteractiveApp());
}

class MyInteractiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Event-Based App',
      home: InteractiveHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InteractiveHome extends StatefulWidget {
  @override
  _InteractiveHomeState createState() => _InteractiveHomeState();
}

class _InteractiveHomeState extends State<InteractiveHome> {
  Color backgroundColor = Colors.white;
  final originalColor = Colors.white;
  final changedColor = Colors.lightBlue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Event-Based App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to Interactive App!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),

            // Gesture Detector
            GestureDetector(
              onTap: () {
                print('Single Tap Detected');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Single Tap Detected')),
                );
              },
              onDoubleTap: () {
                print('Double Tap Detected');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Double Tap Detected')),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.grey.shade300,
                child: Center(
                  child: Text(
                    'Tap or Double Tap here',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Click Me'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Button Clicked')),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Long Press Me'),
                  onLongPress: () {
                    setState(() {
                      backgroundColor = changedColor;
                    });
                  },
                  onPressed: () {}, // To make the button active
                ),
                ElevatedButton(
                  child: Text('Reset'),
                  onPressed: () {
                    setState(() {
                      backgroundColor = originalColor;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            // Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Type something',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                print("Live Input: $text");
              },
              onSubmitted: (text) {
                print("Submitted: $text");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Submitted')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
