import 'package:news_api/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

void main() {
  test("Make sure that FetchTopIds actually returns a list of ids", () async {
    final newsApi = NewsApiProvider();
    
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4, 5, 6]), 200);  
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4, 5, 6]);

  });

  test("Make sure FetchItem function returns an item model", () async {
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      final Map<String, dynamic> jsonMap = {"id" : 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(999);

    expect(item.id, 123);  
  });

}

