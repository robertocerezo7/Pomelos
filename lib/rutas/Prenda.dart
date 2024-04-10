class Prenda {
  final int id;
  final String nombre;
  final int categoria;
  final String descripcion;
  final String link;
   int _favorito;



  final int genero;


  Prenda(this.id, this.categoria, this.descripcion,this._favorito, this.genero ,this.nombre ,this.link);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'categoria': categoria,
      'descripcion': descripcion,
      'link': link,
      'favorito': _favorito,
      'genero': genero
    };
  }

  set favorito(int value) {
    _favorito = value;
  }
  int get favorito => _favorito;



}