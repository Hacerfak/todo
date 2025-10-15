// lib/models/task.dart
class Task {
  String id;
  String title;
  bool isDone;
  bool isArchived;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    this.isArchived = false,
  });

  // Converte um objeto Task para um Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
      'isArchived': isArchived,
    };
  }

  // Cria um objeto Task a partir de um Map (JSON)
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
      isArchived: json['isArchived'],
    );
  }
}
