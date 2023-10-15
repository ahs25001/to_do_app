class TaskModel {
  String title;
  String description;
  String id;
  String userid;
  int ?date;
  bool isDone;

  TaskModel(
      {required this.title,
        required this.userid,
      required this.description,
      this.id = "",
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            title: json["title"],
            date: json["date"],
            description: json["description"],
            id: json["id"],
            userid: json["userid"],
            isDone: json["isDone"]);

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "date": date,
      "id": id,
      "userid":userid,
      "description": description,
      "isDone": isDone
    };
  }
}
