import 'dart:convert';

import 'package:flutter/foundation.dart';

class Quiz {
  final String id;
  final String imageUrl;
  final String title;
  final String content;
  final String quiz;
  final String answer;
  final String type;
  final String score;
  final List<String> educations;
  Quiz({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.quiz,
    required this.answer,
    required this.type,
    required this.score,
    required this.educations,
  });

  Quiz copyWith({
    String? id,
    String? imageUrl,
    String? title,
    String? content,
    String? quiz,
    String? answer,
    String? type,
    String? score,
    List<String>? educations,
  }) {
    return Quiz(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      content: content ?? this.content,
      quiz: quiz ?? this.quiz,
      answer: answer ?? this.answer,
      type: type ?? this.type,
      score: score ?? this.score,
      educations: educations ?? this.educations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'content': content,
      'quiz': quiz,
      'answer': answer,
      'type': type,
      'score': score,
      'educations': educations,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      quiz: map['quiz'] ?? '',
      answer: map['answer'] ?? '',
      type: map['type'] ?? '',
      score: map['score'] ?? '',
      educations: List<String>.from(map['educations']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(id: $id, imageUrl: $imageUrl, title: $title, content: $content, quiz: $quiz, answer: $answer, type: $type, score: $score, educations: $educations)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quiz &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.content == content &&
        other.quiz == quiz &&
        other.answer == answer &&
        other.type == type &&
        other.score == score &&
        listEquals(other.educations, educations);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        title.hashCode ^
        content.hashCode ^
        quiz.hashCode ^
        answer.hashCode ^
        type.hashCode ^
        score.hashCode ^
        educations.hashCode;
  }
}

List<Quiz> listQuiz = [
  Quiz(
    id: '1',
    imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
    title: 'Umur',
    content:
        'Usia hamil yang tidak beresiko yaitu antara 20-35 tahun. Rentang usia tersebut merupakan usia reproduktif yang aman untuk hamil karena komplikasi kehamilan yang sedikit. Usia >35 tahun telah terjadi perubahan fungsional dan struktural yang berperan pada perubahan tekanan darah, sehingga lebih rentan mengalami preeklampsia.\n\nSumber : Espinoza dkk., 2020',
    quiz: 'Usia saya saat ini lebih dari atau sama dengan 35 tahun',
    answer: '',
    type: '1',
    score: '0',
    educations: [
      'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu',
      'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.',
      'Konsumsi makanan mengandung folat',
      'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.'
    ],
  ),
  Quiz(
      id: '2',
      imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
      title: 'Riwayat preeklamsi sebelumnya',
      content:
          'Riwayat hipertensi yang diderita sebelum kehamilan mengakibatkan gangguan/ kerusakan pada organ-organ penting di dalam tubuh dan ditambah adanya kehamilan yang membuat peningkatan berat badan sehingga menyebabkan gangguan/ kerusakan yang lebih parah dengan adanya edema dan terdapat protein urin yang disebut sebagai superimposed preeklamsi awitan dini.\n\nSumber : Espinoza dkk., 2020',
      answer: '',
      quiz:
          'Apakah kehamilan sebelumnya mengalami preeklamsi? Apabila ini kehamilan pertama, maka tekan tombol Tidak',
      type: '1',
      score: '0',
      educations: [
        'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu ',
        'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.',
        'Konsumsi makanan mengandung folat',
        'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.'
      ]),
  Quiz(
      id: '3',
      imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
      title: 'Riwayat preeklamsi pada ibu hamil atau saudara perempuan',
      content:
          'Preeklampsia merupakan penyakit yang diturunkan, ibu hamil yang mengalami preeklamsi terdapat kecenderungan akan diwariskan. penyakit ini lebih sering ditemukan pada anak perempuan dari ibu preeklampsia, atau mempunyai riwayat preeklampsia dalam keluarga (Espinoza dkk., 2020). hal ini karena adanya faktor gen atau keturunan yang ada pada pada ibu hamil.\n\nSumber: Karrar. S. A, 2023',
      answer: '',
      quiz:
          'Apakah terdapat saudara perempuan atau ibu yang memiliki riwayat kehamilan dengan preeklamsi?',
      type: '1',
      score: '0',
      educations: [
        'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu ',
        'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.',
        'Konsumsi makanan mengandung folat',
        'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.'
      ]),
  Quiz(
      id: '4',
      imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
      title: 'Hipertensi kronis',
      content:
          'Hipertensi kronis sudah memiliki tekanan darah tinggi yang menahun tekanan darah dikatakan tinggi >140/90, kejadian preeklamsi awitan dini/eklampsia akan meningkat karena pertumbuhan darah plasenta sudah mengalami gangguan. Bila sebelum hamil, ibu sudah menderita hipertensi maka keadaan ini akan memperberat keadaan ibu saat hamil.\n\nSumber: Espinoza dkk., 2020',
      answer: '',
      quiz:
          'Saya memiliki tekanan darah tinggi sejak sebelum hamil sampai saat ini',
      type: '1',
      score: '0',
      educations: [
        'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu ',
        'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.',
        'Konsumsi makanan mengandung folat',
        'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.'
      ]),
  Quiz(
      id: '5',
      imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
      title: 'Obesitas',
      content:
          'Obesitas adalah kelebihan berat badan biasanya disertai kelebihan lemak dan protein hewani, kelebihan gula dan garam. Ibu hamil dikatakan obesitas jika kenaikan berat badan pada ibu hamil melebihi 12-16 kg. (Dewie et al., 2020). Tingkatan IMT kurus (Underweight) (<18,5 Kg/m2), IMT Normal (18,5 –24,9 Kg/m2), IMT berisi (Overweight) (25 > 29,9 Kg/m2), IMT gendut (Obesitas) (≥30 Kg/m2).\n\nSumber: Karrar. S. A, 2023',
      answer: '',
      quiz: '',
      type: '2',
      score: '0',
      educations: [
        'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu ',
        'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.',
        'Konsumsi makanan mengandung folat',
        'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.'
      ]),
  Quiz(
      id: '6',
      imageUrl: 'https://i.ibb.co/QCLdph0/bayi.png',
      title: 'MAP',
      content:
          'Mean Arterial Pressure (MAP) adalah nilai dari hasil rata-rata tekanan darah yang dinilai dengan mengukur tekanan atas (sistol) dan bawah (diastole), kemudian menentukan nilai rata-rata tekanan. MAP dikatakan positif jika hasilnya >90 mmHg, negatif jika hasilnya <90 mmHg.\n\nSumber: Musyoka dkk., 2019; Kolifah & Agung Mulyaningsih, 2020',
      answer: '',
      quiz: '',
      type: '3',
      score: '0',
      educations: [
        'Melakukan aktifitas fisik di awal kehamilan, seperti jalan pagi dan olahraga ringan selama 30 menit dan dilakukan 4 jam perminggu ',
        'Konsumsi makanan kaya antioksidan (asupan vitamin C, E dan karoten). Seperti: brokoli, kacang-kacangan, wortel, bayam, kentang, nasi merah, ikan salmon, ikan kembung, ikan tuna.'
            'Konsumsi makanan mengandung folat',
        'Diet tinggi protein (telur, ikan tempe), rendah lemak (gorengan, jeroan, daging berlemak), karbohidrat (nasi putih panas, kentang), dan garam.',
      ]),
];
