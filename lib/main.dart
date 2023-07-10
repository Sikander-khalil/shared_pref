import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var nameController = TextEditingController();
String? nameValue;
@override
  void initState() {

    super.initState();
    getValue();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(



        title: Text("Shared Pref"),
      ),
      body: Container(

child: Center(
  child:   SizedBox(

    width: 200,

    child:   Column(



      mainAxisAlignment: MainAxisAlignment.center,







      children: [



        TextField(
          controller: nameController,
          decoration: InputDecoration(
            label: Text("Name"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21)
            )
          ),
        ),



        SizedBox(height: 11,),



        ElevatedButton(onPressed: () async {

          var name = nameController.text.toString();

          var prefs = await SharedPreferences.getInstance();
          
          prefs.setString("name", name);


        }, child: Text("Save")),



        SizedBox(height: 11,),



        Text(nameValue?.toString() ?? 'No Value Saved')








      ],



    ),

  ),
)
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

void getValue() async {
  var prefs = await SharedPreferences.getInstance();
  var getName = prefs.getString("name");
  nameValue = getName ?? "No Value Saved";
  setState(() {});
}

}
