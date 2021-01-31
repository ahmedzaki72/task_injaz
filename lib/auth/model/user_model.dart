class User {
   String id;
   String username;
   String email;
  bool company;

  User({
    this.id,
    this.username,
    this.email,
    this.company,
  });

User.fromJson(Map<String, dynamic> map) {
  if(map == null) {
    return;
  }
  id = map['id'];
  username = map['username'];
  email = map['email'];
  company = map['company'];
}

  Map<String , dynamic> toJson(){
   return {
     'id' : id,
     'username' : username,
    'email' : email,
     'company' : company,
   };
}

}
