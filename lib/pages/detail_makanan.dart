import 'package:flutter/material.dart';
import 'package:latihan_kuis/model/makanan.dart';

class DetailMakanan extends StatefulWidget {
  final Makanan makanan;
  const DetailMakanan({
    super.key,
    required this.makanan,
  });

  @override
  State<DetailMakanan> createState() => _DetailMakananState();
}

class _DetailMakananState extends State<DetailMakanan> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    double totalHarga = widget.makanan.harga * jumlah;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.makanan.nama),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.makanan.imgPath,
                      height: 200, fit: BoxFit.cover),
                ),
                SizedBox(height: 16),
                Text(widget.makanan.nama,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'Rp${widget.makanan.harga.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (jumlah > 1) jumlah--;
                        });
                      },
                    ),
                    Text(jumlah.toString(), style: TextStyle(fontSize: 18)),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          jumlah++;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text('Total: Rp${totalHarga.toStringAsFixed(2)}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Pesan Sekarang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
