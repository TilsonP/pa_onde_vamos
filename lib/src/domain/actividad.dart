import 'dart:convert';

Actividad actividadFromJson(String str) => Actividad.fromJson(json.decode(str));

String actividadToJson(Actividad data) => json.encode(data.toJson());

class Actividad {
  String nombre;
  String descripcion;
  String categoria;

  Actividad({
    this.nombre,
    this.descripcion,
    this.categoria,
  });

  factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    categoria: json["categoria"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "descripcion": descripcion,
    "categoria": categoria,
  };
}