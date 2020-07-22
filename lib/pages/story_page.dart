import 'package:flutter/material.dart';
//import 'package:myfirstflutterapp/widgets/habit_wg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:myfirstflutterapp/data/data.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:myfirstflutterapp/util/habit_list.dart';
import 'package:myfirstflutterapp/pages/createHabit_page.dart';

class Habit {

}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  List<String> _habitItems = [];
  String _selectedHabit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Today"),
        actions: <Widget>[
          //TODO: Click on plus icon then display createHabitDiaglog,
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateHabitPage()),
              );
    })]));
  }}
