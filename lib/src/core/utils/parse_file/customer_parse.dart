class CustomerNameParse{

  static CustomerNameParse? _instance;
  CustomerNameParse._internal();
  factory CustomerNameParse(){
    _instance ??= CustomerNameParse._internal();
    return _instance!;
  }


  Map<String, dynamic>? findCustomerByName({
    required String name,
    required List<Map<String, dynamic>> groupCustomer,
  }) {
    if (name.isEmpty || groupCustomer.isEmpty || !groupCustomer.first.containsKey('data')) {
      return null;
    }
    List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(groupCustomer.first['data']);
    for (var item in items) {
      if (item['name'] == name) {
        return item;
      }
    }
    return null;
  }
}