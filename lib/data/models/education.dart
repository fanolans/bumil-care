import 'dart:convert';

class Education {
  final String id;
  final String imageUrl;
  final String title;
  final String content;

  Education({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.content,
  });

  Education copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? content,
  }) {
    return Education(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'content': content,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Education(id: $id, imageUrl: $imageUrl, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Education &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^ imageUrl.hashCode ^ title.hashCode ^ content.hashCode;
  }
}

List<Education> listEducation = [
  Education(
    id: '1',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Umur',
    content:
        'Usia hamil yang tidak beresiko yaitu antara 20-35 tahun. Rentang usia tersebut merupakan usia reproduktif yang aman untuk hamil karena komplikasi kehamilan yang sedikit. Usia >35 tahun telah terjadi perubahan fungsional dan struktural yang berperan pada perubahan tekanan darah, sehingga lebih rentan mengalami preeklampsia.\n\nSumber : Espinoza dkk., 2020',
  ),
  Education(
    id: '2',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Riwayat preeklamsi sebelumnya',
    content:
        'Riwayat hipertensi yang diderita sebelum kehamilan mengakibatkan gangguan/ kerusakan pada organ-organ penting di dalam tubuh dan ditambah adanya kehamilan yang membuat peningkatan berat badan sehingga menyebabkan gangguan/ kerusakan yang lebih parah dengan adanya edema dan terdapat protein urin yang disebut sebagai superimposed preeklamsi awitan dini.\n\nSumber : Espinoza dkk., 2020',
  ),
  Education(
    id: '3',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Riwayat preeklamsi pada ibu hamil atau saudara perempuan',
    content:
        'Preeklampsia merupakan penyakit yang diturunkan, ibu hamil yang mengalami preeklamsi terdapat kecenderungan akan diwariskan. penyakit ini lebih sering ditemukan pada anak perempuan dari ibu preeklampsia, atau mempunyai riwayat preeklampsia dalam keluarga (Espinoza dkk., 2020). hal ini karena adanya faktor gen atau keturunan yang ada pada pada ibu hamil.\n\nSumber: Karrar. S. A, 2023',
  ),
  Education(
    id: '4',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Hipertensi kronis',
    content:
        'Hipertensi kronis sudah memiliki tekanan darah tinggi yang menahun tekanan darah dikatakan tinggi >140/90, kejadian preeklamsi awitan dini/eklampsia akan meningkat karena pertumbuhan darah plasenta sudah mengalami gangguan. Bila sebelum hamil, ibu sudah menderita hipertensi maka keadaan ini akan memperberat keadaan ibu saat hamil.\n\nSumber: Espinoza dkk., 2020',
  ),
  Education(
    id: '5',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Obesitas',
    content:
        'Obesitas adalah kelebihan berat badan biasanya disertai kelebihan lemak dan protein hewani, kelebihan gula dan garam. Ibu hamil dikatakan obesitas jika kenaikan berat badan pada ibu hamil melebihi 12-16 kg. (Dewie et al., 2020). Tingkatan IMT kurus (Underweight) (<18,5 Kg/m2), IMT Normal (18,5 –24,9 Kg/m2), IMT berisi (Overweight) (25 > 29,9 Kg/m2), IMT gendut (Obesitas) (≥30 Kg/m2).\n\nSumber: Karrar. S. A, 2023',
  ),
  Education(
    id: '6',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'MAP',
    content:
        'Mean Arterial Pressure (MAP) adalah nilai dari hasil rata-rata tekanan darah yang dinilai dengan mengukur tekanan atas (sistol) dan bawah (diastole), kemudian menentukan nilai rata-rata tekanan. MAP dikatakan positif jika hasilnya >90 mmHg, negatif jika hasilnya <90 mmHg.\n\nSumber: Musyoka dkk., 2019; Kolifah & Agung Mulyaningsih, 2020',
  ),
];
