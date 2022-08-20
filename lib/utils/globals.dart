library globals;

import 'package:http/http.dart' as http;

bool areWeInIntegrationTest = false;

http.Client httpClient = http.Client();
