class TaskModel {
  String id;
  String title;
  String description;
  String data;
  bool isDone;

  TaskModel({
     this.id='',
    required  this.title,
    required  this.description,
    required this.data,
     this.isDone=false,
  });
//named constructor
  //بتاخد الماب بتحولها ل تاسك موديل
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          isDone: json['isDone'],
          data: json['data'],
          description: json['description'],
          title: json['title'],
        );
//دي بتاخد الموديل بتحوله لماب
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "data": data,
    };
  }
}
