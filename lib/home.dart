import 'package:flutter/material.dart';
import 'package:tech_fest_app/auth/auth.dart';
import 'package:tech_fest_app/common/primary_button.dart';
import 'package:tech_fest_app/events/events_list.dart';
import 'package:tech_fest_app/Fault Reporting/test.dart';
import 'package:tech_fest_app/classes/classes.dart';
import 'package:tech_fest_app/todolistv2/todomain.dart';
import 'package:tech_fest_app/getfood//SelectPlace.dart';

class Home extends StatelessWidget {
  Home({this.auth, this.onSignOut, this.userId ,this.email});
  final BaseAuth auth;
  final String userId, email;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {

    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }

    }

    return new SafeArea(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Home"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: _signOut,
                  child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white))
              )
            ],
          ),
          body: new Center(
            child:new SingleChildScrollView(child: new Container(
                padding: const EdgeInsets.all(16.0),
                child: new Column(
                    children: [
                      new Image.asset(
                          'img/ntu.png',
                      height: 250.0,
                      width: 250.0),
                      new Text(
                        'Welcome to NTU',
                        style: new TextStyle(fontSize: 32.0),
                      ),
                      new Card(
                          child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new PrimaryButton(
                                      key: null,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyClassApp()),
                                        );
                                      },
                                      text: 'Classes',
                                      height: 44.0,
                                    )
                                ),
                                new Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new PrimaryButton(
                                      key: null,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePageToDo()),
                                        );
                                      },
                                      text: 'ToDo list',
                                      height: 44.0,
                                    )
                                ),
                                new Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new PrimaryButton(
                                      key: null,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EventsList(auth: auth, userId: userId, email: email)),
                                        );
                                      },
                                      text: 'Events',
                                      height: 44.0,
                                    ),
                                ),
                                new Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new PrimaryButton(
                                      key: null,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyApp()),
                                        );
                                      },
                                      text: 'Report a fault',
                                      height: 44.0,
                                    )
                                ),
                                new Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new PrimaryButton(
                                      key: null,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PlacePage(),
                                        ),
                                        );
                                      },
                                      text: 'Get some food',
                                      height: 44.0,
                                    )
                                ),
                              ])
                      ),
                    ]
                )
            )
          )
      )),
    );
  }
}