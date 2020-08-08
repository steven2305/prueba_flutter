
class User {

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  User({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.avatar = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id:               (json['id']             == null) ? ''   : json['id'],
    firstName:        (json['first_name']     == null) ? ''   : json['first_name'],
    lastName:         (json['last_name']      == null) ? ''   : json['last_name'],
    email:            (json['email']          == null) ? ''   : json['email'],
    avatar:           (json['avatar']         == null) ? ''   : json['avatar'],
  );

  Map<String, dynamic> toJson() => {
    'id':             (id             == null) ? ''     : id,
    'firstName':      (firstName      == null) ? ''     : firstName,
    'lastName':       (lastName       == null) ? ''     : lastName,
    'email':          (email          == null) ? ''     : email,
    'avatar':         (avatar         == null) ? ''     : avatar,
  };
}