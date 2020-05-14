

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pa_onde_vamos/src/domain/localizacion.dart';

abstract class LocalizacionEvento extends Equatable{
  const LocalizacionEvento();
}

class ObtenerLocalizaciones extends LocalizacionEvento{

  final List<Localizacion> localizaciones = [];

  @override
  List<Object> get props => [localizaciones];
}

class ObtenerLocalizacion extends LocalizacionEvento{
  final String nombreLocalizacion;

  const ObtenerLocalizacion({@required this.nombreLocalizacion}) : assert(nombreLocalizacion != null);

  @override
  List<Object> get props => [nombreLocalizacion];
}