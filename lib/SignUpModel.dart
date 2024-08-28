class SignUpModel {
  String? email;
  String? password;
  String? username;
  String? role;

  SignUpModel({this.email, this.password, this.username, this.role});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['role'] = this.role;
    return data;
  }
}