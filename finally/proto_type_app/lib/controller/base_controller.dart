import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseController {
  Future httpRequestCaller(Map<String, dynamic> reqData) async {
    Map<String, dynamic> jsonBody = reqData['response_data='];

    String result;

    result = await httpRequest(jsonBody);

    return result;
  }

  Future httpRequest(Map<String, dynamic> body) async {
    final url = 'https://test-m.seniortalktalk.com/popups/process';
    String jsonBody = json.encode(body);
    // String cookieValue =
    //     'ring_id=${body['ring_id']}; ring_sess=${body['ring_sess']}';
    // if (resp is LoginModel) {
    //   cookieValue = '';
    // }

    try {
      final response = await http.post(Uri.parse(url),
          headers: {
            //   'Cookie': cookieValue,
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          },
          body: 'req_data=' + jsonBody);

      //obtaining response_data
      var result = response.body.substring(
          response.body.indexOf('response_data=') + 'response_data='.length);

      return result;
    } catch (err) {
      throw err;
    }
  }
}
