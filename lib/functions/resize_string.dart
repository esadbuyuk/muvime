String getFirstWords(String text, int wordCount) {
  List<String> words = text.split(' ');
  if (words.length > wordCount) {
    return words.take(wordCount).join(' ');
  } else {
    return text;
  }
}
