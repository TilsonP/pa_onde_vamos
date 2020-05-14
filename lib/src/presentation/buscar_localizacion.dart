import 'package:flutter/material.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_bloc.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_estados.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_eventos.dart';
import 'package:pa_onde_vamos/src/infrastructure/localizacion_repositorio.dart';

class BuscarLocalizacion extends StatelessWidget {

  LocalizacionRepositorio repositorio;

  @override
  Widget build(BuildContext context) {
    repositorio = new LocalizacionRepositorio();
//    localizacionBloc.sendLocationEvent.add(ObtenerLocalizaciones());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(57, 206, 231, 1), //Color.fromRGBO(249, 167, 84, 1),
                  Color.fromRGBO(28, 42, 158, 1) //Color.fromRGBO(233, 90, 109, 1)
                ],
                stops: [0.0, 0.95]
            )
        ),
        child: FutureBuilder(
          future: repositorio.buscarLocalizaciones(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data != null){
              return ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, item) => _construirItem(context, snapshot.data[item])
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _construirItem(BuildContext context, localizacion) {
    return Container(
      child: GestureDetector(
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              /*Container(
                  height: _screenSize.height*0.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                      image: DecorationImage(
                          image: NetworkImage(localizacion.image),
                          colorFilter: new ColorFilter.mode(Color.fromRGBO(244, 100, 82, 0.5), BlendMode.dstATop),
                          fit: BoxFit.cover
                      )
                  )
              ),*/
              ListTile(
                title: Text(localizacion.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
//                subtitle: Text(localizacion.tipo),
                trailing: Icon(Icons.info),
                onTap: ()=>Navigator.pushNamed(context, '/', arguments: localizacion),
              ),
            ],
          ),
        ),
//        onTap: () => Navigator.of(context).pushNamed('/details_site', arguments: site),
      ),
    );
  }
}
