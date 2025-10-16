import 'package:gameof_throne/entities/person.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonServices {
  final String baseUrl = 'https://thronesapi.com/api/v2';

  Future<List<Person>> getAllPersons() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Person.fromJson(json)).toList();
      } else {
        throw Exception('Error!');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
