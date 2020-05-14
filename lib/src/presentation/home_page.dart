import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_bloc.dart';
import 'package:pa_onde_vamos/src/application/bloc/localizacion_eventos.dart';
import 'package:pa_onde_vamos/src/domain/localizacion.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _mostrarContenedor = false;
  String nombreDeLocalizacion = 'Valledupar';
  int _selectedIndex = 0;
  Localizacion localizacion;
  double _screenWidth = 0.0;

  double _screenHeight = 0.0;

  Duration _animationDuration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    localizacion = ModalRoute.of(context).settings.arguments;
    int _selectedPage = 0;
//    localizacionBloc.sendLocationEvent.add(ObtenerLocalizacion(nombreLocalizacion: nombreDeLocalizacion));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(57, 206, 231, 1),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _selectedPage = index;
                          });
                        }
                    ),
                    items: [
                      _construirContenedorDeImagen('https://larazon.co/wp-content/uploads/2020/03/Panoramicas-de-Valledupar-6-1132x670.jpg'),
                      _construirContenedorDeImagen('https://static.iris.net.co/semana/upload/images/2019/9/20/632828_1.jpg'),
                      _construirContenedorDeImagen('https://larazon.co/wp-content/uploads/2020/03/Panoramicas-de-Valledupar-6-1132x670.jpg'),
                    ],
                  ),
                  Container(margin: EdgeInsets.only(top: 20.0, left: 20.0), child: Text('${localizacion.nombre}', style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),)),
                  Container(margin: EdgeInsets.only(top: 10.0, left: 20.0),child: Text(localizacion.descripcion != null ?'${localizacion.descripcion}' : '', style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.normal))),
                ],
              ),
            ),
            AnimatedPositioned(
              top: _mostrarContenedor ? _screenHeight*0.35 : _screenHeight*0.7,
              bottom: -100,
              duration: _animationDuration,
              curve: Curves.fastOutSlowIn,
              child: Container(
                height: _screenHeight,
                width: _screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(28, 42, 158, 1), //Color.fromRGBO(233, 90, 109, 1),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.list, size: 30, color: Colors.white,),
          Icon(Icons.compare_arrows, size: 30, color: Colors.white,),
        ],
        onTap: (index) {
          switch(index){
            case 0:
              setState(() {
                _mostrarContenedor = false;
              });
              break;
            case 1:
              setState(() {
                _mostrarContenedor = true;
              });
              break;
            case 2:
              setState(() {
                _mostrarContenedor = true;
              });
              break;
          }
        },
      )
    );
  }

  Container _construirContenedorDeImagen(String urlImagen) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(urlImagen)
        ),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.22),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
