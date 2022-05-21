class Mensajero {
  final String id;
  final String nombre;
  final String foto;
  final String placa;
  final String telefono;
  final String whatsapp;
  final String moto;
  final String soat;
  final String tecno;
  final String activo;

  Mensajero({
    required this.id,
    required this.nombre,
    required this.foto,
    required this.placa,
    required this.telefono,
    required this.whatsapp,
    required this.moto,
    required this.soat,
    required this.tecno,
    required this.activo,
  });

  factory Mensajero.fromJson(Map<String, dynamic> json) {
    return Mensajero(
      id: json['id'],
      nombre: json['nombre'],
      foto: json['foto'],
      placa: json['placa'],
      telefono: json['telefono'],
      whatsapp: json['whatsapp'],
      moto: json['moto'],
      soat: json['soat'],
      tecno: json['tecno'],
      activo: json['activo'],
    );
  }
}
