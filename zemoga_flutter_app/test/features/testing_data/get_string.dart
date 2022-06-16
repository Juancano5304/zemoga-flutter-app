import 'dart:io';

String getString(String fileName) =>
    File('test/features/testing_data/$fileName').readAsStringSync();
