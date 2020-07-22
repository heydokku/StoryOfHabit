import 'package:flutter/material.dart';
import 'package:myfirstflutterapp/widgets/createHabit_dialog(after).dart';

class Habit extends StatefulWidget {
  final IconData icon;
  final String habit;
  final String time;
  final bool isCreateHabitPage;
  final Function tap ;

  Habit({
    Key key,
    @required this.icon,
    @required this.habit,
    @required this.time,
    this.tap,
    this.isCreateHabitPage
  }): super(key: key);

  @override
  _HabitState createState() => _HabitState();
}

class _HabitState extends State<Habit> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //TODO: if click on Icon, will display DIALOG to create habit When, will, why
      // if isCreateHabitScreen, display createHabitDiaglog
      // if isStoryScreen, display NO dialog, display everflow HabitStory use Text widget, overflow
      onTap: (){

      },
      child: Card(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
                child: Icon(
                  widget.icon,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(
//                height: 10.0,
                width: 10.0,
                child: const Card(borderOnForeground: true),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Text(
                    "${widget.habit}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                    ),
                  ),
//                  TODO: if Page is CreateHabit then time = null, habit vs icon sẽ ở trên cùng 1 row.
//                  TOODO: Tách time thành 1 wg riêng
                  widget.time == null ? Text('') :
                  Text(
                    "At ${widget.time} h",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
