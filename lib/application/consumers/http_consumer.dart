import 'package:rickandmorty/core/abstracts/consumer.dart';
import 'package:rickandmorty/core/abstracts/dto.dart';
import "package:http/http.dart" as http;

class HttpConsumer extends Consumer<http.Response> {
  late http.Client client;

  @override
  Future<http.Response?> get({required String url}) async {
    try {
      final Uri uri = Uri.parse(url);
      return await client.get(uri);
    } catch (e) {
      print("$e : $url");
      return null;
    }
  }

  @override
  Future<http.Response?> post({required String url, required DTO body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {
    client = http.Client();
  }
}
