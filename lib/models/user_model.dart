class Usermodel {
  String? uid;
  String? email;
  String? name;
  String? lastname;

  Usermodel({this.uid, this.email, this.name, this.lastname});
  //recive data
  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      lastname: map['lastname'],
    );
  }
  //sending data
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'lastname': lastname,
    };
  }
}
