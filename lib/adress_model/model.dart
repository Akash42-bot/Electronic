class AdressModel{
  String adress;
  String place;
  String zip;
  String id;
  String state;

  AdressModel({
   required this.place,
   required this.adress,
   required this.zip ,
    required this.id,
    required this.state
});
  /// Convert model to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
     'adress':adress,
      'zip':zip,
      'place':place,
      'state':state
    };
  }

  /// Convert map to model
  factory AdressModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AdressModel(
      id: documentId,
      adress: map['adress'] ?? '',
      place: map['place'] ?? '',
      zip: map['zip']??'',
       state: map['state']??'',


    );
  }



}