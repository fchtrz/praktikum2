import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MahasiswaForm(),
    );
  }
}

class MahasiswaForm extends StatefulWidget {
  @override
  _MahasiswaFormState createState() => _MahasiswaFormState();
}

class _MahasiswaFormState extends State<MahasiswaForm> {
  String _nama = '';
  String _gender = 'Laki-laki';
  bool _sudahBekerja = false;
  double _tinggiBadan = 160;
  final List<String> _makananFavorit = [];
  String _pekerjaanOrtu = 'PNS';
  String _provinsiAsal = 'Jawa Timur';

  final List<String> _listMakanan = [
    "Nasi Goreng",
    "Mie Ayam",
    "Bakso",
    "Soto",
    "Gado-gado"
  ];

  final List<String> _listPekerjaan = [
    "PNS",
    "Wiraswasta",
    "Karyawan Swasta",
    "Petani",
    "Guru"
  ];

  final List<String> _listProvinsi = [
    "Aceh",
    "Sumatera Utara",
    "Sumatera Barat",
    "Riau",
    "Jambi",
    "Sumatera Selatan",
    "Bengkulu",
    "Lampung",
    "Kepulauan Bangka Belitung",
    "Kepulauan Riau",
    "DKI Jakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "Banten",
    "Bali",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Kalimantan Barat",
    "Kalimantan Tengah",
    "Kalimantan Selatan",
    "Kalimantan Timur",
    "Kalimantan Utara",
    "Sulawesi Utara",
    "Sulawesi Tengah",
    "Sulawesi Selatan",
    "Sulawesi Tenggara",
    "Gorontalo",
    "Sulawesi Barat",
    "Maluku",
    "Maluku Utara",
    "Papua",
    "Papua Barat"
  ];

  bool validateInputs() {
    if (_nama.isEmpty ||
        _gender.isEmpty ||
        _makananFavorit.isEmpty ||
        _provinsiAsal.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _nama = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              const SizedBox(height: 16.0),
              Text('Gender: $_gender'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<String>(
                    value: "Laki-laki",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Laki-laki'),
                  Radio<String>(
                    value: "Perempuan",
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text('Perempuan'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Sudah Bekerja'),
                  Switch(
                    value: _sudahBekerja,
                    onChanged: (value) {
                      setState(() {
                        _sudahBekerja = value;
                      });
                    },
                  ),
                ],
              ),
                const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Tinggi Badan:'),
                  Slider(
                    value: _tinggiBadan,
                    min: 100.0,
                    max: 220.0,
                    divisions: 120,
                    onChanged: (value) {
                      setState(() {
                        _tinggiBadan = value;
                      });
                    },
                  ),
                  Text(_tinggiBadan.toStringAsFixed(1)),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Makanan Favorit:'),
              Column(
                children: _listMakanan.map((makanan) {
                  return CheckboxListTile(
                    title: Text(makanan),
                    value: _makananFavorit.contains(makanan),
                    onChanged: (checked) {
                      setState(() {
                        if (checked!) {
                          _makananFavorit.add(makanan);
                        } else {
                          _makananFavorit.remove(makanan);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _pekerjaanOrtu,
                items: _listPekerjaan.map((pekerjaan) {
                  return DropdownMenuItem<String>(
                    value: pekerjaan,
                    child: Text(pekerjaan),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _pekerjaanOrtu = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Pekerjaan Orang Tua',
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _provinsiAsal,
                items: _listProvinsi.map((provinsi) {
                  return DropdownMenuItem<String>(
                    value: provinsi,
                    child: Text(provinsi),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _provinsiAsal = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Provinsi Asal',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (validateInputs()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Konfirmasi'),
                          content: Text('Apakah data sudah benar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Submit data
                                print('Nama: $_nama');
                                print('Gender: $_gender');
                                print('Sudah Bekerja: $_sudahBekerja');
                                print('Tinggi Badan: $_tinggiBadan');
                                print('Makanan Favorit: $_makananFavorit');
                                print('Pekerjaan Ortu: $_pekerjaanOrtu');
                                print('Provinsi Asal: $_provinsiAsal');
                                // Show Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Data berhasil disimpan'),
                                  ),
                                );
                              },
                              child: Text('OK'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Batal'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Show error message if inputs are not valid
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Data tidak boleh kosong.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
