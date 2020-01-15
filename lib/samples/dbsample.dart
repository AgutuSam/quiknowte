import 'dart:convert';

Project projectFromJson(String str) {
  final jsonData = json.decode(str);
  return Project.fromMap(jsonData as Map<String, dynamic>);
}


String projectToJson(Project data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Project {
  Project({
    this.id,
    this.firstName,
    this.lastName,
    this.blocked,
  });
  
   factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json['id'] as int,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        blocked: json['blocked'] == 1,
      );

  int id;
  String firstName;
  String lastName;
  bool blocked;

  

 

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'blocked': blocked,
      };
}