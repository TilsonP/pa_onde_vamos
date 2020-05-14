
import 'package:flutter/material.dart';
import 'package:pa_onde_vamos/src/domain/localizacion.dart';

abstract class LocalizacionEstado{}

class SinLocalizaciones extends LocalizacionEstado {}

class CargandoLocalizaciones extends LocalizacionEstado{}

class LocalizacionCargada extends LocalizacionEstado{

  final Localizacion localizacion;

  LocalizacionCargada({@required this.localizacion}) : assert(localizacion != null);

  List<Object> get props => [localizacion];
}

class LocalizacionesCargadas extends LocalizacionEstado{

  final List<Localizacion> localizaciones;

  LocalizacionesCargadas({@required this.localizaciones}) : assert(localizaciones != null);

  @override
  List<Object> get props => [localizaciones];
}

class ErrorLocalizacion extends LocalizacionEstado{}