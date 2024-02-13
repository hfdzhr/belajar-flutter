import 'package:belajar_flutter/helpers/size_helper.dart';
import 'package:belajar_flutter/screens/list_fauna_screen.dart';
import 'package:belajar_flutter/screens/output_from_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BelajarForm extends StatefulWidget {
  BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController bookingController = TextEditingController();
  String _pilihAgama = '';
  String _pilihHewan = '';
  String _pilihTempatHewan = '';
  String _hargaHewan = '';
  String _imageHewan = '';

  final List<String> agama = [
    'Islam',
    'Protestan',
    'Katolik',
    'Buddha',
    'Konghucu',
    'Hindu'
  ];

  final List<Map<String, dynamic>> hewan = [
    {
      "tempat": "BANDUNG",
      "harga": "10000",
      "image": "assets/img/fox.jpg",
      "hewan": "fox"
    },
    {
      "tempat": "JAKARTA",
      "harga": "20000",
      "image": "assets/img/turtle.jpg",
      "hewan": "turtle"
    },
    {
      "tempat": "SURABAYA",
      "harga": "30000",
      "image": "assets/img/polar_bear.jpg",
      "hewan": "Polar Bear"
    },
    {
      "tempat": "YOGYA",
      "harga": "40000",
      "image": "assets/img/monkey.jpg",
      "hewan": "monkey"
    },
    {
      "tempat": "LAMPUNG",
      "harga": "50000",
      "image": "assets/img/owl.jpg",
      "hewan": "owl"
    },
  ];

  void initState() {
    bookingController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Booking Tiket Kebun Binatang'),
                        SizedBox(height: 18),
                        TextFormField(
                          controller: namaController,
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Nama';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 18),
                        DropdownButtonFormField<Map<String, dynamic>>(
                          decoration: InputDecoration(
                            hintText: 'Tempat',
                            labelText: 'Pilih Tempat',
                            border: OutlineInputBorder(),
                          ),
                          items: hewan.map((hewanData) {
                            return DropdownMenuItem<Map<String, dynamic>>(
                              value: hewanData,
                              child: Text(
                                  "${hewanData['tempat']},Harga: ${hewanData['harga']},Hewan: ${hewanData['hewan']}"),
                            );
                          }).toList(),
                          onChanged: (Map<String, dynamic>? newValue) {
                            setState(() {
                              _pilihTempatHewan = newValue!['tempat'];
                              _pilihHewan = newValue['hewan'];
                              _hargaHewan = newValue['harga'];
                              _imageHewan = newValue['image'];
                            });
                          },
                        ),
                        SizedBox(height: 18),
                        TextFormField(
                          controller: quantityController,
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Quantity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 18),
                        TextFormField(
                          controller: bookingController,
                          decoration: InputDecoration(
                            hintText: 'Tanggal Booking',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Tanggal Booking';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String tgl =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                bookingController.text = tgl;
                              });
                            } else {
                              print('Tanggal tidak dipilih');
                            }
                          },
                        ),
                        SizedBox(height: 18),
                        SizedBox(
                          width: displayWidth(context) * 0.8,
                          height: displayHeight(context) * 0.05,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white60)),
                              ),
                            ),
                            child: Text('Simpan'),
                            onPressed: () {
                              _submit();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();
      String nama = namaController.text;
      String quantity = quantityController.text;
      String tempatHewan = _pilihTempatHewan;
      String hargaHewan = _hargaHewan;
      String imageHewan = _imageHewan;
      String pilihHewan = _pilihHewan;
      String booking = bookingController.text;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OutputFormScreen(
                  nama: nama,
                  quantity: quantity,
                  booking: booking,
                  tempatHewan: tempatHewan,
                  pilihHewan: pilihHewan,
                  hargaHewan: hargaHewan,
                  imageHewan: imageHewan)));
    }
  }
}
