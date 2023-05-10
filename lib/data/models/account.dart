import 'dart:convert';

class Account {
  final String id;
  final String email;
  final String photoURL;
  final String name;
  final String birthDate;
  final String age;
  final String height;
  final String weight;
  Account({
    required this.id,
    required this.email,
    required this.photoURL,
    required this.name,
    required this.birthDate,
    required this.age,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'photoURL': photoURL,
      'name': name,
      'birthDate': birthDate,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
      name: map['name'] ?? '',
      birthDate: map['birthDate'] ?? '',
      age: map['age'] ?? '',
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Account &&
      other.id == id &&
      other.email == email &&
      other.photoURL == photoURL &&
      other.name == name &&
      other.birthDate == birthDate &&
      other.age == age &&
      other.height == height &&
      other.weight == weight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      photoURL.hashCode ^
      name.hashCode ^
      birthDate.hashCode ^
      age.hashCode ^
      height.hashCode ^
      weight.hashCode;
  }

  Account copyWith({
    String? id,
    String? email,
    String? photoURL,
    String? name,
    String? birthDate,
    String? age,
    String? height,
    String? weight,
  }) {
    return Account(
      id: id ?? this.id,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  @override
  String toString() {
    return 'Account(id: $id, email: $email, photoURL: $photoURL, name: $name, birthDate: $birthDate, age: $age, height: $height, weight: $weight)';
  }
}
