import 'package:http/http.dart';

import 'RequestTypeNotFoundException.dart';


class NetworkClient {
  //Base url
  static const String _baseUrl =
      "https://api.github.com/users/JakeWharton/repos?";
  final Client _client;

  NetworkClient(this._client);

  Future<Response> request({
    required RequestType requestType,
    required String path,
  }) async {
    switch (requestType) {
      case RequestType.GET:
        final response = await _client
            .get(Uri.parse("$_baseUrl$path"), headers: <String, String>{
          "content-type": "application/json",
          "accept": "application/json",
        });
        return response;
      case RequestType.POST:
        final response = await _client.post(
          Uri.parse("$_baseUrl$path"),
          headers: <String, String>{
            "content-type": "application/json",
          },
        );
        return response;
      case RequestType.DELETE:
        return _client.delete(
          Uri.parse("$_baseUrl/$path"),
        );

      // case RequestType.PUT:
      //   final response = await _client.put(Uri.parse("$_baseUrl/$path"),
      //       headers: {
      //         "Content-Type": "application/json",
      //         HttpHeaders.authorizationHeader: 'Bearer ' + token,
      //       },
      //       body: json.encode(parameter));
      //   return response;
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }
}

enum RequestType { GET, POST, DELETE, PUT }

class Nothing {
  Nothing._();
}
