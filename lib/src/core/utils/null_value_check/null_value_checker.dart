class NullValueChecker {
  static NullValueChecker? _instance;

  NullValueChecker._internal();

  factory NullValueChecker() {
    _instance ??= NullValueChecker._internal();
    return _instance!;
  }
  
  T removeNullValues<T>(T collection) {
    if (collection is List) {
      return collection.where((element) => element != null && element != '').toList() as T;
    } else if (collection is Map) {
      Map<String, dynamic> cleanedMap = {};
      collection.forEach((key, value) {
        if (value != null && value != '') {
          cleanedMap[key] = value;
        }
      });
      return cleanedMap as T;
    } else if (collection is Set) {
      return collection.where((element) => element != null && element != '').toSet() as T;
    } else {
      throw ArgumentError('Unsupported collection type');
    }
  }
}
