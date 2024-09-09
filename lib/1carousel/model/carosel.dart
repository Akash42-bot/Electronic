class SlideModel{
  String id;
  String image;


  SlideModel({
   required this.image ,
    required this.id
});


  ///model to map
Map<String,dynamic>toMap() {
  return {
    'id':id,
    'image': image,
  };
}
///
factory SlideModel.fromMap(Map<String,dynamic>map,String documentId){
  return SlideModel(
    id:documentId,
      image: map['image']??'',);
}
}