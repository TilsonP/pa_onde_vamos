import 'dart:convert';

Sitio sitioFromJson(String str) => Sitio.fromJson(json.decode(str));

String sitioToJson(Sitio data) => json.encode(data.toJson());

class Sitio {
  int id;
  String nombre;
  String descripcion;
  String posicion;
  String direccion;
  /*List<Evento> eventos;
  List<Actividad> actividades;*/

  Sitio({
    this.id,
    this.nombre,
    this.descripcion,
    this.posicion,
    this.direccion,
    /*this.eventos,
    this.actividades,*/
  });

  factory Sitio.fromJson(Map<String, dynamic> json) => Sitio(
    id: json["id"],
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    posicion: json["posicion"],
    direccion: json["direccion"],
    /*eventos: List<Evento>.from(json["eventos"].map((x) => Evento.fromJson(x))),
    actividades: List<Actividad>.from(json["actividades"].map((x) => Actividad.fromJson(x))),*/
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "descripcion": descripcion,
    "posicion": posicion,
    "direccion": direccion,
    /*"eventos": List<dynamic>.from(eventos.map((x) => x.toJson())),
    "actividades": List<dynamic>.from(actividades.map((x) => x.toJson())),*/
  };
}