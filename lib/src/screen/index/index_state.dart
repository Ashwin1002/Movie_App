import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/src/screen/index/index_api.dart';
import 'index_model.dart';

enum LoadingState { initial, loading, success, error }

class IndexState with ChangeNotifier {
  IndexState();

  LoadingState _loadingState = LoadingState.initial;

  LoadingState get loadingState => _loadingState;

  late BuildContext _context;

  BuildContext get context => _context;

  set getContext(BuildContext value) {
    _context = value;
    init();
  }

  init() async {
    _movieList = [];
    await getMovieListFromAPI();
    await getOldMovieListFromAPI();
  }

  late String _errorText = "";

  String get errorText => _errorText;

  set getErrorText(String value) {
    _errorText = value;
    notifyListeners();
  }

  late List<MovieDataModel> _movieList = [], _oldMovieList = [];

  List<MovieDataModel> get movieList => _movieList;

  List<MovieDataModel> get oldMovieList => _oldMovieList;

  set getMovieList(List<MovieDataModel> value) {
    _movieList = value;
    log("movie list => $_movieList");
    notifyListeners();
  }

  set getOldMovieList(List<MovieDataModel> value) {
    _oldMovieList = value;
    log("movie list => $_oldMovieList");
    notifyListeners();
  }

  Future getMovieListFromAPI() async {
    _loadingState = LoadingState.loading;

    MovieModel movieModel = await IndexMovieAPI.getLatestMovieList(page: "1");
    _loadingState = LoadingState.success;
    getMovieList = movieModel.results;

    if (movieModel.results.isEmpty) {
      _loadingState = LoadingState.error;
      getMovieList = [];
      getErrorText = "No Data Found";
    }
    notifyListeners();
  }

  Future getOldMovieListFromAPI() async {
    _loadingState = LoadingState.loading;

    MovieModel movieModel = await IndexMovieAPI.getLatestMovieList(page: "3");
    _loadingState = LoadingState.success;
    getOldMovieList = movieModel.results;

    if (movieModel.results.isEmpty) {
      _loadingState = LoadingState.error;
      getOldMovieList = [];
      getErrorText = "No Data Found";
    }
    notifyListeners();
  }
}
