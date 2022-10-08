import 'package:flutter_template/core/resources/data_state.dart';

abstract class Repository {
  Future<DataState<Map<String, String>>> template();
}
