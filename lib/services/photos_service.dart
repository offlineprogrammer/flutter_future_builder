import 'dart:convert';
import 'package:flutter_future_builder/models/photo_item.dart';
import 'package:http/http.dart';

class PhotoService {
  String endpoint = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<PhotoItem>> getPhotos() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => PhotoItem.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
