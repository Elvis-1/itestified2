String addReadMoreToText(String inputText, [int maxTextLength = 150]) {
  print('This is the length of text');
  print(inputText.length);
  String text = //inputText.length < 300
      inputText.substring(0,
          inputText.length > maxTextLength ? maxTextLength : inputText.length);
  //: inputText.substring(0, inputText.length - 200);

  return text;
}
