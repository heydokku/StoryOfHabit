import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/pages/story_page.dart';
import 'package:myfirstflutterapp/pages/more_page.dart';
import 'package:myfirstflutterapp/pages/statistics_page.dart';
import 'package:myfirstflutterapp/tab/tab_navigation_item.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 1;
  void _onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final tabItem in TabNavigationItem.items ) tabItem.page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onTap,
        items: <BottomNavigationBarItem>[
          for (final tabItem in TabNavigationItem.items )
            BottomNavigationBarItem(
              icon: tabItem.icon,
              title: tabItem.title
            )
          ]
        ),
    );
  }
}

