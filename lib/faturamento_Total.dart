import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FaturamentoTotal extends StatefulWidget {
  const FaturamentoTotal({Key? key}) : super(key: key);

  @override
  State<FaturamentoTotal> createState() => _FaturamentoTotalState();
}

class _FaturamentoTotalState extends State<FaturamentoTotal> {
  verificar() async {
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('faturamento');

    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      print(allData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Faturamento"),
          centerTitle: true,
        ),
        body: Container(
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
                  return Container(child: Text(lista.reduce((accumulated, element) => accumulated + element).toString()));
                }),
        )
    );

  }
}