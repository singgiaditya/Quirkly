import 'package:quirckly/app/core/constant/api.dart';
import 'package:http/http.dart' as http;
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/create_company_response_model.dart';
import 'package:quirckly/app/features/Profile/data/models/response/get_all_company_response_model.dart';

class CompanyRemoteDataSource {
  final http.Client client;
  CompanyRemoteDataSource(this.client);

  Future<CreateCompanyResponseModel> createCompany(
      CreateCompanyRequestModel request, String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      };

      var uri = Uri.parse(companyUrl);

      final post = http.MultipartRequest(
        "POST",
        uri,
      );

      post.fields
          .addAll({"name": request.name!, "description": request.description!});
      if (request.image != null) {
        post.files.add(
            await http.MultipartFile.fromPath("image", request.image!.path));
      }

      post.headers.addAll(headers);
      var response = await post.send();
      var result = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        CreateCompanyResponseModel createCompanyResponseModel =
            CreateCompanyResponseModel.fromRawJson(result);
        return createCompanyResponseModel;
      }
      if (response.statusCode == 400) {
        throw Exception("400");
      }
      throw Exception("500");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GetAllCompanyResponseModel> getAllCompany(String token) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var uri = Uri.parse(companyUrl);
      final response = await http.get(
        uri,
        headers: headers,
      );

      

      if (response.statusCode == 200) {
        GetAllCompanyResponseModel getAllCompanyResponseModel =
            GetAllCompanyResponseModel.fromRawJson(response.body);
        return getAllCompanyResponseModel;
      }

      throw Exception("500");
    } catch (e) {
      throw Exception("${e.toString()}");
    }
  }
}
