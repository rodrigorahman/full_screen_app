import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pagina2.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    changeStatusBar();
  }

  void changeStatusBar() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.red,
          systemNavigationBarColor: Colors.red,
        ),
      );
    }
  }

  void rollbackStatusBar() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black38),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Center(
            child: FlatButton(
              onPressed: () async {
                rollbackStatusBar();
                await Navigator.of(context).push(MaterialPageRoute(builder: (_) => Page2()));
                changeStatusBar();
              },
              child: Text(
                'Pagina 2',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
