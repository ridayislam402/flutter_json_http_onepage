import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_http_demo/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var item;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async{
  var url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response=await http.get(url);
  var json=response.body;
  item=itemFromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:item!=null? ListView.builder(
        itemCount: item?.length,
        itemBuilder: (context, index) {
        return Text(item![index].title);
      },
      ):Center(child: CircularProgressIndicator())
    );
  }
}

