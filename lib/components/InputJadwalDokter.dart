import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/reuse.dart';

class InputJadwalDokter extends StatefulWidget {
  const InputJadwalDokter({Key? key}) : super(key: key);

  @override
  State<InputJadwalDokter> createState() => Input_JadwalDokterState();
}

class Input_JadwalDokterState extends State<InputJadwalDokter> {
  final _formKey = GlobalKey<FormState>();

  //controller
  final _nameController = new TextEditingController();
  final _spesialisController = new TextEditingController();
  final _tglKerja = new TextEditingController();
  final _jamKerja = new TextEditingController();
  final _kontak = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final submitBtn = Material(
      elevation: 5,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        minWidth: 100,
        height: 40,
        color: darkerColor,
        onPressed: () {},
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

    final cancleBtn = Material(
      elevation: 5,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        minWidth: 100,
        height: 40,
        color: Colors.red[500],
        onPressed: () {},
        child: Text(
          "Cancel",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Input Jadwal Dokter",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 59, 8),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Silahkan Input Jadwal Dokter Dibawah Ini",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 59, 8),
                      ),
                    ),
                    SizedBox(height: 20),
                    formTextField("Nama", _nameController),
                    SizedBox(height: 20),
                    formTextField("Spesialis", _spesialisController),
                    SizedBox(height: 20),
                    formTextField("Tanggal Kerja", _tglKerja),
                    SizedBox(height: 20),
                    formTextField("Jam Kerja", _jamKerja),
                    SizedBox(height: 20),
                    formTextField("Kontak", _kontak),
                    SizedBox(height: 30),
                    submitBtn,
                    SizedBox(height: 20),
                    cancleBtn,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
