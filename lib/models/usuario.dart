class Usuario {
  var id_usuario;
  var nombre;
  var identificacion;
  var rol;
  var usuario;
  var clave;

  Usuario({
    this.id_usuario,
    this.nombre,
    this.identificacion,
    this.rol,
    this.usuario,
    this.clave,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id_usuario: json['id'],
      nombre: json['nombre'],
      identificacion: json['identificacion'],
      rol: json['rol'],
      usuario: json['usuario'],
      clave: json['clave'],
    );
  }
}
