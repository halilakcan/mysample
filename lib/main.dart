




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
          body:  const MyStatefulWidget(),
          bottomNavigationBar: const Bottom(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
 
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
 _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
   int location=0;
   static TextStyle optionStyle =
       const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final List<Widget> _widgetOptions =[
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
  
    
 void _update() {
    setState(() {
      location= _Bottom._selectedIndex;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[ _widgetOptions[_Bottom._selectedIndex],
      ElevatedButton(onPressed: _update, child: const Text("Update"))]
    );
  }
}

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _Bottom();
}

class _Bottom extends State<Bottom>  {
static int _selectedIndex = 0;
 final myKey = GlobalKey<_MyStatefulWidgetState>();
void _onItemTapped(int index) {
    setState(() {
       _selectedIndex = index;
    });
    final myPage = MyApp(key: myKey);
myPage.build(context);
    myKey.currentState?.build(context);
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
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped ,
    );
  }
}
