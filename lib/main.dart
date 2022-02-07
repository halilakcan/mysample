import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test Application",
        home: Scaffold(
          appBar: AppBar(
            title: const Text('BottomNavigationBar Sample'),
          ),
          body: const Body(),
          bottomNavigationBar: const Bottom(),
        ));
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  int location = 0;
  static TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> bodyOptions = [
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void update() {
    setState(() {
      location = BottomState.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      bodyOptions[BottomState.selectedIndex],
      ElevatedButton(onPressed: update, child: const Text("Update"))
    ]);
  }
}

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<Bottom> {
  static int selectedIndex = 0;
  final myKey = GlobalKey<BodyState>();
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    final myPage = MyApp(key: myKey);
   Navigator.push(context, MaterialPageRoute(builder: (_) => myPage));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
