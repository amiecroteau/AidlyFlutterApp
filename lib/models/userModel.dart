class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String zip;
  String statement;
  int time;
  int day;

  UserModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.zip,
      this.statement,
      this.time,
      this.day});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'zip': zip,
      'statement': statement,
      'time': time,
      'day': day
    };
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phone: $phone, email:$email, zip:$zip, statement:$statement, time:$time, day:$day}';
  }
}
