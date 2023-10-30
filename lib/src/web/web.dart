import 'dart:async';
import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';

Future<bool> open(String? uri, {Uint8List? data}) async {
  var fileName = DateTime.now().millisecondsSinceEpoch.toString();
  if (uri?.isNotEmpty == true) {
    fileName = uri!.split("/").last;
  }
  if (data == null || data.isEmpty) {
    final fileInput = FileUploadInputElement()
      ..dir = uri
      ..accept = _getMimeType(uri).mimeType;
    fileInput.onChange.listen((event) {
      final files = fileInput.files!;
      if (files.isNotEmpty) {
        final reader = FileReader();
        reader.readAsArrayBuffer(files.first);
        reader.onLoad.listen((event) {
          downloadFile(reader.result as Uint8List, fileName);
        });
      }
    });
    fileInput.click();
  } else {
    downloadFile(data, fileName);
  }

  return true;
}

Future show(String data) async {
  final image = ImageElement();
  image.src = data;
}

void downloadFile(Uint8List data, String fileName) {
  final anchor = AnchorElement(
    href: Url.createObjectUrlFromBlob(Blob([data])),
  );

  anchor.download = fileName;

  anchor.click();
}

ContentType _getMimeType(String? path1) {
  final path = path1?.toLowerCase() ?? "";
  if (path.endsWith('.html')) {
    return ContentType.html;
  } else if (path.endsWith('.js')) {
    return ContentType.parse('application/javascript');
  } else if (path.endsWith('.css')) {
    return ContentType.parse('text/css');
  } else if (path.endsWith('.png')) {
    return ContentType.parse('image/png');
  } else if (path.endsWith('.jpg') || path.endsWith('.jpeg')) {
    return ContentType.parse('image/jpeg');
  } else {
    return ContentType.binary;
  }
}
