import 'package:http/http.dart';

import '../model/github_users.dart';

class ApiClient {
  static Future<GitHubUsers> getUsers(String query) async {
    Uri uri = Uri.https(
      'api.github.com',
      '/search/users',
      <String, dynamic>{
        'q': query,
      },
    );
    Response response = await get(uri);
    return gitHubUsersFromJson(response.body);
  }
}
