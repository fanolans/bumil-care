import 'dart:convert';

List<Faq> faqFromJson(String str) =>
    List<Faq>.from(json.decode(str).map((x) => Faq.fromJson(x)));

String faqToJson(List<Faq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faq {
  String answer;
  int id;
  String question;

  Faq({
    required this.answer,
    required this.id,
    required this.question,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        answer: json["answer"],
        id: json["id"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "id": id,
        "question": question,
      };
}
