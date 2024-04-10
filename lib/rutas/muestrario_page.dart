import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutoriales2/rutas/app_page.dart';
import 'package:tutoriales2/rutas/baseDatos.dart';
import 'package:tutoriales2/rutas/detail_page.dart';

import 'Prenda.dart';

class MuestrarioPage extends StatefulWidget {
  MuestrarioPage(baseDatos data);

  @override
  _MuestrarioPage createState() => _MuestrarioPage();
}

bool men = false;
bool women = false;
bool sweatshirt = false;
bool tshirts = false;
bool pants = false;
bool sneakers = false;
bool tracksuit = false;
bool underwear = false;
bool jackets = false;

enum Categoria {
  hombre,
  mujer,
  sudaderas,
  camisetas,
  pantalones,
  zapatillas,
  chandal,
  ropainterior,
  todas
}
Categoria cat = Categoria.todas;

List<Prenda> cargar() {
  List<Prenda> principal;
  if (cat.index == 0) {
    principal = data.fHom();
  } else {
    if (cat.index == 1) {
      principal = data.fMuj();
    } else {
      if (cat.index == 2) {
        principal = data.fSud();
      } else {
        if (cat.index == 3) {
          principal = data.fcam();
        } else {
          if (cat.index == 4) {
            principal = data.fpan();
          } else {
            if (cat.index == 5) {
              principal = data.fzap();
            } else {
              if (cat.index == 6) {
                principal = data.fcha();
              } else {
                if (cat.index == 7) {
                  principal = data.fri();
                } else {
                  if (cat.index == 8) {
                    principal = data.todas;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return principal;
}

class _MuestrarioPage extends State<MuestrarioPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
              Text("Muestrario",
                  style: TextStyle(fontSize: 20, color: Colors.orange)),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.rule_outlined,
              ),
              color: Colors.orange,
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ],
        ),
        endDrawer: Drawer(
            child: ListView(
          children: <Widget>[
            RadioListTile(
              title: Text("Todas"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.todas,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Hombre"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.hombre,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Mujer"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.mujer,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Sudaderas"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.sudaderas,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Camisetas"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.camisetas,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Pantalones"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.pantalones,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Zapatillas"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.zapatillas,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Chandal"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.chandal,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
            RadioListTile(
              title: Text("Ropa Interior"),
              controlAffinity: ListTileControlAffinity.leading,
              value: Categoria.ropainterior,
              groupValue: cat,
              onChanged: (Categoria value) {
                setState(() {
                  if (cat == value) {
                    cat = null;
                  } else {
                    cat = value;
                  }
                });
              },
              activeColor: Colors.orange,
            ),
          ],
        )),
        body: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: RefreshIndicator(
              onRefresh: () async {
                _refresh();
              },
              child: Muestrario(),
            ),
          ),
        ));
  }

  void onChangeMen(bool newValue) => setState(() {
        men = newValue;
      });

  void onChangeWomen(bool newValue) => setState(() {
        women = newValue;
      });

  void onChangeSweatshirt(bool newValue) => setState(() {
        sweatshirt = newValue;
      });

  void onChangeTshirts(bool newValue) => setState(() {
        tshirts = newValue;
      });

  void onChangePants(bool newValue) => setState(() {
        pants = newValue;
      });

  void onChangeSneakers(bool newValue) => setState(() {
        sneakers = newValue;
      });

  void onChangeTracksuit(bool newValue) => setState(() {
        tracksuit = newValue;
      });

  void onChangeUnderwear(bool newValue) => setState(() {
        underwear = newValue;
      });

  void onChangeJackets(bool newValue) => setState(() {
        jackets = newValue;
      });
}

class Muestrario extends StatelessWidget {
  Muestrario();

  Widget build(BuildContext context) {
    return new ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, selectedIndex) => Divider(
        color: Colors.black12,
      ),
      padding: const EdgeInsets.only(bottom: 4, left: 0, right: 0, top: 4),
      itemCount: cargar().length,
      itemBuilder: (BuildContext context, selectedIndex) {
        return InkWell(
          child: Container(
              padding: EdgeInsets.only(top: 2, right: 0, left: 0, bottom: 2),
              color: Colors.transparent,
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.ltr,
                children: [
                  Container(
                    color: Colors.white,
                    width: 400,
                    height: 400,
                    padding: EdgeInsets.all(35.0),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 50,
                        ),
                      ]),
                      child: FittedBox(
                        child: Image.asset(
                            'assets/images/pic${cargar()[selectedIndex].id}.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: Text(
                      "${cargar()[selectedIndex].nombre}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black38,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(cargar()[selectedIndex].id, data),
              ),
            );
          },
        );
      },
    );
  }
}

Future<Null> _refresh() async {
  //selectedIndex = selectedIndex + 1;
  return await Future.delayed(Duration(seconds: 3000));
}
