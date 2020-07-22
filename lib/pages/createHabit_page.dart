import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:myfirstflutterapp/data/data.dart';

class CreateHabitPage extends StatefulWidget {
  @override
  _CreateHabitPageState createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedCity;

  List<String> _newData = [];


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
              Text(
                  'habit i want to master'
              ),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: this._typeAheadController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: " reading book ",
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
//               TODO:
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
                onSaved: (value) => this._selectedCity = value,
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (this._formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Your Favorite City is ${this._selectedCity}')
                    ));
                  }
                },
              )
            ],
          ),
        ),
      )
    );
  }}