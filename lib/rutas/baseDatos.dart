import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Prenda.dart';

class baseDatos {
  List<Prenda> prendas = <Prenda>[];

  void insertar() {
    var a = Prenda(
        0,
        1,
        "La sudadera con capucha y cremallera completa Nike Sportswear Tech Fleece está confeccionada con tejido separador de doble cara para ofrecer calidez adicional sin añadir peso. La capucha con un ajuste ligeramente más alto en el cuello te protege de la humedad cuando llueve y hace frío.",
        0,
        0,
        "Nike Sportswear Tech Fleece ",
        "https://www.nike.com/es/t/sportswear-tech-fleece-sudadera-con-capucha-con-cremallera-completa-jMmfqR/CU4489-101");
    var b = Prenda(
        1,
        1,
        "La sudadera FFF está confeccionada con un tejido Fleece suave que ofrece comodidad y calidez para el día a día. Las coderas reforzadas recuerdan a las llamativas franjas de la bandera francesa.",
        0,
        0,
        "FFF ",
        "https://www.nike.com/es/t/fff-sudadera-de-tejido-fleece-fHw9Ch/CV5671-498");
    var c = Prenda(
        2,
        1,
        "Aunque esta prenda ofrezca calidez, también te hace destacar. La sudadera con capucha NikeCourt transforma un básico de fondo de armario con una innovadora versión llamativa del estampado tie-dye. Gracias al exclusivo proceso de teñido, cada sudadera con capucha es única.",
        0,
        1,
        "NikeCourt ",
        "https://www.nike.com/es/t/nikecourt-sudadera-con-capucha-de-tenis-con-estampado-tie-dye-gNqQ9t/DC7447-101");
    var d = Prenda(
        3,
        1,
        "Confeccionada con un tejido Fleece cepillado y cálido, la sudadera con capucha Nike Sportswear Essential ofrece suavidad y comodidad durante todo el día.El ajuste holgado y el diseño de los hombros con caída ofrecen un look informal.",
        0,
        1,
        "Nike Sportswear Essential ",
        "https://www.nike.com/es/t/sportswear-essential-sudadera-con-capucha-de-tejido-fleece-con-cremallera-completa-Jn6BV9/DQ3410-010");
    var e = Prenda(
        4,
        1,
        "La sudadera con capucha Nike Sportswear reinventa un estilo básico. El tejido French terry ofrece una calidez y una comodidad versátiles, al tiempo que el diseño de las mangas de raglán te ayuda a moverte sin distracciones. El cierre y el cordón elástico permiten regular la capucha.",
        0,
        1,
        "Nike Sportswear Swoosh ",
        "https://www.nike.com/es/t/sportswear-swoosh-sudadera-con-capucha-Gnd5gh/DC6938-010");
    var f = Prenda(
        5,
        2,
        "Este polo no es uno más, es The Nike Polo Slam.Cada detalle se ha diseñado para satisfacer las necesidades del día a día, desde su innovador tejido con capilarización del sudor hasta los toques naranjas que rinden homenaje a las cajas de zapatillas originales de Nike.El resultado es un estilo urbano y un look agradable tanto en el campo como en la cancha o en cualquier otro lugar.Este producto está confeccionado con al menos un 75 % de materiales sostenibles y utiliza una combinación de poliéster reciclado y fibras de algodón orgánico.La mezcla contiene al menos un 10 % de fibras recicladas o un 10 % de fibras de algodón orgánico.",
        0,
        0,
        "The Nike Polo Slam",
        "https://www.nike.com/es/t/polo-slam-polo-de-ajuste-entallado-zxnZdd/CV7876-102");
    var g = Prenda(
        6,
        2,
        "El Polo Nike Dri-FIT ADV Tiger Woods pone el rendimiento en primer lugar. Confeccionado con un tejido elástico con capilarización del sudor, este modelo diseñado para el movimiento eleva cualquier look con detalles exclusivos, como el logotipo TW y la frase Engineered to the exact specifications of Tiger Woods (Diseñado de acuerdo con las indicaciones específicas de Tiger Woods) en la parte interior del dobladillo trasero.",
        0,
        0,
        "Nike Dri-FIT ADV Tiger Woods ",
        "https://www.nike.com/es/t/dri-fit-adv-tiger-woods-polo-de-golf-G1LfW5/CU9528-677");
    var h = Prenda(
        7,
        2,
        "Este polo no es uno más, es The Nike Polo.Cada detalle se ha diseñado para satisfacer las necesidades del día a día, desde su innovador tejido con capilarización del sudor hasta los toques naranjas que rinden homenaje a las cajas de zapatillas originales de Nike.El resultado es un estilo urbano y un look agradable tanto en el campo como en la cancha o en cualquier otro lugar.Este producto está confeccionado con al menos un 75 % de materiales sostenibles y utiliza una combinación de poliéster reciclado y fibras de algodón orgánico.La mezcla contiene al menos un 10 % de fibras recicladas o un 10 % de fibras de algodón orgánico.",
        0,
        0,
        "The Nike Polo ",
        "https://www.nike.com/es/t/polo-polo-de-ajuste-entallado-con-diseno-color-block-JqsfpH/CU9537-451");
    var i = Prenda(
        8,
        2,
        "Encuentra tu estilo con la camiseta de capa media Nike Femme. Es una prenda ligera y suave, fácil de poner para el calentamiento o el enfriamiento. Los tirantes brillantes de la parte posterior y los laterales y el logotipo de oro añaden un toque de glamur a tu entrenamiento.",
        0,
        1,
        "Nike Femme ",
        "https://www.nike.com/es/t/camiseta-de-capa-media-de-running-HD0WnC/DA1232-601");
    var j = Prenda(
        9,
        2,
        "La camiseta de tirantes Nike Yoga Pointelle cuenta con tecnología de capilarización del sudor y ofrece transpirabilidad y frescura desde el primer estiramiento y una vez acabado el entrenamiento. Además tiene un estilo increíble.",
        0,
        1,
        "Nike Yoga Pointelle ",
        "https://www.nike.com/es/t/yoga-pointelle-camiseta-de-tirantes-0TWszg/DA0764-010");
    var k = Prenda(
        10,
        3,
        "Equípate para la naturaleza con el diseño resistente y repelente al agua del pantalón militar Nike ACG Smith Summit. Después de viajar al parque Smith Rock de Oregón en busca de inspiración, el resultado es el boceto del pantalón convertible y resistente ideal. El dobladillo abierto y el ajuste holgado ofrecen amplitud. Su gran número de bolsillos mantienen tu equipación a mano, y el mosquetón incorporado te permite enganchar las llaves. Este producto está confeccionado con al menos un 75 % de poliéster reciclado y fibras de nylon recicladas.",
        0,
        0,
        "Nike ACG Smith Summit",
        "https://www.nike.com/es/t/acg-smith-summit-pantalon-militar-3gdNSt/CV0655-004");
    var l = Prenda(
        11,
        3,
        "El jogger Nike Sportswear Tech Fleece está preparado para las temperaturas bajas y tiene un ajuste actualizado perfecto para el día a día. Cuenta con un ajuste holgado alrededor de la pierna y con un diseño entallado que se estrecha alrededor de la rodilla para darte una sensación de comodidad sin perder el look estilizado que tanto te gusta. Los puños elásticos altos completan el look de jogger, mientras que el bolsillo con cremallera en la pernera derecha proporciona un almacenamiento seguro para los objetos pequeños y estiliza la prenda.",
        0,
        0,
        "Nike Sportswear Tech Fleece ",
        "https://www.nike.com/es/t/sportswear-tech-fleece-jogger-xZp1BV/CU4495-410");
    var m = Prenda(
        12,
        3,
        "El pantalón Nike Sportswear está confeccionado con un ligero tejido French terry para ofrecer una opción cómoda y fácil de combinar con estilo. El estampado mejora el pantalón de chándal normal para ofrecer un look informal o urbano.",
        0,
        1,
        "Nike Sportswear ",
        "https://www.nike.com/es/t/sportswear-pantalon-con-estampado-lLN8cQ/DD9686-043");
    var n = Prenda(
        13,
        3,
        "No dejes que el calor te detenga en tu carrera diaria.Los leggings Nike Epic Fast incorporan malla detrás de las rodillas para mantener la transpirabilidad.El diseño suave y elástico con bolsillos es perfecto para carreras cortas y para el entrenamiento del día a día.Este producto se ha confeccionado con, al menos, un 50 % de fibras de poliéster reciclado.",
        0,
        1,
        "Nike Epic Fast ",
        "https://www.nike.com/es/t/epic-fast-leggings-de-running-de-7-8-de-talle-medio-hmkHWv/DJ2577-010");
    var o = Prenda(
        14,
        3,
        "El pantalón de tejido Fleece Nike Sportswear cuenta con un tejido French terry acampanado con un toque de pliegues para ofrecer un look moderno ideal entre semana y para el fin de semana. La cintura elástica con cordón ofrece un ajuste ceñido que se puede regular sobre la marcha.",
        0,
        1,
        "Nike Sportswear Trend ",
        "https://www.nike.com/es/t/sportswear-trend-pantalon-de-tejido-fleece-h9cHJw/DH1045-010");
    var p = Prenda(
        15,
        4,
        "Bienvenidos al vibrante mundo de Aka Boku. Inspirándose en los grafitis, los dibujos animados y los cómics, este diseñador lleva su original universo al mundo del calzado con esta colorida incorporación a la familia Future Rider. Este modelo incorpora llamativos diseños con bloques de color y personajes gráficos emblemáticos.",
        0,
        0,
        "Zapatillas PUMA x AKA BOKU Future Rider ",
        "https://eu.puma.com/es/es/pd/zapatillas-puma-x-aka-boku-future-rider/380169.html?dwvar_380169_color=01#productStorySection");
    var q = Prenda(
        16,
        4,
        "Luce un estilo único con estas zapatillas de la familia RS. En esta versión, el artista francés Aka Boku añade su toque distintivo con gráficos coloridos, inspirados en los cómics, y combinaciones de color energéticas, para crear un calzado que te hará destacar.",
        0,
        0,
        "Zapatillas PUMA x AKA BOKU RS-Connect ",
        "https://eu.puma.com/es/es/pd/zapatillas-puma-x-aka-boku-rs-connect/375968.html?dwvar_375968_color=01#productStorySection");
    var r = Prenda(
        17,
        4,
        "Pocos modelos de calzado han causado un impacto cultural tan profundo como las Suede. Estas emblemáticas zapatillas llevan con nosotros desde 1968, y la edición vintage de esta temporada se acerca todo lo posible a la original en cuanto a diseño, detalles de marca y fabricación.",
        0,
        2,
        "Zapatillas Suede Vintage MIJ Retro ",
        "https://eu.puma.com/es/es/pd/zapatillas-suede-vintage-mij-retro/380537.html?dwvar_380537_color=02#productStorySection");
    var s = Prenda(
        18,
        4,
        "Felipe Pantone es un artista argentino-español que trata temas contemporáneos y cuyo trabajo, centrado en el movimiento y la perspectiva, se caracteriza por los colores intensos y patrones geométricos. Esta incorporación femenina a la familia Rider se inspira en los automóviles vintage y luce un diseño divertido que refleja el uso que Felipe hace de los degradados de color y la absorción y el reflejo de la luz.",
        0,
        1,
        "Zapatillas para mujer PUMA x FELIPE PANTONE Cruise Rider ",
        "https://eu.puma.com/es/es/pd/zapatillas-para-mujer-puma-x-felipe-pantone-cruise-rider/375638.html?dwvar_375638_color=01");
    var t = Prenda(
        19,
        4,
        "Agárrate, que vienen curvas... Nuestra nueva silueta aporta una dimensión totalmente nueva a la familia Rider, con materiales innovadores y un aire atrevido y vanguardista. Inspiradas en la cultura juvenil y el estilo urbano, las Wild Rider Route cuentan con una suela dinámica con detalles de contraste, un elaborado exterior con diversas capas y detalles de marca que aportan un discreto destello metalizado.",
        0,
        1,
        "Zapatillas Wild Rider Route ",
        "https://eu.puma.com/es/es/pd/zapatillas-wild-rider-route/381597.html?dwvar_381597_color=05#productStorySection");
    var u = Prenda(
        20,
        5,
        "Chándal de dos piezas compuesto por: Chaqueta abierta bolsillos que incorpora rib en puños, cuello y bajo para un ajuste óptimo. Logotipo bordado. Pantalón con cintura elástica ajustable mediante cordones. Tiene bolsillos e incluye material rib en los puños que proporciona ajuste cómodo. Logotipo bordado.",
        0,
        0,
        "CHÁNDAL CHAMPIONSHIP VI NEGRO BLANCO ",
        "https://www.joma-sport.com/es/chandal-chandal-championship-vi-negro-blanco-101953.102?ret=%2Fes%2Fchandal-hombre");
    var v = Prenda(
        21,
        5,
        "Colección oficial del Comité Olímpico Español para los Juegos Olímpicos de Tokio 2020. Forma parte de la línea Villa Olímpica.",
        0,
        1,
        "CHANDAL PASEO COE ROJO-MARINO MUJER ",
        "https://www.joma-sport.com/es/camiseta-manga-larga-chandal-paseo-coe-rojo-marino-mujer-ce.312011w20?ret=%2Fes%2Fchandal-mujer");
    var w = Prenda(
        22,
        5,
        "Chándal completo. Chaqueta abierta con cremallera y bolsillos. Corte en pecho a contraste. Rib en puños y cintura. Pantalón con bolsillos y cintura elástica ajustable con cordón.  Logotipos en printing.",
        0,
        0,
        "CHANDAL ACADEMY II BLANCO-MARINO ",
        "https://www.joma-sport.com/es/chandal-academy-ii-blanco-marino-101352.203?tid=24");
    var x = Prenda(
        23,
        5,
        "Chándal oficial para la Federación de Tenis Italiana fabricado en poliéster compuesto de chaqueta con cremallera y pantalón. La chaqueta cuenta con bolsillo frontales y rib en el cuello y puños con los detalles de la bandera de Italia. Los pantalones cuentan con detalles de la bandera italiana.",
        0,
        1,
        "CHANDAL POLY. FIT BLANCO MUJER ",
        "https://www.joma-sport.com/es/chandal-poly.-fed.-tenis-it.-blanco-mujer-fit901469203?ret=%2Fes%2Fchandal-mujer");
    var y = Prenda(
        24,
        5,
        "Chándal formado por chaqueta y pantalón largo. Cremallera central, corte ranglán en las mangas para favorecer la libertad de movimientos, bolsillos en ambos lados con cremallera y rib en el cuello para un mejor ajuste. Incorporación de goma vista en puños y bajo para un ajuste óptimo. El pantalón cuenta con bolsillos laterales con cremallera, goma en la cintura, cordón interior y bajos de goma vista para un ajuste óptimo.",
        0,
        1,
        "CHANDAL ESSENTIAL MICRO MARINO-ROYAL MUJER ",
        "https://www.joma-sport.com/es/chandal-essential-micro-marino-royal-mujer-900700.307?ret=%2Fes%2Fchandal-mujer");
    var z = Prenda(
        25,
        6,
        "Puedes celebrar el Orgullo todos los días. Sobre todo si llevas unos calcetines que rinden homenaje a la unidad y el amor. Su diseño luce el mensaje Love Unites, el logotipo del trébol y detalles coloridos en la zona del tobillo. El pack incluye tres pares, justo los que necesitas para pasar un fin de semana largo.",
        0,
        2,
        "CALCETINES CLÁSICOS ",
        "https://www.adidas.es/calcetines-clasicos/HB6612.html");
    var a1 = Prenda(
        26,
        6,
        "Dale un respiro a tus pies. Estos calcetines finos y ligeros son tan cómodos como clásicos. Su diseño de canalé ayuda a mantenerlos en su sitio mientras vives tu vida. Nuestros productos de algodón se han fabricado de forma sostenible y ayudan a acabar con los residuos plásticos.",
        0,
        2,
        "CALCETINES CLÁSICOS TRICOLOR THIN RIBBED ",
        "https://www.adidas.es/calcetines-clasicos-tricolor-thin-ribbed/GN4913.html");
    var b1 = Prenda(
        27,
        6,
        "Envuelve tus pies en comodidad. Este paquete incluye tres pares de calcetines adidas con diseño acolchado. Combínalos con un pantalón corto de baloncesto y tus zapatillas preferidas.",
        0,
        2,
        "CALCETINES CLÁSICOS BASKETBALL ",
        "https://www.adidas.es/calcetines-clasicos-basketball/GU4382.html");
    var c1 = Prenda(
        28,
        6,
        "La cuerda de escalada y el piolet son opcionales, pero los calcetines son imprescindibles. Sal de casa con estos calcetines adidas inspirados en la ropa de outdoor de los 90 y descubre nuevos lugares y experiencias sin salir de la ciudad. Los paneles acolchados te ofrecen una pisada cómoda.",
        0,
        2,
        "CALCETINES ADIDAS ADVENTURE ",
        "https://www.adidas.es/calcetines-adidas-adventure/H32393.html");
    var d1 = Prenda(
        29,
        6,
        "Estos calcetines clásicos te proporcionan una pisada más cómoda gracias a su plantilla semiacolchada. Se han confeccionado en un suave tejido de algodón ligeramente elástico y cada par luce un color distinto. Presentan un largo a media pantorrilla y puños de canalé con el trébol y las 3 bandas.",
        0,
        2,
        "CALCETINES CLÁSICOS ",
        "https://www.adidas.es/calcetines-clasicos/GN3074.html");
    insertDog(a);
    insertDog(b);
    insertDog(c);
    insertDog(d);
    insertDog(e);
    insertDog(f);
    insertDog(g);
    insertDog(h);
    insertDog(i);
    insertDog(j);
    insertDog(k);
    insertDog(l);
    insertDog(b);
    insertDog(m);
    insertDog(n);
    insertDog(o);
    insertDog(p);
    insertDog(q);
    insertDog(r);
    insertDog(s);
    insertDog(t);
    insertDog(u);
    insertDog(v);
    insertDog(w);
    insertDog(x);
    insertDog(y);
    insertDog(z);
    insertDog(a1);
    insertDog(b1);
    insertDog(c1);
    insertDog(d1);
  }

  Future<Database> cargar() async {
    Future<Database> db = openDatabase(
      join(await getDatabasesPath(), 'prendas_database.db'),
    );
    return db;
  }

  Future<Database> ini() async {
    Future<Database> datos = openDatabase(
      join(await getDatabasesPath(), 'prendas_database.db'),
      onCreate: (datos, version) {
        return datos.execute(
          "CREATE TABLE prendas(id INTEGER PRIMARY KEY, nombre TEXT, categoria INTEGER,descripcion TEXT,link TEXT,favorito INTEGER,genero INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertDog(Prenda p) async {
    Database db = await cargar();

    await db.insert(
      'prendas',
      p.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Prenda>> obtenerdatos() async {
    // Obtiene una referencia de la base de datos
    Database db = await cargar();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('prendas');
    return List.generate(maps.length, (i) {
      return Prenda(
          maps[i]['id'],
          maps[i]['categoria'],
          maps[i]['descripcion'],
          maps[i]['favorito'],
          maps[i]['genero'],
          maps[i]['nombre'],
          maps[i]['link']);
    });
  }

  void rellenar() async {
    prendas = await obtenerdatos();
  }

  Future<void> updateDog(Prenda p) async {
    // Obtiene una referencia de la base de datos
    Database u = await cargar();

    // Actualiza el Dog dado
    await u.update(
      'prendas',
      p.toMap(),
      where: "id = ?",
      whereArgs: [p.id],
    );
  }

  List<Prenda> get todas {
    return prendas;
  }

  List<Prenda> ultimos() {
    List<Prenda> ul = <Prenda>[];
    for (var i = 0; i < 5; i++) {
      ul.add(prendas[i]);
    }
    return ul;
  }

  List<Prenda> tFav() {
    rellenar();
    List<Prenda> fav = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].favorito == 1) {
        fav.add(prendas[i]);
      }
    }
    return fav;
  }

  List<Prenda> fHom() {
    List<Prenda> hom = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].genero == 0) {
        hom.add(prendas[i]);
      }
    }
    return hom;
  }

  List<Prenda> fMuj() {
    List<Prenda> mu = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].genero == 1) {
        mu.add(prendas[i]);
      }
    }
    return mu;
  }

  List<Prenda> fSud() {
    List<Prenda> sud = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 1) {
        sud.add(prendas[i]);
      }
    }
    return sud;
  }

  List<Prenda> fcam() {
    List<Prenda> cam = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 2) {
        cam.add(prendas[i]);
      }
    }
    return cam;
  }

  List<Prenda> fpan() {
    List<Prenda> pan = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 3) {
        pan.add(prendas[i]);
      }
    }
    return pan;
  }

  List<Prenda> fzap() {
    List<Prenda> zap = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 4) {
        zap.add(prendas[i]);
      }
    }
    return zap;
  }

  List<Prenda> fcha() {
    List<Prenda> cha = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 5) {
        cha.add(prendas[i]);
      }
    }
    return cha;
  }

  List<Prenda> fri() {
    List<Prenda> ri = <Prenda>[];
    for (var i = 0; i < prendas.length; i++) {
      if (prendas[i].categoria == 6) {
        ri.add(prendas[i]);
      }
    }
    return ri;
  }
}
