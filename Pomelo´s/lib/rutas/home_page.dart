import 'dart:collection';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tutoriales2/rutas/app_page.dart';
import 'package:tutoriales2/rutas/detail_page.dart';

import 'Prenda.dart';
import 'baseDatos.dart';

class Producto {
  final int codigo;

  Producto(this.codigo);
}

class HomePage extends StatefulWidget {
  HomePage(baseDatos data);
  @override
  _HomePage createState() => _HomePage();
}

final List<int> productos = <int>[20, 1, 3, 15, 4];

var random = new Random();
int r = random.nextInt(data.prendas.length);

class _HomePage extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final controller = PageController(initialPage: 0);
  ListQueue<int> _navigationQueue = ListQueue();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //Icon(
            //  MyFlutterApp.pomelo1,
            //  color: Colors.orange,
            //),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  child: FittedBox(
                    child: Image.asset("assets/images/pomelo.png"),
                  )),
            ),

            Text("Pomelo´s",
                style: TextStyle(fontSize: 20, color: Colors.orange)),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 30, bottom: 20, left: 6),
              alignment: Alignment.centerLeft,
              child: Text('Ultimos articulos :',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87))),
          Container(
              height: 400,
              child: Swiper5(
                  todos: List.generate(
                      productos.length, (productos) => Producto(productos)))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Pulsa para mostrar una prenda aleatoria: ",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 0,
          ),
          Expanded(
              child: ElevatedButton.icon(
            onPressed: () {
              r = random.nextInt(data.prendas.length);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(r, data),
                ),
              );
            },
            icon: Icon(Icons.shuffle),
            label: Text(""),
            style: ButtonStyle(
              alignment: Alignment.center,
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              animationDuration: Duration(seconds: 0),
              shape: MaterialStateProperty.all(CircleBorder()),
              shadowColor: MaterialStateProperty.all(Colors.orange),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          )),
        ],
      ),
    );
  }
}

class Swiper5 extends StatelessWidget {
  final List<Producto> todos;

  Swiper5({Key key, @required this.todos}) : super(key: key);

  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(
            child: Image.asset('assets/images/pic${productos[index]}.jpeg'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(productos[index], data),
              ),
            );
          },
        );
      },
      autoplay: true,
      itemCount: 5,
      //layout: SwiperLayout.STACK,
      scrollDirection: Axis.horizontal,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }
}

class DetailScreen1 extends StatelessWidget {
  int r = random.nextInt(5);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.todas[r].nombre.toString(),
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => {Navigator.pop(context)},
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
              Container(
                  width: 400,
                  child: FittedBox(
                    child: Image.asset(
                        'assets/images/pic${data.todas[r].id}.jpeg'),
                    fit: BoxFit.fill,
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                width: double.maxFinite,
                child: Text(
                  "Articulo: ${data.todas[r].nombre}",
                  style: TextStyle(fontSize: 20, color: Colors.black38),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          )),
    );
  }
}
