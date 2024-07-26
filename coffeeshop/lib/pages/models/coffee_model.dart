
// ignore_for_file: non_constant_identifier_names


class Coffee {

  String name;
  String price;
  String image_string;
  int quantity ;


  set setQuantity(int q){
      quantity =q;
  }

  Coffee({this.quantity = 0,required this.name,required this.price,required this.image_string});


}
