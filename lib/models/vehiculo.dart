class Vehiculo {
  final String id_vehiculo;
  final String tipo;
  final String placa;
  final String marca;

  Vehiculo({
    required this.id_vehiculo,
    required this.placa,
    required this.tipo,
    required this.marca,
  });

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      id_vehiculo: json['id_vehiculo'],
      tipo: json['tipo'],
      placa: json['placa'],
      marca: json['marca'],
    );
  }
}
