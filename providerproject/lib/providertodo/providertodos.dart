import 'package:flutter/material.dart';

class Todoes extends ChangeNotifier{

  List<dynamic> todolist=[];

  void adddata(data){
    todolist.add(data);
    notifyListeners();
    print(data);
  }

  void delete(data){
    // int d = int.parse(data);
    todolist.removeAt(data);
    notifyListeners();
  }

  void editdata(indexx,data){
    todolist[indexx]=data;
    notifyListeners();
    print(data);
  }


}                               