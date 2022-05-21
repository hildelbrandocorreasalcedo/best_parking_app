class Parqueo {
  final String id_parqueo;
  final String id_vehiculo;
  final String tipo;
  final String placa;
  final String marca;
  final String hora_entrada;
  final String foto_vehiculo;
  final String estado;

  Parqueo({
    required this.id_parqueo,
    required this.id_vehiculo,
    required this.tipo,
    required this.placa,
    required this.marca,
    required this.hora_entrada,
    required this.foto_vehiculo,
    required this.estado,
  });

  factory Parqueo.fromJson(Map<String, dynamic> json) {
    return Parqueo(
      id_parqueo: json['id_parqueo'],
      id_vehiculo: json['id_vehiculo'],
      tipo: json['tipo'],
      placa: json['placa'],
      marca: json['marca'],
      hora_entrada: json['hora_entrada'],
      foto_vehiculo: json['foto_vehiculo'],
      estado: json['estado'],
    );
  }
}