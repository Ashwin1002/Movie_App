import 'dart:convert';
import 'dart:developer';

import 'package:movie_app/src/constant/api_constant.dart';
import 'package:movie_app/src/screen/index/index_model.dart';

import '../../services/network/api_provider.dart';


class IndexMovieAPI {
  static getLatestMovieList({required String page}) async {
    var jsonData = await APIProvider.getAPI(
      endPoint: "3/movie/popular?api_key=${ConstantAPIText.apiKey}&language=en-US&page=$page",
    );
    log("RESPONSE  =>  $jsonData ");
    return MovieModel.fromJson(jsonData);
  }
}
