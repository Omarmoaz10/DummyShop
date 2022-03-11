import 'package:dummy_shop/model/product_models.dart';
import 'package:dummy_shop/utils/my_string.dart';
import 'package:http/http.dart' as http;


class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}