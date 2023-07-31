import 'dart:convert';
import 'package:covid_tracker/services/utillities/app_url.dart';
import 'package:http/http.dart' as http;
class CountryList{
  Future<List<dynamic>> fetchCountryList() async{
    final http.Response response = await http.get(Uri.parse(AppUrls.countriesListURL));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return data;
    }else{
      throw Exception('Error showing list');
    }
  }
}