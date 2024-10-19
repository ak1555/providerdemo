import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/mainfile.dart';
import 'package:providerproject/providertodo/providertodos.dart';
import 'package:providerproject/showpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Todoes(),
    child: MaterialApp(
      home:MainFile() ,
      routes: {
        "showpage":(context)=>Showpage()
      },
    ),)

  );
}
