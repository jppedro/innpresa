import 'package:flutter/material.dart';
import 'package:innpresa/events_details/event_details_background.dart';
import 'package:innpresa/events_details/event_details_content.dart';
import 'package:innpresa/events_page/events_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormEvento extends StatefulWidget {
  String id;
  FormEvento({this.id});

  String _selectedNome;

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

  var users = [];
  String nome;
  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    super.initState();

    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Cadastro de Evento",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _tipoDeEventoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Tipo de evento",
                          border: OutlineInputBorder())),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _diaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Dia", border: OutlineInputBorder())),
                ),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _horaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Hora", border: OutlineInputBorder())),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _localController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Local", border: OutlineInputBorder())),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nomeController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                  ),
                ),
                /*StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("funcionarios")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  var funcionarios = snapshot.data.docs;
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Selecione um funcionário'),
                      value: widget._selectedNome,
                      onChanged: (newValue) {
                        setState(() {
                          widget._selectedNome = newValue;
                        });
                      },
                      items: funcionarios.map((rawFunc) {
                        var func = rawFunc.data() as Map;
                        return DropdownMenuItem(
                            child: new Text(func["nome"]), value: rawFunc.id);
                      }).toList(),
                    ),
                  );
                }),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Selecione os participantes do evento: ",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: get_all_funcs(),
                ),
                /*TextFormField(
                controller: _funcionariosController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Funcionarios")),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: _imagemController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Imagem", border: OutlineInputBorder())),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection("eventos").add({
                            'dia': _diaController.text,
                            'hora': _horaController.text,
                            'idOrganizador': widget.id,
                            'nomeOrganizador': nome,
                            'image': _imagemController.text,
                            'local': _localController.text,
                            'nome': _nomeController.text,
                            'funcionarios': users,
                            'tipo': _tipoDeEventoController.text
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventsPage()));
                        },
                        color: Color.fromRGBO(143, 148, 251, 1),
                        child: Text("Cadastrar Evento",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ))
              ])),
        )));
  }

  Widget get_all_funcs() {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("funcionarios").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return RichText(
              text: TextSpan(
                  children: [TextSpan(text: "Nenhuma pessoa disponível.")]),
            );
          } else {
            return Column(
                children: List.generate(snapshot.data.docs.length, (index) {
              dynamic person = snapshot.data.docs[index];
              bool _isSelected = false;
              if (person.id == widget.id) nome = person.data()["nome"];
              return StatefulBuilder(builder: (context, setState) {
                return CheckboxListTile(
                  title: Container(
                      child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(person.data()["nome"]),
                        ],
                      )
                    ],
                  )),
                  value: _isSelected,
                  onChanged: (newValue) {
                    if (newValue == true) {
                      users.add(person.data()["image"]);
                    } else {
                      users.remove(person.data()["image"]);
                    }
                    setState(() {
                      _isSelected = newValue;
                    });
                  },
                );
              });
            }));
          }
        });
  }
}
