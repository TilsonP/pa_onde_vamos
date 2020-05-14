
import 'dart:async';

import 'package:pa_onde_vamos/src/application/bloc/localizacion_estados.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_eventos.dart';
import 'package:pa_onde_vamos/src/infrastructure/localizacion_repositorio.dart';

class LocalizacionBloc{

  final _repository = new LocalizacionRepositorio();

  StreamController<LocalizacionEvento> _localizacionEntradaInput = StreamController();
  StreamController<LocalizacionEstado> _localizacionSalida = StreamController.broadcast();

  Stream<LocalizacionEstado> get locationStream => _localizacionSalida.stream;
  StreamSink<LocalizacionEvento> get sendLocationEvent => _localizacionEntradaInput.sink;

  LocationBloc(){
    _localizacionEntradaInput.stream.listen(_onEvent);
  }

  void _onEvent(LocalizacionEvento evento) async {

    if(evento is ObtenerLocalizacion){
      print('entra al solo');
      final localizacion = await _repository.buscarLocalizacion(evento.nombreLocalizacion);
      _localizacionSalida.add(LocalizacionCargada(localizacion: localizacion));
    }
    else if(evento is ObtenerLocalizaciones){
      print('entra al todos');
      final localizaciones = await _repository.buscarLocalizaciones();
      _localizacionSalida.add(LocalizacionesCargadas(localizaciones: localizaciones));
    }
  }

  void dispose(){
    _localizacionEntradaInput.close();
    _localizacionSalida.close();
  }

}

final localizacionBloc = LocalizacionBloc();