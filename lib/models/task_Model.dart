class TaskModel {
  String? title;
  String? description;
  String? id;
  int? date;
  bool? isDone;

  TaskModel(
      {this.title, this.description, this.id, this.date, this.isDone = false});

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
      "data": date,
      "id": id,
      "description": description,
      "isDone": isDone
    };
  }
}
