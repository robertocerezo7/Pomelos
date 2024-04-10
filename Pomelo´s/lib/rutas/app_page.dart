import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tutoriales2/rutas/baseDatos.dart';
import 'package:tutoriales2/rutas/home_page.dart';
import 'package:tutoriales2/rutas/muestrario_page.dart';
import 'package:tutoriales2/rutas/my_flutter_app_icons.dart';
import 'package:tutoriales2/rutas/perfil_page.dart';

baseDatos data = baseDatos();

class App extends StatefulWidget {
  int pagina;

  App(this.pagina);

  @override
  _App createState() => _App(pagina);
}

class _App extends State<App> {
  int pagina = 0;

  _App(this.pagina);

  void initState() {
    super.initState();
    controller = PageController(initialPage: pagina);
    _selectedIndex = pagina;
  }

  PageController controller = PageController(initialPage: 2);
  int _selectedIndex = 0;
  ListQueue<int> _navigationQueue = ListQueue();

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    data.ini();
    data.insertar();
    data.rellenar();

    return Scaffold(
      body: PageView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          _onSwipeNavigation(value);
        },
        scrollDirection: Axis.horizontal,
        children: [
          HomePage(data),
          MuestrarioPage(data),
          PerfilPage(data),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.pomelo1),
            label: "Pomelo´s",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Muestrario",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          _onBottomNavigation(value);
        },
      ),
    );
  }

  void _onBottomNavigation(value) {
    _navigationQueue.addLast(_selectedIndex);
    controller.animateToPage(value,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _onSwipeNavigation(value) {
    setState(() {
      _selectedIndex = value;
      print(_selectedIndex);
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
