import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfirstflutterapp/pages/more_page.dart';
import 'package:myfirstflutterapp/pages/statistics_page.dart';
import 'package:myfirstflutterapp/pages/story_page.dart';

class TabNavigationItem{
  final Widget page;
  final Widget title; // tai sao ko cho text widget luon
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon
  });
  
  static List<TabNavigationItem> get items => [
    TabNavigationItem(page: StatisticsPage(), title: Text('Statistics'), icon: Icon(Icons.star)),
    TabNavigationItem(page: StoryPage(), title: Text('Stories'), icon: Icon(Icons.change_history)),
    TabNavigationItem(page: MorePage(), title: Text('More'), icon: Icon(Icons.more_horiz)),
  ];
}