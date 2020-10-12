import 'package:flutter/cupertino.dart';

class FavoritosProvider with ChangeNotifier{
  List favoritos = [];
  
  eliminarFavorito(obj){
    favoritos.removeWhere((element) => obj['idRuta'] == element['idRuta']);
  }
  adicionarFavorito(obj){
    favoritos.add(obj);
  }
  gestionarFavorito(obj){
    var favorito = favoritos.where((element) => obj['idRuta'] == element['idRuta']);
    if(favorito.isEmpty){
      adicionarFavorito(obj);
    }else{
      eliminarFavorito(obj);
    }
    notifyListeners();
  }
  obtenerFavorito(obj){
    var esFavorito = favoritos.where((element) => obj['idRuta'] == element['idRuta']);
    return esFavorito.isNotEmpty;
  }
}