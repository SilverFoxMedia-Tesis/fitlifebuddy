enum LanguageCode { spanish }

extension Ext on LanguageCode {
  String get code {
    return [
      'es_PE',
    ][index];
  }
}