// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'dart:convert';

SamplePosts samplePostsFromJson(String str) => SamplePosts.fromJson(json.decode(str));

String samplePostsToJson(SamplePosts data) => json.encode(data.toJson());

class SamplePosts {
  List<Datum> data;

  SamplePosts({
    required this.data,
  });

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String? postBody;
  int? userId;
  String? userName;
  dynamic lastName;
  Visibility? visibility;
  String userAvatar;
  List<Comment> comments;
  Album? album;
  List<PostReaction> postReactions;
  int? userReactionId;
  int? usertiPostReaconId;
  ReactionName? userReactionName;
  int reactionCount;
  DateTime createdAt;
  bool postSaved;
  User? user;

  Datum({
    required this.id,
    required this.postBody,
    required this.userId,
    required this.userName,
    required this.lastName,
    required this.visibility,
    required this.userAvatar,
    required this.comments,
    required this.album,
    required this.postReactions,
    required this.userReactionId,
    required this.usertiPostReaconId,
    required this.userReactionName,
    required this.reactionCount,
    required this.createdAt,
    required this.postSaved,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    postBody: json["postBody"],
    userId: json["userId"],
    userName: json["userName"],
    lastName: json["lastName"],
    visibility: visibilityValues.map[json["visibility"]]!,
    userAvatar: json["userAvatar"],
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    album: json["album"] == null ? null : Album.fromJson(json["album"]),
    postReactions: List<PostReaction>.from(json["post_reactions"].map((x) => PostReaction.fromJson(x))),
    userReactionId: json["userReactionID"],
    usertiPostReaconId: json["usertiPostReaconID"],
    userReactionName: reactionNameValues.map[json["userReactionName"]]!,
    reactionCount: json["reactionCount"],
    createdAt: DateTime.parse(json["created_at"]),
    postSaved: json["postSaved"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "postBody": postBody,
    "userId": userId,
    "userName": userName,
    "lastName": lastName,
    "visibility": visibilityValues.reverse[visibility],
    "userAvatar": userAvatar,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    "album": album?.toJson(),
    "post_reactions": List<dynamic>.from(postReactions.map((x) => x.toJson())),
    "userReactionID": userReactionId,
    "usertiPostReaconID": usertiPostReaconId,
    "userReactionName": reactionNameValues.reverse[userReactionName],
    "reactionCount": reactionCount,
    "created_at": createdAt.toIso8601String(),
    "postSaved": postSaved,
    "user": user?.toJson(),
  };
}

class Album {
  int id;
  String name;
  dynamic identifier;
  List<PostImage> images;

  Album({
    required this.id,
    required this.name,
    required this.identifier,
    required this.images,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    id: json["id"],
    name: json["name"],
    identifier: json["identifier"],
    images: List<PostImage>.from(json["images"].map((x) => PostImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "identifier": identifier,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class PostImage {
  int id;
  String image;
  String sequence;
  dynamic title;
  dynamic subTitle;
  int albumId;

  PostImage({
    required this.id,
    required this.image,
    required this.sequence,
    required this.title,
    required this.subTitle,
    required this.albumId,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) => PostImage(
    id: json["id"],
    image: json["image"],
    sequence: json["sequence"],
    title: json["title"],
    subTitle: json["subTitle"],
    albumId: json["albumId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "sequence": sequence,
    "title": title,
    "subTitle": subTitle,
    "albumId": albumId,
  };
}

class Comment {
  int id;
  String commentBody;
  int postId;
  int userId;
  String userName;
  String? lastName;
  String userAvatar;
  Posts posts;
  DateTime createdAt;
  DateTime updatedAt;

  Comment({
    required this.id,
    required this.commentBody,
    required this.postId,
    required this.userId,
    required this.userName,
    required this.lastName,
    required this.userAvatar,
    required this.posts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    commentBody: json["commentBody"],
    postId: json["postId"],
    userId: json["userId"],
    userName: json["userName"],
    lastName: json["lastName"],
    userAvatar: json["userAvatar"],
    posts: Posts.fromJson(json["posts"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "commentBody": commentBody,
    "postId": postId,
    "userId": userId,
    "userName": userName,
    "lastName": lastName,
    "userAvatar": userAvatar,
    "posts": posts.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Posts {
  int id;
  String? postBody;
  int? userId;
  String? userName;
  dynamic lastName;
  String? designationId;
  Visibility? visibility;
  int? albumId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Posts({
    required this.id,
    required this.postBody,
    required this.userId,
    required this.userName,
    required this.lastName,
    required this.designationId,
    required this.visibility,
    required this.albumId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["id"],
    postBody: json["postBody"],
    userId: json["userId"],
    userName: json["userName"],
    lastName: json["lastName"],
    designationId: json["designationId"],
    visibility: visibilityValues.map[json["visibility"]]!,
    albumId: json["albumId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "postBody": postBody,
    "userId": userId,
    "userName": userName,
    "lastName": lastName,
    "designationId": designationId,
    "visibility": visibilityValues.reverse[visibility],
    "albumId": albumId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

enum Visibility {
  PUBLIC,
  PUBLIC_DATA
}

final visibilityValues = EnumValues({
  "public": Visibility.PUBLIC,
  "public data": Visibility.PUBLIC_DATA
});

class PostReaction {
  int id;
  int userId;
  int postId;
  int reactionId;
  String userName;
  String userAvatar;
  Posts posts;
  Reactions? reactions;

  PostReaction({
    required this.id,
    required this.userId,
    required this.postId,
    required this.reactionId,
    required this.userName,
    required this.userAvatar,
    required this.posts,
    required this.reactions,
  });

  factory PostReaction.fromJson(Map<String, dynamic> json) => PostReaction(
    id: json["id"],
    userId: json["userId"],
    postId: json["postId"],
    reactionId: json["reactionId"],
    userName: json["userName"],
    userAvatar: json["userAvatar"],
    posts: Posts.fromJson(json["posts"]),
    reactions: json["reactions"] == null ? null : Reactions.fromJson(json["reactions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "postId": postId,
    "reactionId": reactionId,
    "userName": userName,
    "userAvatar": userAvatar,
    "posts": posts.toJson(),
    "reactions": reactions?.toJson(),
  };
}

class Reactions {
  int id;
  ReactionName? reactionName;
  ReactionImage? reactionImage;
  DateTime createdAt;
  DateTime updatedAt;

  Reactions({
    required this.id,
    required this.reactionName,
    required this.reactionImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
    id: json["id"],
    reactionName: reactionNameValues.map[json["reactionName"]]!,
    reactionImage: reactionImageValues.map[json["reactionImage"]]!,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reactionName": reactionNameValues.reverse[reactionName],
    "reactionImage": reactionImageValues.reverse[reactionImage],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum ReactionImage {
  IMAGES_HAPPY_JPEG
}

final reactionImageValues = EnumValues({
  "images//happy.jpeg": ReactionImage.IMAGES_HAPPY_JPEG
});

enum ReactionName {
  HAPPY
}

final reactionNameValues = EnumValues({
  "happy": ReactionName.HAPPY
});

class User {
  int id;
  String name;
  dynamic middleName;
  dynamic lastName;
  String email;
  String avatar;
  int? designationId;
  Designation? designation;

  User({
    required this.id,
    required this.name,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.designationId,
    required this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    email: json["email"],
    avatar: json["avatar"],
    designationId: json["designationId"],
    designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "middleName": middleName,
    "lastName": lastName,
    "email": email,
    "avatar": avatar,
    "designationId": designationId,
    "designation": designation?.toJson(),
  };
}

class Designation {
  int id;
  Name name;
  dynamic description;
  dynamic activeStatus;
  dynamic createdAt;

  Designation({
    required this.id,
    required this.name,
    required this.description,
    required this.activeStatus,
    required this.createdAt,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    description: json["description"],
    activeStatus: json["activeStatus"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "description": description,
    "activeStatus": activeStatus,
    "created_at": createdAt,
  };
}

enum Name {
  MANAGER,
  SENIOR_SOFTWARE_ENGINEER,
  TEAM_LEADER
}

final nameValues = EnumValues({
  "Manager": Name.MANAGER,
  "Senior Software Engineer": Name.SENIOR_SOFTWARE_ENGINEER,
  "Team Leader": Name.TEAM_LEADER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
