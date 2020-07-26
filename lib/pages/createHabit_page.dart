import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:myfirstflutterapp/data/data.dart';
import 'package:myfirstflutterapp/pages/story_page.dart';

class CreateHabitPage extends StatefulWidget {
  @override
  _CreateHabitPageState createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedHabit;
  final format = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create your habit'),
      ),
      body: Form(
        key: this._formKey,
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text("When", style: TextStyle(fontWeight: FontWeight.bold)),
//             when click on, appear time picker
              DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    builder: (context, child) => MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child),
                  );
                  return DateTimeField.convert(time);
                },
              ),
              SizedBox(height: 20),
              Text("I will", style: TextStyle(fontWeight: FontWeight.bold)),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: this._typeAheadController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "..reading book",
                    )
                ),
                suggestionsCallback: (pattern) {
                  return HabitsService.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion['habitName']),
                    leading: Icon(suggestion['habitIcon']),
                  );
                },
                transitionBuilder: (context, suggestionsBox, controller) {
                  return suggestionsBox;
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion["habitName"];
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please select a habit';
                  }
                  return null;
                },
                onSaved: (value) => this._selectedHabit = value,
              ),
              SizedBox(height: 10.0),
              // Create Button: pass state to Stories Screen
              Text("Because", style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(),
              RaisedButton(
                child: Text('Create'),
                onPressed: () {
                  if (this._formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryPage(),
                        ));

//                    Scaffold.of(context).showSnackBar(SnackBar(
//                        content: Text('Your Favorite City is ${this._selectedHabit}')
//                    ));
              //    onTap: () {
              //    Navigator.push(
              //    context,
              //    MaterialPageRoute(
              //      builder: (context) => DetailScreen(todo: todos[index]),
                  }
                },
              )
            ],
          ),
        ),
      )
    );
  }}

