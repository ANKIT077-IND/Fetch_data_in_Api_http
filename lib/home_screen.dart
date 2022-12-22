import 'dart:convert';

import 'package:fetch_data_api/postListmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<PostListmodel> allPostList=[];
  Future getPostList() async {

    http.Response response;
    response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode==200){
      var data=json.decode(response.body);
      List<dynamic> data1=data;
      print("response:"+data.toString());
       setState(() {
         allPostList=data1.map((e) => PostListmodel.fromJson(e)).toList();
       });
    }
    else{
      Fluttertoast.showToast(msg: "Data not found..");
    }
  }


  @override
  void initState() {
    getPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
          appBar: AppBar(
            title: Text("Fetch data"),
            elevation: 1,
          ),
        body: SingleChildScrollView(
          child: ListView.builder(
              itemCount: allPostList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
               return Column(
                 children: [
                   Card(
                     elevation: 1,
                     margin: EdgeInsets.all(10),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Text("userId".toUpperCase(),
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),

                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(allPostList[index].userId.toString()),
                               ),
                             ],

                           ),
                           const SizedBox(
                             height: 05,
                           ),
                           Row(
                             children: [
                               Text("id".toUpperCase(),
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Text(allPostList[index].id.toString()),
                               ),
                             ],

                           ),
                           const SizedBox(
                             height: 05,
                           ),
                           Row(
                             children: [
                               Text("title ".toUpperCase(),
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               Expanded(child: Text(allPostList[index].title.toString())),
                             ],

                           ),
                           const SizedBox(
                             height: 05,
                           ),
                           Row(
                             children: [
                               Text("body ".toUpperCase(),
                                 style: TextStyle(
                                     fontSize: 15,
                                     color: Colors.black,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                              Expanded(child: Text(allPostList[index].body.toString())),
                             ],
                           ),

                         ],

                       ),
                     ),

                   ),


                 ],
               );




          }),



        ),
    );
  }
}
