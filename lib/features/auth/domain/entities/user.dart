class UserProfile {
  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatarUrl;

  UserProfile({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'avatar_url': avatarUrl,
  };
}