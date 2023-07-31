import 'dart:convert';
import 'package:covid_tracker/models/WorldStatesModel.dart';
import 'package:covid_tracker/services/utillities/app_url.dart';
import 'package:http/http.dart' as http;
class WorldStates{
  Future<WorldStatesModel> fetchDataWorldStates() async{
    final http.Response response = await http.get(Uri.parse(AppUrls.worldStatesURL));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return WorldStatesModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }
}