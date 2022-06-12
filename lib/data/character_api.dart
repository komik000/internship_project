import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters1() {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  }
  static Future getCharacters2() {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
  }
  static Future getCharacters3() {
    return http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  }
}
