/*import 'package:innpresa/models/evento_model.dart';

class EventoService {
  List<Evento> _petList = [];

/*
  singleton
  Verifica se já existe uma instância criada da classe EventoService.
  Se já existir, retorna essa instância.
  Como estamos trabalhando com lista, nunca será retornada uma nova lista e sim,
  a lista existente que foi manipulada anteriormente
  */

  static final EventoService _singleton = EventoService._internal();

  factory EventoService() {
    return _singleton;
  }

  EventoService._internal() {
    _petList.add(Evento(
        id: 1,
        tipoDeEvento: "Pipoca",
        dia: "Fofura",
        hora: "York Shire",
        departamentos: "mini",
        funcionarios: "Pipoca",
        times: "Fofura",
        imagemUrl: "assets/images/pipoca.png"));

    _petList.add(Evento(
        id: 2,
        tipoDeEvento: "Pipoca",
        dia: "Fofura",
        hora: "York Shire",
        departamentos: "mini",
        funcionarios: "Pipoca",
        times: "Fofura",
        imagemUrl: "assets/images/rick.png"));
  }

  Future<List> getAllEventosService() async {
    final dataList = await DbUtil.getData('eventos');
    _petList = dataList
        .map((eventos) => Evento(
            id: eventos['id'],
            tipoDeEvento: eventos['nome'],
            dia: eventos['descricao'],
            hora: eventos['idade'],
            departamentos: eventos['raca'],
            funcionarios: eventos['tamanho'],
            times: eventos['times'],
            imagemUrl: eventos['imagemUrl']))
        .toList();
    print(_petList);
    return _petList;
  }

  void addEvento(Evento evento) {
    final newEvento = Evento(
        tipoDeEvento: evento.tipoDeEvento,
        dia: evento.dia,
        hora: evento.hora,
        departamentos: evento.departamentos,
        funcionarios: evento.funcionarios,
        times: evento.times,
        imagemUrl: evento.imagemUrl);
    print(newEvento.toMap());
    DbUtil.insertData('eventos ', newEvento.toMap());
  }

  void editEvento(String id, Evento newEvento) {
    Evento editarEvento = getEventoService(id);
    editarEvento.tipoDeEvento = newEvento.tipoDeEvento;
    editarEvento.dia = newEvento.dia;
    editarEvento.hora = newEvento.hora;
    editarEvento.departamentos = newEvento.departamentos;
    editarEvento.funcionarios = newEvento.funcionarios;
    editarEvento.times = newEvento.times;
    editarEvento.imagemUrl = newEvento.imagemUrl;
  }

  Evento getEventoService(String id) {
    return _petList.singleWhere((pet) => pet.id == id);
  }
}*/
