import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {
  String datahora = DateFormat("dd/MM/yyyy").format(DateTime.now());


  late String name, data, tel, proc, cpf;
  late double valor;
  late double porc;

  calculo() {
    double vinicial = (valor * porc) / 100;

    double porcf = 100 - porc;
    double vfinal = (valor * porcf) / 100;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Valor Total = ${valor}"),
                      Text("Valor inicial = ${vinicial}"),
                      Text("Valor final = ${vfinal}"),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  cadastrado(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Usuário cadastrado com sucesso."),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  getPorc(porc) {
    this.porc = porc;
  }

  getCpf(cpf) {
    this.cpf = cpf;
  }

  getName(name) {
    this.name = name;
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
        .collection("Geral")
        .doc("ClientesSimples")
        .collection("Todos")
        .doc();

    Map<String, dynamic> cliente = {
      'Cpf': cpf,
      'Name': name,
      'Data': data,
      'Tel': tel,
      'Procedimento': proc,
      'Valor': valor
    };

    documentReference.set(cliente).whenComplete(() {
      print("$name created");
    });
  }

  TodosClientes() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("TodosClientes").doc();

    Map<String, dynamic> cliente = {
      'Cpf': cpf,
      'Name': name,
      'Datanasc': data,
      'Tel': tel,
      'Data': datahora,

    };

    documentReference.set(cliente).whenComplete(() {
      print("$name created");
    });
  }

  saveFat() {

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("faturamento").doc();
    Map<String, dynamic> fat = {
      'Name': name,
      'Procedimento': proc,
      'Valor': valor,
      'Data': datahora,
    };
    documentReference.set(fat).whenComplete(() {
      print("$name created");
    });
  }

  savedataMega() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Geral")
        .doc("ClientesMega")
        .collection("Todos")
        .doc();

    Map<String, dynamic> cliente = {
      'Cpf': cpf,
      'Name': name,
      'Datanasc': data,
      'Tel': tel,
      'Procedimento': proc,
      'Valor': valor,
      'Data': datahora,
    };

    documentReference.set(cliente).whenComplete(() {
      print("$name created");
    });
  }

  String dropdownValue = 'Escolher';

  Color backg = const Color(0xFFc68281);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Cadastro"),
          centerTitle: true,
          backgroundColor: backg,
        ),
        body:Container(
          height: MediaQuery.of(context).size.height, //added dynamic height
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
                          },
                        ),
                        //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      ],
                    ),
                    //color: Colors.white,
                  ), //NOME
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
                      keyboardType: TextInputType.text,
                      onChanged: (String data) {
                        getData(data);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo inválido';
                        }
                        return null;
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
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
                          style: TextStyle(color: backg),
                          underline: Container(
                            height: 2,
                            color: backg,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              print(dropdownValue);
                            });
                          },
                          items: <String>['Escolher', 'Simples', 'Mega Hair']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
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
                          onChanged: (String ValorS) {
                            var valor = double.parse(ValorS);
                            getValor(valor);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
                          },
                        ),
                        //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      ],
                    ),
                    //color: Colors.white,
                  ),
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
                            labelText: "Porcentagem (%)",
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: (String Porcentagem) {
                            var porc = double.parse(Porcentagem);
                            getPorc(porc);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo inválido';
                            }
                            return null;
                          },
                        ),
                        //Text("RG:", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      ],
                    ),
                    //color: Colors.white,
                  ), //VALOR//VALOR
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(20),
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
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          if (dropdownValue == "Simples") {
                            print("Salvou simples");
                            savedataSimples();
                          } else if (dropdownValue == 'Mega Hair') {
                            print("salvou mega hair");
                            savedataMega();
                            calculo();
                          } else {}
                          TodosClientes();
                          saveFat();
                          cadastrado();

                        },
                      ),
                    ),
                  ) //BOTAO
                ],
              ),
            ),
          ),
        ));
  }
}
/**/
