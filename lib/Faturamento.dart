import 'package:casarosah/faturamento_Cada.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'faturamento_Total.dart';

class Faturamento extends StatefulWidget {
  @override
  State<Faturamento> createState() => _Faturamento();
}

class _Faturamento extends State<Faturamento> {
  Color backg = const Color(0xFFc68281);
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {



    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Faturamento"),
          centerTitle: true,
          backgroundColor: backg,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
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
                        MaterialPageRoute(builder: (context) => FaturamentoCada()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      color: backg,
                      padding:
                      const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 25.0),
                      child: const Text('  VER CADA PROCEDIMENTO FEITO  '),
                    ),
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 30.0),
                  child:Container(
                    child: StreamBuilder<QuerySnapshot>(
                        stream:
                        FirebaseFirestore.instance.collection("faturamento")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          var lista = [];
                          print(snapshot.data?.docs
                              .map(
                                  (doc) {
                                lista.add(doc["Valor"]);
                              }
                          ));
                          if (!snapshot.hasData) return new Text("There is no expense");
                          return Card(color: backg,

                            child: Container(
                              padding: EdgeInsets.fromLTRB(55.0, 25.0, 55.0, 25.0),
                              child: Column(
                                children: <Widget>[
                                  Text("FATURAMENTO TOTAL: R\$ ${lista.reduce((accumulated, element) => accumulated + element).toString()}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ),

              ],
            ),
          ],
        ));
  }
}
/**/
