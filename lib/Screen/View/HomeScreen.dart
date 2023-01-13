import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/DataBase/Database.dart';
import 'package:untitled/Screen/Controller/HomeController.dart';
import 'package:untitled/Screen/Model/ModelClass.dart';
import 'package:untitled/Screen/Model/Modeldata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  List<Articles>? finaldata = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Exam App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Modelclass m1 = Modelclass();

                  Expanded(
                    child: FutureBuilder<Modeldata>(
                        future: controller.ApiCall(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else if (snapshot.hasData) {
                            Modeldata m1 = snapshot.data!;
                            finaldata = m1.articles;
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                  );
                },
                child: Text("Api Call")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  DbHelper db = DbHelper();
                  for (int i = 0; i <= finaldata!.length; i++) {
                    db.insertData(finaldata![i].title!, finaldata![i].author!,
                        finaldata![i].description!);
                  }
                },
                child: Text("Add Data")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("SQL Page")),
          ],
        ),
      ),
    ));
  }
}
