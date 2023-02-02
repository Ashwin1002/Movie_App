class ConstantAPIText {
  static Map<String, dynamic> errorMap = {
    "StatusCode": 0123456789,
    "Message": "Something goes wrong."
  };
  static Map<String, dynamic> errorNetworkMap = {
    "StatusCode": 9876543210,
    "Message": "No Internet Connection."
  };

  static String baseUrl = "https://api.themoviedb.org/";

  static String apiKey = "74fbe90a6dfa92f2a361d379d8810f70";

  static String imageUrl = "https://image.tmdb.org/t/p/w500";
}