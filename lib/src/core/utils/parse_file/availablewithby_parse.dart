class AvailableWithByParse{

  static AvailableWithByParse? _instance;
  AvailableWithByParse._internal();
  factory AvailableWithByParse(){
    _instance ??= AvailableWithByParse._internal();
    return _instance!;
  }

  String getTextAfterLineBreak(String inputText) {
    List<String> splitText = inputText.split('\n');
    if (splitText.length > 1) {
      return splitText[1].trim();
    } else {
      return '';
    }
  }
}