import 'package:budget_tracker/login.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'form_panel.dart';
import 'login.dart';
import 'google_auth.dart';

class AllPanels extends StatelessWidget {
  const AllPanels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Center(
        child: Container(
          color: Colors.cyan,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Form Screen
              Column(children: <Widget>[
                Expanded(child: SizedBox(width: 400, child: Login())),
                Container(
                  height: 150,
                  width: 400,
                  color: Colors.black,
                ),
              ], ),
              const GraphPanels(),
            ],
          ),
        ),
      ),
    );
  }
}

class GraphPanels extends StatelessWidget {
  const GraphPanels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Column(
      children: <Widget>[
        const Expanded(
            child: SizedBox(
              child: AuthGate(),
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
      ],
    ));
  }
}

