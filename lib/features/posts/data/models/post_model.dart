import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
      };
}

// @override
//   String toString() {
//     return 'PostModel(userId: $userId, id: $id, title: $title, body: $body)';
//   }

//   factory PostModel.fromMap(Map<String, dynamic> data) => PostModel(
//         userId: data['userId'] as int?,
//         id: data['id'] as int?,
//         title: data['title'] as String?,
//         body: data['body'] as String?,
//       );

//   Map<String, dynamic> toMap() => {
//         'userId': userId,
//         'id': id,
//         'title': title,
//         'body': body,
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [PostModel].
//   factory PostModel.fromJson(String data) {
//     return PostModel.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [PostModel] to a JSON string.
//   String toJson() => json.encode(toMap());