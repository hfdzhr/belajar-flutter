import 'package:flutter/material.dart';

class OutputFormScreen extends StatelessWidget {
  final String nama,
      quantity,
      booking,
      pilihHewan,
      tempatHewan,
      hargaHewan,
      imageHewan;
  int harga;

  OutputFormScreen({
    Key? key,
    required this.nama,
    required this.quantity,
    required this.booking,
    required this.tempatHewan,
    required this.hargaHewan,
    required this.imageHewan,
    required this.pilihHewan,
  })  : harga = int.parse(hargaHewan),
        super(key: key);

  int hitungTotalHarga() {
    int quantityValue = int.parse(quantity);
    return quantityValue * harga;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                imageHewan,
                height: 200, // Atur tinggi gambar sesuai kebutuhan
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama: $nama', style: TextStyle(fontSize: 16)),
                    Text('Lokasi: $tempatHewan',
                        style: TextStyle(fontSize: 16)),
                    Text('Hewan: $pilihHewan', style: TextStyle(fontSize: 16)),
                    Text('Quantity: $quantity', style: TextStyle(fontSize: 16)),
                    Text('Harga: $hargaHewan', style: TextStyle(fontSize: 16)),
                    Text('Booking: $booking', style: TextStyle(fontSize: 16)),
                    Text(
                      'Total Harga: ${hitungTotalHarga()}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
