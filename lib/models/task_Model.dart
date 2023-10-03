class TaskModel {
  String title;
  String description;
  String id;
  int ?date;
  bool isDone;

  TaskModel(
      {required this.title,
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
            isDone: json["isDone"]);

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "date": date,
      "id": id,
      "description": description,
      "isDone": isDone
    };
  }
}
