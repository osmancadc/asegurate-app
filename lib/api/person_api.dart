import 'package:app_asegurate/data/authentication_client.dart';
import 'package:app_asegurate/helpers/http.dart';
import 'package:app_asegurate/helpers/http_response.dart';
import 'package:app_asegurate/models/person_score.dart';
import 'package:app_asegurate/models/score.dart';
import 'package:get_it/get_it.dart';

class PersonApi {
  final Http _http;

  PersonApi(this._http);
  Future<HttpResponse<PersonScore>> searchPerson(String identification, String identificationType) {
    return _http.request<PersonScore>(
      '/get-score',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: {
        "value": identification,
        "type": identificationType,
      },
      parser: (data) => PersonScore.fromJson(data),
    );
  }

  Future<HttpResponse<String>> getPersonName(String type, String value) {
    return _http.request<String>(
      '/user/$type/$value',
      method: 'GET',
      parser: (data) => data['name'],
    );
  }

  Future<HttpResponse> uploadScore(Score score) async {
    final _authenticationClient = GetIt.instance<AuthenticationClient>();
    final data = await _authenticationClient.getUserId();

    if (data.isNotEmpty) {
      score.author = data;
    }

    return _http.request(
      '/upload-score',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      data: score.toJson(),
      parser: (data) => data,
    );
  }
}
