class UserClass {
  String? uid;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String imageLink = "https://ibb.co/CwdRDTf";
  UserClass({
    this.uid,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address,
  });

  // receiving data from the server
  factory UserClass.fromMap(map) {
    return UserClass(
      uid: map['uid'],
      email: map['email'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
    );
  }

  // sending the data from server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
