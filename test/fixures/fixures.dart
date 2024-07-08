import 'dart:io';

String fixture(String filePath) =>
    File('./test/fixures/$filePath').readAsStringSync();
