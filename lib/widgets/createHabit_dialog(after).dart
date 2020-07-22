import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateHabitDialog extends StatefulWidget {
  @override
  _CreateHabitDialogState createState() => _CreateHabitDialogState();
}

class _CreateHabitDialogState extends State<CreateHabitDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            Center(
              child: Icon(FontAwesomeIcons.running)
            ),

            RaisedButton(
                color: Colors.red,
                child: Text('Create'),
                onPressed: () {
                  Navigator.of(context).pop();
                }
            )
          ],
        ),
      ),
    );
  }
}
