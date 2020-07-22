import 'package:flutter/material.dart';


class HabitsService {
  static final List habits = [
  {
    "habitName": 'running',
    "habitIcon":  Icons.directions_run
  },
  {
    "habitName": 'Reading book',
    "habitIcon":  Icons.book
  }
];

  static List getSuggestions(String query) {
    List matches = List();
    matches.addAll(habits);

    matches.retainWhere((habit) => habit["habitName"].toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}