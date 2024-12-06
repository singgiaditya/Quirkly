import 'package:quirckly/app/core/constant/api.dart';
import 'package:http/http.dart' as http;
import 'package:quirckly/app/features/Profile/data/models/response/get_all_team_response.dart';

class TeamRemoteDataSource {
  final http.Client client;
  TeamRemoteDataSource(this.client);

  // Future<CreateCompanyResponseModel> createCompany(
  //     CreateCompanyRequestModel request, String token) async {
  //   try {
  //     var headers = {
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     };

  //     var uri = Uri.parse(companyUrl);
  //     final response = await http.post(
  //       uri,
  //       body: request.toRawJson(),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 201) {
  //       CreateCompanyResponseModel createCompanyResponseModel =
  //           CreateCompanyResponseModel.fromRawJson(response.body);
  //       return createCompanyResponseModel;
  //     }

  //     if (response.statusCode == 400) {
  //       throw Exception("400");
  //     }
  //     throw Exception("500");
  //   } catch (e) {
  //     throw Exception("000");
  //   }
  // }

  Future<GetAllTeamResponseModel> getAllTeam(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var uri = Uri.parse(teamUrl);
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        GetAllTeamResponseModel getAllTeamResponseModel =
            GetAllTeamResponseModel.fromRawJson(response.body);
        return getAllTeamResponseModel;
      }

      throw Exception("500");
    } catch (e) {
      throw Exception("${e.toString()}");
    }
  }
}
