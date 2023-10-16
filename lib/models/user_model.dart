class UserModel {
  String id;
  String firstName;
  String lastName;
  int age;
  String email;

  UserModel(
      {required this.id,
      required this.firstName,
        required this.lastName,
      required this.age,
      required this.email});

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            firstName: json["firstName"],
            lastName: json["lastName"],
            age: json["age"],
            email: json["email"]);

  Map<String, dynamic> toJson() {
    return {"id": id, "firstName": firstName,"lastName":lastName, "age": age, "email": email};
  }
}
