import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  List<String> _words = [];
  List<String> get words => _words;

  void toggleFavorite(String word){
    final isExist = _words.contains(word);

    if(isExist){
      _words.remove(word);
    }else{
      _words.add(word);
    }
    notifyListeners();
  }

  void clearFavorite(){
    _words = [];
    notifyListeners();
  }
}