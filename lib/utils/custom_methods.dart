String removeAccents(String string) {
  String updatedString = string;
  const accentsRegex = r'[´\`\¨\^\\]';
  const accentsReplace = '';
  updatedString =
      updatedString.replaceAll(RegExp(accentsRegex), accentsReplace);

  const vowelAccentsRegex = r'[àáâãäå]';
  updatedString = updatedString.replaceAll(
      RegExp(vowelAccentsRegex, caseSensitive: false), 'a');

  const vowelAccentsRegex2 = r'[èéêë]';
  updatedString = updatedString.replaceAll(
      RegExp(vowelAccentsRegex2, caseSensitive: false), 'e');

  const vowelAccentsRegex3 = r'[ìíîï]';
  updatedString = updatedString.replaceAll(
      RegExp(vowelAccentsRegex3, caseSensitive: false), 'i');

  const vowelAccentsRegex4 = r'[òóôõö]';
  updatedString = updatedString.replaceAll(
      RegExp(vowelAccentsRegex4, caseSensitive: false), 'o');

  const vowelAccentsRegex5 = r'[ùúûü]';
  updatedString = updatedString.replaceAll(
      RegExp(vowelAccentsRegex5, caseSensitive: false), 'u');

  return updatedString;
}
