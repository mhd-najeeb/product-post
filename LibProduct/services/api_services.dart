import 'dart:convert';
import 'package:http/http.dart ' as http;

class ApiServices {
  int timeOut = 15;
  ApiServices();
  final String apiProducts = "https://fakestoreapi.com/products";
  Future<dynamic> getProducts() async {
    return await get(apiProducts);
  }

  Future<dynamic> get(String api) async {
    try {
      var response = await http
          .get(
            Uri.parse(api),
          )
          .timeout(Duration(seconds: timeOut));

      // التأكد من أن السيرفر رد بنجاح (الكود 200)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // هنا يتم استخدام jsonDecode لفك التشفير
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e.toString());
      return "";
    }
  }
}
