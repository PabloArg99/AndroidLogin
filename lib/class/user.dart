class User {
  String email;
  String username;
  String password;

  User(this.email,this.username,this.password);

  bool passMatch(String pass){
    return password == pass;
  }
}