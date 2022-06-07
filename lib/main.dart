import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/InputJadwalDokter.dart';
import 'package:frontdesk_kliniku/components/JadwalDokter.dart';
import 'package:frontdesk_kliniku/components/ListPasien.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frontdesk KLINIKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
      ),
      home: const ListPasien(),
    );
  }
}
