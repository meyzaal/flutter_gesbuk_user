import 'package:path/path.dart';

String mimeType(String filePath) {
  var ext = extension(filePath);

  switch (ext) {
    case '.jpg':
      return 'image/jpg';
    case '.jpeg':
      return 'image/jpeg';
    case '.png':
      return 'image/png';
    default:
      throw Exception('Error get mime type');
  }
}
