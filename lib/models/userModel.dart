class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String zip;
  String statement;
  int time;
  int day;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone = '',
    this.zip = '',
    this.statement = '',
    this.time = 0,
    this.day = 0,
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
