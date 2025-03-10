

class Makanan {
  final String nama;
  final double harga;
  final String imgPath;

  Makanan({
    required this.nama,
    required this.harga,
    required this.imgPath,
  });

  static List<Makanan> getMakananList() {
    return [
      Makanan(nama: 'Burger JJ kajahsdka sjkahsdk kjh kjh ', harga: 5.99, imgPath: 'assets/img/burger.jpg'),
      Makanan(nama: 'Pizza' , harga: 7.99, imgPath: 'assets/img/pizzaa.jpg'),
      Makanan(nama: 'Sushi' , harga: 12.99, imgPath: 'assets/img/sushi.jpg'),
      Makanan(nama: 'Pasta' , harga: 6.99, imgPath: 'assets/img/pasta.jpg'),
      Makanan(nama: 'Salad' , harga: 4.99, imgPath: 'assets/img/salad.jpg'),
      Makanan(nama: 'Steak' , harga: 15.99, imgPath: 'assets/img/steak.jpg'),
    ];
  }
}
