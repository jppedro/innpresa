class Evento {
  int id;
  String tipoDeEvento;
  String dia;
  String hora;
  String local;
  String departamentos;
  String times;
  String funcionarios;
  String imagemUrl;

  //Contrutor
  Evento(
      {this.id,
      this.tipoDeEvento,
      this.dia,
      this.hora,
      this.local,
      this.departamentos,
      this.funcionarios,
      this.times,
      this.imagemUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipoDeEvento': tipoDeEvento,
      'dia': dia,
      'hora': hora,
      'local': local,
      'departamentos': departamentos,
      'funcionarios': funcionarios,
      'times': times,
      'imagemUrl': imagemUrl
    };
  }
}
