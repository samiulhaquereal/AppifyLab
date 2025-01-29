class LCTypeParse {

  static LCTypeParse? _instance;
  LCTypeParse._internal();
  factory LCTypeParse(){
    _instance ??= LCTypeParse._internal();
    return _instance!;
  }

  Map<String, dynamic>? findLCTypeData({
    required String value,
    required List<Map<String, dynamic>> lcType,
  }) {
    if (value.isEmpty || lcType.isEmpty || !lcType.first.containsKey('data')) {
      return null;
    }
    List<Map<String, dynamic>> lcList = List<Map<String, dynamic>>.from(lcType.first['data']);
    List<String> parts = value.split(" - ");
    String code = '';
    String name = '';
    if (parts.isNotEmpty) {
      code = removeParentheses(parts[0]);
      name = value.replaceAll('${parts[0]} - ', '');
    } else {
      name = value;
    }
    for (var item in lcList) {
      if (parts.isNotEmpty && item['code'] == code && item['name'] == name) {
        return item;
      }
      else if (parts.isNotEmpty && item['name'] == name) {
        return item;
      }
    }
    return null;
  }


  String removeParentheses(String code) {
    return code.replaceAll('(', '').replaceAll(')', '');
  }

}