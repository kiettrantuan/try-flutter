import 'dart:convert';

import 'package:f_shop_1/models/banner.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://picsum.photos';

  Future<List<BannerItem>> fetchBanners() async {
    final response =
        await http.get(Uri.parse('$baseUrl/v2/list?page=3&limit=5'));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => BannerItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
