class Factura {
  final String id_factura;
  final String id_parqueo;
  final String numero_horas;
  final String total_pagar;
  final String id_tarifa;

  Factura({
    required this.id_factura,
    required this.id_parqueo,
    required this.numero_horas,
    required this.total_pagar,
    required this.id_tarifa,
  });

  factory Factura.fromJson(Map<String, dynamic> json) {
    return Factura(
      id_factura: json['id_factura'],
      id_parqueo: json['id_parqueo'],
      numero_horas: json['numero_horas'],
      total_pagar: json['total_pagar'],
      id_tarifa: json['id_tarifa'],
    );
  }
}
