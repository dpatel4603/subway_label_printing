import 'package:flutter/material.dart';
import 'package:sunmi/sauce_screen.dart';
import 'package:sunmi/veggie_screen.dart';
import 'package:sunmi/meat_screen.dart';

class SunmiScreenHome extends StatelessWidget {
  const SunmiScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunmi Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            const SizedBox(
                height: 16), // Add some spacing between text input and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstScreen()),
                );
              },
              child: const Text('Sauces'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Veggies'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child: const Text('Meat'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Sauces Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SauceScreen(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Veggie Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const VeggieScreen(),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Meat Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MeatScreen(),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunmi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SunmiScreenHome(),
    );
  }
}
