import 'package:flutter/material.dart';
import 'dart:async';
import 'learning_screen.dart';

void main() {
  runApp(DailyWordsApp());
}

class DailyWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyWords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigateToNextPage);
  }

  navigateToNextPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
          child: Image.asset('assets/logo.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('Statistics Page', style: TextStyle(color: Colors.white)),
    Text('Account Page', style: TextStyle(color: Colors.white)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.5)),
          child: Container(
            color: Color(0xFF0F0F0F),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                      _selectedIndex == 0
                          ? 'assets/home.png'
                          : 'assets/home_inactive.png',
                      width: 36,
                      height: 36),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      _selectedIndex == 1
                          ? 'assets/statistics.png'
                          : 'assets/statistics_inactive.png',
                      width: 36,
                      height: 36),
                  label: 'Statistics',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                      _selectedIndex == 2
                          ? 'assets/account.png'
                          : 'assets/account_inactive.png',
                      width: 36,
                      height: 36),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
              showSelectedLabels: false, // to hide labels
              showUnselectedLabels: false, // to hide labels
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF003AFF), // background color
          onPrimary: Colors.white, // text color
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(38.0))),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LearningScreen()),
          );
        },
        child: Text('Начать обучение'),
      ),
    );
  }
}
