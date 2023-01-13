class Apartment {
  String? id;
  String? title;
  String? image;
  String? location;
  String? description;
  double? rating;
  int? price;
  String? type;
  int? users;
  List<String>? facilities;

  Apartment({
    this.description,
    this.facilities,
    this.id,
    this.image,
    this.location,
    this.price,
    this.rating,
    this.title,
    this.type,
    this.users,
  });
}

// final listApartmentTop = [
//   Apartment(
//     description:
//         "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
//     facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
//     id: 'apartment1',
//     image: 'assets/apartment1.jfif',
//     location: 'Bali, Indonesia',
//     owner: listUser[0],
//     price: 230,
//     rating: 4.5,
//     title: 'Town Hall',
//     type: 'Hot this month',
//     users: 13,
//   ),
//   Apartment(
//     description:
//         "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
//     facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
//     id: 'apartment2',
//     image: 'assets/apartment2.jfif',
//     location: 'Garut, Indonesia',
//     owner: listUser[1],
//     price: 173,
//     rating: 4.5,
//     title: 'Babakan Seungit',
//     type: 'Great Place',
//     users: 40,
//   ),
// ];
final listApartmentNear = [
  Apartment(
    description:
        "Selain standar dari Indonesia Care, semua tamu akan mendapatkan Wi-Fi gratis di semua kamar dan parkir gratis jika tiba dengan mobil. Terletak strategis di Laweyan yang merupakan bagian Surakarta, properti ini menempatkan Anda dekat dengan atraksi dan opsi restoran menarik. Jangan pulang dulu sebelum berkunjung ke Museum Batik Danar Hadi yang terkenal. Memiliki peringkat bintang-5, properti berkelas ini menyediakan akses ke kolam renang luar ruangan, pijat dan pusat kebugaran untuk para tamu di properti.",
    facilities: ['1 Kasur King Size', 'Luas 40m', 'Balkon', 'Bebas asap rokok'],
    id: 'apartment3',
    image: 'assets/alila1.jpg',
    location:
        'Jl. Brigjen Slamet Riyadi No. 562, Laweyan, Surakarta, Indonesia, 57144',
    price: 1095833,
    rating: 4.5,
    title: 'Alila Solo',
    type: 'Pure',
    users: 39,
  ),
  Apartment(
    description:
        "Mencari tempat menginap di Solo? Coba lihat The Royal Surakarta Heritage Solo - MGallery Collection, hotel romantis yang menyuguhkan daya tarik terbaik Solo ke kamar Anda.",
    facilities: ['2 Kasur', 'Suite', 'Ruang Keluarga', 'Bebas asap rokok'],
    id: 'apartment4',
    image: 'assets/heritage.jpg',
    location: 'Jl. Slamet Riyadi no. 6, Solo 57111 Indonesia',
    price: 513000,
    rating: 4.5,
    title: 'The Royal Surakarta Heritage',
    type: 'Pure',
    users: 21,
  ),
];
