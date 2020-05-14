import 'package:firebase_database/firebase_database.dart';
import 'package:pa_onde_vamos/src/domain/localizacion.dart';

class LocalizacionRepositorio{

  static final db = FirebaseDatabase.instance.reference();
  static final localizacionesDocument = db.child('departamentos').child('Cesar');

  LocalizacionRepositorio(){
    FirebaseDatabase.instance.setPersistenceEnabled(true);
    localizacionesDocument.keepSynced(true);
  }

  buscarLocalizacion(String nombre) async {
    Localizacion finallocalizacion;

    await localizacionesDocument.once().then((DataSnapshot snapshot){


      var localizacionesIds = snapshot.value.keys;
      var localizacionesValue = snapshot.value;


      for(var locationId in localizacionesIds){
        var localizacion = new Map<String, dynamic>.from(localizacionesValue[locationId]);
        var temporalLocalizacion = new Localizacion.fromJson(localizacion);
        if(temporalLocalizacion.nombre == nombre) finallocalizacion = temporalLocalizacion;

      }

      return null;

    }).catchError((onError){
      print('Error: ${onError}');
    });

    return finallocalizacion;
  }

  buscarLocalizaciones() async {
    List<Localizacion> localizaciones = new List();

    await localizacionesDocument.once().then((DataSnapshot snapshot){



      snapshot.value.forEach((value){
        var localizacion = new Map<String, dynamic>.from(value);
        print(localizacion);
        localizaciones.add(new Localizacion.fromJson(localizacion));
      });

    }).catchError((onError){
      print('Error: ${onError}');
    });

    return localizaciones;
  }
}