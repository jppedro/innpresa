import 'package:flutter/material.dart';
import 'package:innpresa/events_page/events_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormEvento extends StatefulWidget {
  String id;
  FormEvento({this.id});

  @override
  _FormEventoState createState() => _FormEventoState();
}

class _FormEventoState extends State<FormEvento> {
  //TextEditingController para capturar as informações do formulário
  final _tipoDeEventoController = TextEditingController();
  final _diaController = TextEditingController();
  final _horaController = TextEditingController();
  final _localController = TextEditingController();
  final _nomeController = TextEditingController();
  final _funcionariosController = TextEditingController();
  final _timesController = TextEditingController();
  final _imagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cadastro de Evento")),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(children: <Widget>[
            TextFormField(
                controller: _tipoDeEventoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Tipo de evento")),
            TextFormField(
                controller: _diaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Dia")),
            // DropdownButtonFormField<String>(
            //     //value: racaEvento,
            //     decoration: InputDecoration(labelText: "Selecione a raça"),
            //     onChanged: (String racaSelecionada) {
            //       setState(() {
            //         racaEvento = racaSelecionada;
            //         print(racaEvento);
            //       });
            //     },
            //     items: <String>[
            //       'York Shire',
            //       'Pastor Alemão',
            //       'Pinscher',
            //       'Schnauzer'
            //     ]
            //         .map(
            //           (e) => DropdownMenuItem(value: e, child: Text(e)),
            //         )
            //         .toList()),
            TextFormField(
                controller: _horaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Hora")),
            TextFormField(
                controller: _localController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Local")),
            TextFormField(
                controller: _nomeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Nome")),
            TextFormField(
                controller: _timesController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Times")),
            TextFormField(
                controller: _funcionariosController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Funcionarios")),
            TextFormField(
                controller: _imagemController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Imagem")),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Firestore.instance.collection("eventos").add({
                        'dia': _diaController.text,
                        'hora': _horaController.text,
                        'idOrganizador': 1,
                        'image': _imagemController.text,
                        'local': _localController.text,
                        'nome': _nomeController.text,
                        'tipo': _tipoDeEventoController.text
                      });

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventsPage()));
                    },
                    color: Colors.redAccent,
                    child: Text("Cadastar Evento",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ))
          ])),
        )));
  }
}
