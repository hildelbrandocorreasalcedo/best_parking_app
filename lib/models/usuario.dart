class Usuario {
  var usuario;
  var contrasena;

  Usuario({
    this.usuario,
    this.contrasena,
  });
}

List<Usuario> usuarios = [
  Usuario(usuario: 'operario', contrasena: '123'),
  Usuario(usuario: 'admin', contrasena: '123')
];
