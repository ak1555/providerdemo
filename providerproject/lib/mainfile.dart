import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/providertodo/providertodos.dart';

class MainFile extends StatefulWidget {
  const MainFile({super.key});

  @override
  State<MainFile> createState() => _MainFileState();
}

class _MainFileState extends State<MainFile> {
  TextEditingController c1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Todoes>(builder: (context, value, child) => Scaffold(
      body: Container(
       height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Container(
                // height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Add Elements", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          )),),
              Container(
                height: 100,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: c1,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                    TextButton(onPressed: () {
                      var data=c1.text;
                      if(c1.text!=""){
                        value.adddata(data);
                        c1.clear();
                      }else{
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("OOPS"),
                          );
                        },);
                      }
                    }, child: Text("ADD"))
                  ],
                ),
              ),
              SizedBox(height: 25,),
              Expanded(child: 
              ListView.builder(
                itemCount: value.todolist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(value.todolist[index].toString()),
                  );
                
              },))
            ],
          ),
        ),

      ),
      bottomNavigationBar: BottomAppBar(
       padding: EdgeInsets.all(5),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Move To Next Page  ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, "showpage");
          }, icon:Icon(Icons.arrow_forward_outlined))
          ],),),
    ),
    );
  }
}