import 'dart:convert';

Historia historiaFromJson(String str) => Historia.fromJson(json.decode(str));

String historiaToJson(Historia data) => json.encode(data.toJson());

class Historia {
  String nombre;
  String contenido;

  Historia({
    this.nombre,
    this.contenido,
  });

  factory Historia.fromJson(Map<String, dynamic> json) => Historia(
    nombre: json["nombre"],
    contenido: json["contenido"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "contenido": contenido,
  };
}