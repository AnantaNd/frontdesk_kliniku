import 'package:flutter/material.dart';
import 'package:frontdesk_kliniku/color.dart';
import 'package:frontdesk_kliniku/components/reuse.dart';

class ListPasien extends StatefulWidget {
  const ListPasien({Key? key}) : super(key: key);

  @override
  State<ListPasien> createState() => _ListPasienState();
}

class _ListPasienState extends State<ListPasien> {
  List<Pasien> _pasien = [
    Pasien('Asep', 'Senin, 10-12', '08.00-12.00', '0812121212', 'acc', true),
    Pasien(
        'joni', 'Senin, 10-12', '08.00-12.00', '0812121212', 'panding', true),
    Pasien('shin', 'Senin, 10-12', '08.00-12.00', '0812121212', 'acc', true),
    Pasien(
        'jojo', 'Senin, 10-12', '08.00-12.00', '0812121212', 'panding', true),
  ];

  List<Pasien> _foundPasien = [];
  void initState() {
    super.initState();
    setState(() {
      _foundPasien = _pasien;
    });
  }

  onSearch(String value) {
    print(value);
    setState(() {
      _foundPasien = _pasien
          .where((pasien) =>
              pasien.nama.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  final cancleBtn = ElevatedButton(
    onPressed: () {},
    child: Text(
      'Cancel',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.red[900]),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.all(Colors.red[400]),
      minimumSize: MaterialStateProperty.all(const Size(200, 40)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0, //menghilangkan shadow pada elevation
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor,
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              hintText: 'cari dokter',
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView.builder(
          itemCount: _foundPasien.length,
          itemBuilder: (context, index) {
            return PasienComponent(pasien: _foundPasien[index]);
          },
        ),
      ),
    );
  }
}

PasienComponent({required Pasien pasien}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.only(bottom: 15, top: 15, left: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromARGB(255, 232, 232, 232),
    ),
    child: Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              pasien.nama,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              pasien.tanggal,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              pasien.jam,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              pasien.status,
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'acc',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.blue[800]),
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              minimumSize: MaterialStateProperty.all(const Size(20, 10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.red[900]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red[400]),
              minimumSize: MaterialStateProperty.all(const Size(20, 10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
