import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetArtPieceCall {
  static Future<ApiCallResponse> call({
    String objectID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Art Piece',
      apiUrl:
          'https://collectionapi.metmuseum.org/public/collection/v1/objects/${objectID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class GetDepartmentsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Departments',
      apiUrl:
          'https://collectionapi.metmuseum.org/public/collection/v1/departments',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class SearchArtCall {
  static Future<ApiCallResponse> call({
    String q = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Art',
      apiUrl: 'https://collectionapi.metmuseum.org/public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnBody: true,
    );
  }
}

class DepartmentHighlightsCall {
  static Future<ApiCallResponse> call({
    int departmentId,
    bool isHighlight = true,
    String q = '*',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Department Highlights',
      apiUrl: 'https://collectionapi.metmuseum.org/public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'departmentId': departmentId,
        'isHighlight': isHighlight,
        'q': q,
      },
      returnBody: true,
    );
  }
}
