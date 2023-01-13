import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/Modeldata.dart';

class HomeController extends GetxController {

  RxList lastdata = <Map>[].obs;

  String ApiLink =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-12-13&sortBy=publishedAt&apiKey=d230b961382c473f9f014486aabbcd71";

  Future<Modeldata> ApiCall() async {
    var jsonstring = await http.get(Uri.parse(ApiLink));
    var json = jsonDecode(jsonstring.body);

    return Modeldata.fromJson(json);
  }
}
