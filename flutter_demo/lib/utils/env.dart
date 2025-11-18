


import 'package:flutter_dotenv/flutter_dotenv.dart';

final envType = dotenv.env['ENV'] as String;
final apiBaseUrl = dotenv.env['API_BASE_URL'] as String;
final mockEnabled = dotenv.env['MOCK_ENABLED'] as String;