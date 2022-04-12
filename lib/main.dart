import 'dart:html';

import 'package:casarosah/Cadastro.dart';
import 'package:casarosah/Clientes.dart';
import 'package:casarosah/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:casarosah/Faturamento.dart';

void main() async {
  runApp(const MyApp());
  //final configurations = Configurations();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*Future<void> init() async {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: configurations.apiKey,
            appId: configurations.appId,
            messagingSenderId: configurations.messagingSenderId,
            projectId: configurations.projectId));
  }*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  FirebaseOptions get firebaseOptions => FirebaseOptions(
        appId: '1:888122751992:web:0ec38efee23baf2be4f40d',
        apiKey: 'AIzaSyAw2rng78_tFwv4DgirLgwMr8wmiWGEk14',
        projectId: 'casa-rosah-projeto',
        messagingSenderId: '888122751992',
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Casa Rosah',
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color backg = const Color.fromRGBO(198, 130, 129, 1);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(

        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Casa Rosah"),
            backgroundColor:Color.fromRGBO(198, 130, 129, 1),
            automaticallyImplyLeading: false,
            centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Casa Rosah",
                  style: TextStyle(
                      color: Color.fromRGBO(198, 130, 129, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 50.0, 10.0, 15.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cadastro()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      color: backg,
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 60.0),
                      child: const Text('  CADASTRAR  '),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 20.0, 15.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Clientes()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      color: backg,
                      padding:
                          const EdgeInsets.fromLTRB(35.0, 60.0, 35.0, 60.0),
                      child: const Text('  CLIENTES  '),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 50.0, 10.0, 30.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Faturamento()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      color: backg,
                      padding:
                          const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 60.0),
                      child: const Text('FATURAMENTO'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 20.0, 30.0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      color: backg,
                      padding:
                          const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 60.0),
                      child: const Text('   ESTOQUE   '),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
