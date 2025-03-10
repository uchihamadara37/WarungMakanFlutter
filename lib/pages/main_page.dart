import 'package:flutter/material.dart';
import 'package:latihan_kuis/model/makanan.dart';
import 'package:latihan_kuis/pages/detail_makanan.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Makanan> items = [];

  void reloadData() {
    items = Makanan.getMakananList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    reloadData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Pemesanan'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 4,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMakanan(
                      makanan: items[index],
                    ),
                  ),
                )
              },
              child: CardMakanan(item: items[index]),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Order'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CardMakanan extends StatelessWidget {
  const CardMakanan({
    super.key,
    required this.item,
  });

  final Makanan item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        // kolom ke bawah gambar dan tulisan
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                item.imgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
            child: Text(
              overflow: TextOverflow.ellipsis,
              item.nama,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ), // Alt Shft F
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 8),
            child: Text(
              "Rp${item.harga}",
              maxLines: 1,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
