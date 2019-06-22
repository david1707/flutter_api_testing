import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsAPI = NewsAPIProvider();
    newsAPI.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsAPI.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('FetchItem returns an item model', () async {
    final newsAPI = NewsAPIProvider();
    newsAPI.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsAPI.fetchItem(999);
    expect(item.id, 123);
  });
}