import 'package:flutter/material.dart';

import 'ui/absen/absen_page.dart';
import 'ui/history/history_page.dart';
import 'ui/leave/leave_page.dart';
import 'ui/profile_page.dart';


// Halaman utama aplikasi dengan BottomNavigationBar
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  static List<Widget> _pages = <Widget>[
    ProfilePage(),
    AbsenPage(),
    HistoryPage(),
    LeavePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index >= 0 && index < _pages.length) {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.isNotEmpty ? _pages.elementAt(_selectedIndex) : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Absen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Rekap Absen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Izin',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
