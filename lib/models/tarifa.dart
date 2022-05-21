class Tarifa {
  final String id_tarifa;
  final String tipo_vehiculo;
  final String valor_hora;
  final String valor_cuartoHora;

  Tarifa({
    required this.id_tarifa,
    required this.tipo_vehiculo,
    required this.valor_hora,
    required this.valor_cuartoHora,
  });

  factory Tarifa.fromJson(Map<String, dynamic> json) {
    return Tarifa(
      id_tarifa: json['id_tarifa'],
      tipo_vehiculo: json['tipo_vehiculo'],
      valor_hora: json['valor_hora'],
      valor_cuartoHora: json['valor_cuartoHora'],
    );
  }
}
