import 'dart:developer';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  int _value = 0;
  FlareControls _Animation_Plus = FlareControls();
  FlareControls _Animation_Minus = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.brush),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: Text('Test State'),
            ),
          ],
        ),
      ),
      body: Container(
        margin: MediaQuery.of(context).viewPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
			Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Click the buttons to',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
			    crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'change the number between 0 - 10',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _value.toString(),
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: SizedBox(
                width: 190,
                height: 190,
                child: FlareActor(
                  'assets/Plus_Animation_Button.flr',
                  animation: 'Stay',
                  controller: _Animation_Plus,
                  sizeFromArtboard: false,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: _CheckPlus(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(padding: EdgeInsets.all(2)),
          ),
          Expanded(
            child: GestureDetector(
              child: SizedBox(
                width: 190,
                height: 190,
                child: FlareActor(
                  'assets/Minus_Animation_Button.flr',
                  animation: 'Stay',
                  controller: _Animation_Minus,
                  sizeFromArtboard: false,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: _CheckMinus(),
            ),
          ),
        ],
      ),
    );
  }

  _CheckMinus() {
    if (_value <= 0) {
      return null;
    } else {
      return (() {
        _Animation_Minus.play('Click');

        setState(() {
          if (_value <= 0) {
            _value = 0;
          } else {
            _value--;
          }
        });
      });
    }
  }

  _CheckPlus() {
    if (_value >= 10) {
      return null;
    } else {
      return (() {
        _Animation_Plus.play('Click');

        setState(() {
          if (_value >= 10) {
            _value = 10;
          } else {
            _value++;
          }
        });
      });
    }
  }
}
