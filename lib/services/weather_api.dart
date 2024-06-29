import 'package:http/http.dart';
import 'package:http/http.dart' as http;


// 567a1dc4f6e243c78b9140923242606
class ApiServices{
  static final ApiServices apiServices = ApiServices._singleton();
  ApiServices._singleton();

  Future<String?> apiCalling(String location) async {
    String apiData = 'https://api.weatherapi.com/v1/forecast.json?key=567a1dc4f6e243c78b9140923242606&q=$location';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if(response.statusCode == 200){
      print("Api called successfully");
      return response.body;
    }
    else{
      return null;
    }
  }
}
