import 'dart:convert';

import 'package:pa_onde_vamos/src/domain/sitio.dart';

import 'historia.dart';

Localizacion localizacionFromJson(String str) => Localizacion.fromJson(json.decode(str));

String localizacionToJson(Localizacion data) => json.encode(data.toJson());

class Localizacion {

  String nombre;
  String descripcion;
  String departamento;
  String posicion;
  List<Sitio> sitios;
  List<Historia> historias;

  Localizacion({
    this.nombre,
    this.descripcion,
    this.departamento,
    this.posicion,
    this.sitios,
    this.historias,
  });

  factory Localizacion.fromJson(Map<String, dynamic> json)  {
    List<Sitio> sitiosLista;
    List<Historia> historiasLista;

    var list = json["sitios"] as List;
    list != null ? sitiosLista = list.map((sitio) => Sitio.fromJson(new Map<String, dynamic>.from(sitio))).toList() : [];

    list = json['historias'] as List;
    list != null ? historiasLista = list.map((historia) => Historia.fromJson(new Map<String, dynamic>.from(historia))).toList() : [];

    return Localizacion(
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    departamento: json["departamento"],
    posicion: json["posicion"],
    sitios: sitiosLista,
    historias: historiasLista,
  );
  }

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "descripcion": descripcion,
    "departamento": departamento,
    "posicion": posicion,
    "sitios": List<dynamic>.from(sitios.map((x) => x.toJson())),
    "historias": List<dynamic>.from(historias.map((x) => x.toJson())),
  };
}