import 'package:flutter/material.dart';
import 'package:innpresa/models/evento_model.dart';
import 'package:innpresA/services/evento_service.dart';
import '../home/home_screen.dart';

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
  final _departamentosController = TextEditingController();
  final _funcionariosController = TextEditingController();
  final _timesController = TextEditingController();
  final _imagemController = TextEditingController();

  EventoService service = new EventoService();

  Evento evento;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      _getEvento(widget.id);
    }

    if (evento != null) {
      _tipoDeEventoController.text = evento.tipoDeEvento;
      _diaController.text = evento.dia;
      _horaController.text = evento.hora;
      _localController = evento.local;
      _funcionariosController = evento.funcionarios;
      _departamentosController = evento.departamentos;
      _timesController = evento.times;
      _imagemController.text = evento.imagemUrl;
    }
  }

  void _getEvento(String id) {
    evento = service.getEventoService(id);
    print(evento.tipoDeEvento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                evento != null ? "Edição do Evento" : "Cadastro do Evento")),
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
                controller: _departamentosController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Departamentos")),
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
                      Evento newEvento = Evento(
                          tipoDeEvento: _tipoDeEventoController.text,
                          dia: _diaController.text,
                          hora: _horaController.text,
                          local: _localController.text,
                          departamentos: _departamentosController.text,
                          times: _timesController.text,
                          funcionarios: _funcionariosController.text,
                          imagemUrl: _imagemController.text);
                      if (evento != null) {
                        service.editEvento(evento.id.toString(), newEvento);
                      } else {
                        service.addEvento(newEvento);
                      }

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    color: Colors.redAccent,
                    child: Text(evento != null ? "Salvar" : "Cadastrar",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ))
          ])),
        )));
  }
}
