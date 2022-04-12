import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FaturamentoCada extends StatefulWidget {
  @override
  State<FaturamentoCada> createState() => _FaturamentoCada();
}

class _FaturamentoCada extends State<FaturamentoCada> {
  Color backg = const Color(0xFFc68281);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('Faturamento')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var teste = int.parse(doc["Teste"]);
        var teste2 = 2 + teste;
        print(teste2);
      });
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Faturamento"),
          centerTitle: true,
          backgroundColor: backg,
        ),
        body: Container(
            child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('faturamento').snapshots(),
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
                      child: Column(children: [
                        ListTile(
                          title: Text("${doc['Name']}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text("Valor: R\$ ${doc['Valor']}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text("Procedimento: ${doc['Procedimento']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text("Data: ${doc['Data']}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )),
                      ])),
                );
              },
            );
          },
        )));
  }
}
/**/
