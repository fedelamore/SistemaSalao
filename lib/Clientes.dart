import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Clientes extends StatefulWidget {
  @override
  State<Clientes> createState() => _Clientes();
}

class _Clientes extends State<Clientes> {
  Color backg = const Color(0xFFc68281);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Clientes"),
          centerTitle: true,
          backgroundColor: backg,
        ),
        body: Container(
            child: StreamBuilder(
              stream:
              FirebaseFirestore.instance.collection('TodosClientes').snapshots(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return const Text('Carregando...');
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot doc =
                    snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 5.0),
                      child: Card(
                          color: Color.fromRGBO(241, 224, 224, 1),
                          child: Column(
                              children: [
                                ListTile(
                                  title: Text("${doc['Name']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("Tel: ${doc['Tel']}"),
                                  trailing: Text("Desde: ${doc['Data']}",
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ]
                          )
                      ),
                    );
                  },
                );
              },
            )));
  }
}
/**/
