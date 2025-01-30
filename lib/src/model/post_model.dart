import 'dart:convert';

class PostModel {
  final int id;
  final int schoolId;
  final int userId;
  final String feedTxt;
  final String status;
  final String title;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final String createdAt;
  final String updatedAt;
  final String feedPrivacy;
  final User user;

  PostModel({
    required this.id,
    required this.schoolId,
    required this.userId,
    required this.feedTxt,
    required this.status,
    required this.title,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.createdAt,
    required this.updatedAt,
    required this.feedPrivacy,
    required this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      schoolId: json['school_id'],
      userId: json['user_id'],
      feedTxt: json['feed_txt'],
      status: json['status'],
      title: json['title'],
      likeCount: json['like_count'],
      commentCount: json['comment_count'],
      shareCount: json['share_count'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      feedPrivacy: json['feed_privacy'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'user_id': userId,
      'feed_txt': feedTxt,
      'status': status,
      'title': title,
      'like_count': likeCount,
      'comment_count': commentCount,
      'share_count': shareCount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'feed_privacy': feedPrivacy,
      'user': user.toJson(),
    };
  }
}

class User {
  final int id;
  final String fullName;
  final String profilePic;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      profilePic: json['profile_pic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'profile_pic': profilePic,
    };
  }
}

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
