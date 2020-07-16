class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String zip;
  String statement;
  String password;
  int time;
  int day;
  List<String> interests;
  List<String> expertise;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone = '',
    this.zip = '',
    this.statement = '',
    this.time = 0,
    this.day = 0,
    this.password = '',
  });

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
