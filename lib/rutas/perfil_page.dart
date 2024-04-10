import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutoriales2/rutas/app_page.dart';
import 'package:tutoriales2/rutas/home_page.dart';
import 'package:tutoriales2/rutas/muestrario_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'baseDatos.dart';
import 'detail_page.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage(baseDatos data);
  @override
  _PerfilPage createState() => _PerfilPage();
}

class _PerfilPage extends State<PerfilPage> {
  List<int> favo = List.generate(data.tFav().length, (i) => data.tFav()[i].id);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 40,
                    child: FittedBox(
                      child: Image.asset("assets/images/pomelo.png"),
                    )),
              ),
              Text("Perfil",
                  style: TextStyle(fontSize: 20, color: Colors.orange)),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            margin: const EdgeInsets.only(bottom: 8, top: 8, left: 3, right: 3),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      "Articulos que te han gustado",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  Expanded(
                      flex: 0,
                      child: Center(
                        child: _buildGrid(),
                      )),
                ],
              ),
            )));
  }

  Widget _buildGrid() => GridView.extent(
      controller: ScrollController(keepScrollOffset: false),
      scrollDirection: Axis.vertical,
      maxCrossAxisExtent: 150,
      shrinkWrap: true,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: _buildGridTileList(favo.length));

  List<Widget> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
          width: 50,
          height: 50,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen1(favo[i], data),
                ),
              );

              setState(() {
                favo =
                    List.generate(data.tFav().length, (i) => data.tFav()[i].id);
              });
            },
            child: Container(
              child: ClipRRect(
                child: Image.asset('assets/images/pic${favo[i]}.jpeg'),
              ),
            ),
          )));
}

class DetailScreen1 extends StatefulWidget {
// Declara un campo que contenga el objeto Todo
  int todo;
  baseDatos a = baseDatos();

  // En el constructor, se requiere un objeto Todo
  DetailScreen1(this.todo, this.a);

  @override
  _DetailScreen1 createState() => _DetailScreen1(todo, a);
}

class _DetailScreen1 extends State<DetailScreen1> {
  // Declara un campo que contenga el objeto Todo
  int id;
  baseDatos a = baseDatos();

  // En el constructor, se requiere un objeto Todo
  _DetailScreen1(this.id, this.a);

  bool megusta;

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            data.todas[id].nombre.toString(),
            style: TextStyle(color: Colors.orange),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => App(2),
                ),
              )
            },
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 2, right: 0, left: 0, bottom: 2),
            color: Colors.white,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.ltr,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 400,
                      child: InkWell(
                        onDoubleTap: () {
                          meGusta(!megusta, id);
                        },
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 50,
                            ),
                          ]),
                          child: FittedBox(
                            child: Image.asset('assets/images/pic${id}.jpeg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        child: IconButton(
                          icon: (() {
                            if (data.todas[id].favorito == 1) {
                              megusta = true;
                              return new Icon(
                                Icons.favorite,
                                color: Colors.orange,
                                size: 30,
                              );
                            } else {
                              megusta = false;
                              return Icon(
                                Icons.favorite_outline,
                                color: Colors.orange,
                                size: 30,
                              );
                            }
                          }()),
                          onPressed: () {
                            meGusta(!megusta, id);
                          },
                        ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text(
                    "Articulo: " + data.todas[id].nombre,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.end,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                  alignment: Alignment.centerLeft,
                  width: double.maxFinite,
                  child: Text(
                    "Descripción: " + data.todas[id].descripcion,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      text: "Link: ",
                    ),
                    TextSpan(
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline),
                        text: "Ir a la página",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url = data.todas[id].link;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw "No se puede cargar la url";
                            }
                          })
                  ])),
                ),
              ],
            )),
      ),
    );
  }

  void meGusta(bool newValue, int num) => setState(() {
        megusta = newValue;
        if (megusta == true) {
          a.todas[num].favorito = 1;
          a.updateDog(a.todas[num]);
        } else {
          a.todas[num].favorito = 0;
          a.updateDog(a.todas[num]);
        }
      });
}
