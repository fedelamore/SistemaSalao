import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadSimples extends StatefulWidget {
  @override
  State<CadSimples> createState() => _CadSimplesState();
}

class _CadSimplesState extends State<CadSimples> {
  late String name, email, data, tel, proc,cpf;
  late String valor;

  getCpf(cpf) {
    this.cpf = cpf;
  }

  getName(name) {
    this.name = name;
  }

  getEmail(email) {
    this.email = email;
  }

  getData(data) {
    this.data = data;
  }

  getTel(tel) {
    this.tel = tel;
  }

  getProc(proc) {
    this.proc = proc;
  }

  getValor(valor) {
    this.valor = valor;
  }


  savedataSimples() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("clientes")
        .doc("Mega")
        .collection("Clientes")
        .doc();
    Map<String, dynamic> cliente = {
      'Cpf': cpf,
      'Name': name,
      'Email': email,
      'Data': data,
      'Tel': tel,
      'Procedimento': proc,
      'Valor': valor
    };

    documentReference.set(cliente).whenComplete(() {
      print("$name created");
    });
  }

  savedataMega() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("clientes")
        .doc("Mega")
        .collection("Clientes")
        .doc();
    Map<String, dynamic> cliente = {
      'Cpf': cpf,
      'Name': name,
      'Email': email,
      'Data': data,
      'Tel': tel,
      'Procedimento': proc,
      'Valor': valor
    };

    documentReference.set(cliente).whenComplete(() {
      print("$name created");
    });
  }

  String dropdownValue = 'Simples';

  readData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("clientes")
        .doc("Mega")
        .collection("Clientes")
        .doc();

    documentReference.get().then((snapshot) {
      print("entru");
      print(snapshot.exists);
    });
  }

  Color backg = const Color(0xFFc68281);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Cadastro Simples"),
        centerTitle: true,
        backgroundColor: backg,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //inputFormatters: [maskFormatter],
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Cpf",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (String cpf) {
                        getCpf(cpf);
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    FlatButton(
                      color: backg,
                      textColor: Colors.white,
                      child: Text('Verificar CPF'),
                      onPressed: () {
                        readData();
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String name) {
                        getName(name);
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ), //NOME
              SizedBox(
                height: 4,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String email) {
                        getEmail(email);
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ), //EMAIL
              SizedBox(
                height: 6,
              ), //CPF
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: TextFormField(
                  //cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    labelText: "Data de nascimento",
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (String data) {
                    getData(data);
                  },
                ),
                //color: Colors.white,
              ), //CPF
              SizedBox(
                height: 6,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (String tel) {
                        getTel(tel);
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          print(dropdownValue);
                        });
                      },
                      items: <String>['Simples', 'Mega Hair']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ), //ESCOLHA//TELEFONE
              SizedBox(
                height: 6,
              ), //CPF
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Procedimento",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String proc) {
                        getProc(proc);
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ), //PROCEDIMENTO
              SizedBox(
                height: 6,
              ), //CPF
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Text("Nome Comp.:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    TextFormField(
                      //cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        labelText: "Valor",
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (String valor) {
                        getValor(valor);
                      },
                    ),
                    //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                  ],
                ),
                //color: Colors.white,
              ), //VALOR
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  width: 120,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: backg),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                    onTap: () {
                      if (dropdownValue == "Simples") {
                        print("Salvou simples");
                        savedataSimples();
                      } else {
                        print("salvou mega hair");
                        savedataMega();
                      }
                      //savedata();
                      //print("name: ${name}");
                    },
                  ),
                ),
              ) //BOTAO
            ],
          ),
        ],
      ),
    );
  }
}
