class Role {
  String uuid;
  String displayName;
  String description;
  String displayIcon;
  String assetPath;

  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        uuid: json['uuid'] as String,
        displayName: json['displayName'] as String,
        description: json['description'] as String,
        displayIcon: json['displayIcon'] as String,
        assetPath: json['assetPath'] as String,
      );

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'displayName': displayName,
        'description': description,
        'displayIcon': displayIcon,
        'assetPath': assetPath,
      };
}
