import 'dart:convert';


import 'package:http/http.dart';

import '../../model class/movie  model.dart';
import '../api client.dart';



class MovieApi {
  ApiClient apiClient = ApiClient();


  Future<Moviemodel> getMOVIE() async {
    String trendingpath = 'https://movies-api14.p.rapidapi.com/movies';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Moviemodel.fromJson(jsonDecode(response.body));
  }
}