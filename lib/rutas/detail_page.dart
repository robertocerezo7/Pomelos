import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tutoriales2/rutas/app_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'baseDatos.dart';

class DetailScreen extends StatefulWidget {
// Declara un campo que contenga el objeto Todo
  int todo;
  baseDatos a = baseDatos();

  // En el constructor, se requiere un objeto Todo
  DetailScreen(this.todo, this.a);

  @override
  _DetailScreen createState() => _DetailScreen(todo, a);
}

class _DetailScreen extends State<DetailScreen> {
  // Declara un campo que contenga el objeto Todo
  int id;
  baseDatos a = baseDatos();

  // En el constructor, se requiere un objeto Todo
  _DetailScreen(this.id, this.a);

  bool megusta;

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.todas[id].nombre.toString(),
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 2, right: 0, left: 0, bottom: 2),
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
                  data.todas[id].nombre,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                alignment: Alignment.centerLeft,
                width: double.maxFinite,
                child: Text(
                  data.todas[id].descripcion,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: ElevatedButton(
                    child: Text("Link de la prenda"),
                    onPressed: () {
                      var url = data.todas[id].link;
                      launch(url);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                  ),
                ),
              ),
            ],
          )),
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
