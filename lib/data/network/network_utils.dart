import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zcart/helper/constants.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'api.dart';
const noInternetMsg = 'You are not connected to Internet';
const errorMsg = 'Please try again later.';

/// Variables
var accessAllowed = false;

bool isSuccessful(int code) {
  return code >= 200 && code <= 206;
}

Future<Response> getRequest(String? endPoint,
    {bool bearerToken = false, bool noBaseUrl = false}) async {
  if (await isNetworkAvailable()) {
    var headers;
    Response response;
    var accessToken = await getStringAsync(ACCESS);

    if (bearerToken) {
      headers = {
        HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
        "Authorization": "Bearer $accessToken"
      };
    }

    if (!noBaseUrl)
      print('URL: ${API.base}$endPoint');
    else
      print('URL: $endPoint');
    //print('Header: $headers');

    if (bearerToken) {
      response = await get(Uri.parse('${API.base}$endPoint'), headers: headers);
    } else if (noBaseUrl) {
      response = await get(Uri.parse('$endPoint'));
    } else {
      response = await get(Uri.parse('${API.base}$endPoint'));
    }

    //print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

postRequest(String endPoint, Map? requestBody,
    {bool bearerToken = false, bool noBaseUrl = false}) async {
  if (await isNetworkAvailable()) {
    Response? response;
    if (!noBaseUrl)
      print('URL: ${API.base}$endPoint');
    else
      print('URL: $endPoint');
    print('body: $requestBody');

    var accessToken = await getStringAsync(ACCESS);

    var headers = {
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };

    if (bearerToken) {
      var header = {"Authorization": "Bearer $accessToken"};
      headers.addAll(header);
    }

    print("Headers: $headers");
    try {
      if (!noBaseUrl) {
        response = await post(Uri.parse('${API.base}' + '$endPoint'),
            body: requestBody, headers: headers);
      } else {
        response = await post(Uri.parse('$endPoint'),
            body: requestBody, headers: headers);
      }
    } catch (e) {
      print(e.toString());
    }
    //print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

putRequest(String endPoint, Map request, {bool bearerToken = true}) async {
  if (await isNetworkAvailable()) {
    late Response response;
    print('URL: ${API.base}$endPoint');
    print('Request: $request');

    var accessToken = await getStringAsync(ACCESS);

    var headers = {
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };

    if (bearerToken) {
      var header = {"Authorization": "Bearer $accessToken"};
      headers.addAll(header);
    }

    print("Headers: $headers");
    try {
      response = await put(Uri.parse('${API.base}' + '$endPoint'),
          body: request, headers: headers);
    } catch (e) {
      print(e.toString());
    }
    print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

//TODO: Multipart Request need to be solved

multiPartRequest(String endPoint, Map body,
    {File? file, String? filename, bool bearerToken = true}) async {
  if (await isNetworkAvailable()) {
    ///MultiPart request
    var request = MultipartRequest(
      'PUT',
      Uri.parse('${API.base}' + '$endPoint'),
    );

    var accessToken = await getStringAsync(ACCESS);

    var headers = {
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };

    if (bearerToken) {
      var header = {
        "Authorization": "Bearer $accessToken",
        "Content-type": "application/json",
      };

      headers.addAll(header);
    }

    if (file != null && filename != null) {
      request.files.add(
        MultipartFile(
          'profile_image',
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: filename,
          contentType: MediaType('image', 'jpeg'),
        ),
      );
    }

    request.headers.addAll(headers);
    request.fields.addAll(body as Map<String, String>);

    print('Request: $request');
    StreamedResponse streamedResponse = await request.send();
    Response response = await Response.fromStream(streamedResponse);
    print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

patchRequest(String endPoint, Map request,
    {bool requireToken = false,
    bool bearerToken = false,
    bool isDigitToken = false}) {}

deleteRequest(String endPoint, {bool bearerToken = true}) async {
  if (await isNetworkAvailable()) {
    var accessToken = await getStringAsync(ACCESS);
    print('URL: ${API.base}$endPoint');

    var headers = {
      HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    };

    if (bearerToken) {
      var header = {"Authorization": "Bearer $accessToken"};
      headers.addAll(header);
    }

    print(headers);
    Response response =
        await delete(Uri.parse('${API.base}' + '$endPoint'), headers: headers);
    print('Response: ${response.statusCode} ${response.body}');
    return response;
  } else {
    throw noInternetMsg;
  }
}

Future handleResponse(Response response, {bool showToast = true}) async {
  if (!await isNetworkAvailable()) {
    throw noInternetMsg;
  }
  if (isSuccessful(response.statusCode)) {
    if (response.body.isNotEmpty) {
      print(response.statusCode);
      print(response.body);
      return jsonDecode(response.body);
    } else {
      return response.body;
    }
  } else {
    if (response.body.isJson()) {
      print("handleResponse (json): ${jsonDecode(response.body)}");
      if (jsonDecode(response.body)['errors'] != null) {
        toast(
          jsonDecode(response.body)['errors']
              [jsonDecode(response.body)['errors'].keys.first][0],
          bgColor: kPrimaryColor,
          textColor: kLightColor,
          gravity: ToastGravity.CENTER,
        );
      } else if (showToast) {
        toast(
          jsonDecode(response.body)['message'] ??
              jsonDecode(response.body)['error'],
          bgColor: kPrimaryColor,
          textColor: kLightColor,
          gravity: ToastGravity.CENTER,
        );
      }

      if (response.statusCode == 401) {
        await getSharedPref().then((value) => value.clear());
      }

      return response.statusCode;
    } else {
      try {
        print("handleResponse: ${jsonDecode(response.body)}");
      } catch (e) {
        print(response.body);
        return 500;
      }
      return response.statusCode;
    }
  }
}
