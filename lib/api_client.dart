import 'package:flutter_search_api/model.dart';
import 'package:http/http.dart';

class ApiClient {
  static Future<GitHubUsers> getUsers(String users) async {
    String query = 'q=$users';
    Response response = await get('https://api.github.com/search/users?$query');
    return gitHubUsersFromJson(response.body);
  }
}
