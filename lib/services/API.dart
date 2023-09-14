import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:core';

Future GetData(url) async {
  Client client = Client();
  print(url);
  final response = await client.get(url);
  if (response.statusCode == 200) {
    String jsonsDataString = response.body.toString();
    var _data = jsonDecode(jsonsDataString);
    return _data;
  } else {
    print(response.statusCode);
  }
}
