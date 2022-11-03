
class GetCartsModel
{
  bool? status;
  CartsDataModel? data;


  GetCartsModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data= CartsDataModel.fromJson(json['data']);
  }

}


class CartsDataModel
{

  List<DataCartsModel> data=[] ;



  CartsDataModel.fromJson(Map<String , dynamic> json)
  {
    json['cart_items'].forEach((element)
    {
      data.add(DataCartsModel.fromJson(element) );
    });

  }

}
class DataCartsModel
{
  int? id;
  ProductCartsModel? product;
  DataCartsModel.fromJson(Map<String, dynamic> json)
  {
    id=json['id'];
    product=ProductCartsModel.fromJson(json['product']);
  }

}
class ProductCartsModel
{
  int? id;
  int? quantity;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;


  ProductCartsModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    quantity=json['quantity'];
    price= json['price'];
    oldPrice=json['old_price'];
    discount= json['discount'];
    image=json['image'];
    name= json['name'];
  }

}




