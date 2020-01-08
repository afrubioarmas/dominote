import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/view/common_components/my_primary_button.dart';
import 'package:flutter/material.dart';

class AddMatch extends StatefulWidget {
  @override
  _AddMatchState createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  String _radioValue;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).cardColor,
      height: 180,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Language.getStrings("AddPoints"),
                style: Theme.of(context).textTheme.title),
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: "one",
                      groupValue: _radioValue,
                      onChanged: (id) {
                        setState(() {
                          _radioValue = id;
                        });
                      },
                    ),
                    Text("Andres - Dani"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Oscar - Felo"),
                    Radio(
                      value: "two",
                      groupValue: _radioValue,
                      onChanged: (id) {
                        setState(() {
                          _radioValue = id;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(Language.getStrings("Points") + ": "),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 70,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
                MyPrimaryButton(
                  color: Theme.of(context).buttonColor,
                  child: Icon(Icons.add),
                  action: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
