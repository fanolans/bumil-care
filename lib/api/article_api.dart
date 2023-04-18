import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ArticleApi {
  Future<List<Articles>> getAllArticle() async {
    final uri = Uri.parse(
      'https://bumil-care-default-rtdb.asia-southeast1.firebasedatabase.app/articles.json',
    );
    List<Articles> articles = [];
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;
        print(response.statusCode);

        result.forEach(
          (key, value) {
            articles.add(
              Articles(
                id: key,
                title: value['title'],
                article: value['article'],
              ),
            );
          },
        );
      } else {
        throw Exception();
      }
    } on SocketException {
      throw const SocketException('Tidak dapat terhubung ke internet');
    } catch (e) {
      throw Exception('Eror, terjadi kesalahan');
    }
    return articles;
  }
}
