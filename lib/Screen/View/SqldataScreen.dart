import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/Screen/Controller/HomeController.dart';

class SqldataScreen extends StatefulWidget {
  const SqldataScreen({Key? key}) : super(key: key);

  @override
  State<SqldataScreen> createState() => _SqldataScreenState();
}

class _SqldataScreenState extends State<SqldataScreen> {

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("SQl Table Screen"),
      ),
      body: Column(
        children: [
          ListView.builder(itemCount: controller.lastdata.length,itemBuilder: (context,index){
            return ListTile(
              // title: Text("${controller.lastdata.}"),
            );
          })
        ],
      ),
    ));
  }
}
