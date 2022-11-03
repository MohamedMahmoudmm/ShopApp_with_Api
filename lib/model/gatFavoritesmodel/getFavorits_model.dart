
class GetFavoritesModel
{
  bool? status;
  FavoritesDataModel? data;


  GetFavoritesModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data= FavoritesDataModel.fromJson(json['data']);
  }

}


class FavoritesDataModel
{

  List<DataFavoritesModel> data=[] ;



  FavoritesDataModel.fromJson(Map<String , dynamic> json)
  {
    json['data'].forEach((element)
    {
      data.add(DataFavoritesModel.fromJson(element) );
    });

  }

}
class DataFavoritesModel
{
  int? id;
  ProductFavoritesModel? product;
  DataFavoritesModel.fromJson(Map<String, dynamic> json)
  {
    id=json['id'];
    product=ProductFavoritesModel.fromJson(json['product']);
  }

}
class ProductFavoritesModel
{
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;


  ProductFavoritesModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'] ;
    price= json['price'].toDouble();
    oldPrice=json['old_price'].toDouble();
    discount= json['discount'];
    image=json['image'];
    name= json['name'];
  }

}




