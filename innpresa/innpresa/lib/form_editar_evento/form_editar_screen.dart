import 'package:flutter/material.dart';
import 'package:innpresa/events_page/events_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormEditarEvento extends StatefulWidget {
  final DocumentSnapshot snapshot;
  String id;
  FormEditarEvento(this.snapshot);
  String _selectedNome;

  @override
  _FormEditarEventoState createState() => _FormEditarEventoState();
}

class _FormEditarEventoState extends State<FormEditarEvento> {
  //TextEditingController para capturar as informações do formulário
  TextEditingController _tipoDeEventoController;
  TextEditingController _diaController;
  TextEditingController _horaController;
  TextEditingController _localController;
  TextEditingController _nomeController;
  TextEditingController _imagemController;

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
    _tipoDeEventoController =
        TextEditingController(text: widget.snapshot.get("tipo"));
    _diaController = TextEditingController(text: widget.snapshot.get("dia"));
    _horaController = TextEditingController(text: widget.snapshot.get("hora"));
    _localController =
        TextEditingController(text: widget.snapshot.get("local"));
    _nomeController = TextEditingController(text: widget.snapshot.get("nome"));
    _imagemController =
        TextEditingController(text: widget.snapshot.get("image"));
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
            "Editar Evento",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(children: <Widget>[
            TextFormField(
                controller: _tipoDeEventoController,
                //initialValue: widget.snapshot.get("tipo"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Tipo de evento", border: OutlineInputBorder())),
            TextFormField(
                controller: _diaController,
                //initialValue: widget.snapshot.get("dia"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Dia", border: OutlineInputBorder())),
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
                //initialValue: widget.snapshot.get("hora"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Hora", border: OutlineInputBorder())),
            TextFormField(
                controller: _localController,
                //initialValue: widget.snapshot.get("local"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Local", border: OutlineInputBorder())),
            TextFormField(
              controller: _nomeController,
              //initialValue: widget.snapshot.get("nome"),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome", border: OutlineInputBorder()),
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
            get_all_funcs(),
            /*TextFormField(
                controller: _funcionariosController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Funcionarios")),*/
            TextFormField(
                controller: _imagemController,
                //initialValue: widget.snapshot.get("image"),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Imagem", border: OutlineInputBorder())),
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
                      FirebaseFirestore.instance
                          .collection("eventos")
                          .doc(widget.snapshot.id)
                          .update({
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
                    child: Text("Editar Evento",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
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
