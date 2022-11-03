class SearchModel
{
  bool? status;
  SearchDataModel? data;


  SearchModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data= SearchDataModel.fromJson(json['data']);
  }

}

class SearchDataModel
{

  List<SearchProductsModel> product=[];


  SearchDataModel.fromJson(Map<String , dynamic> json)
  {
    json['data'].forEach((element)
    {
      product.add(SearchProductsModel.fromJson(element));
    });

  }

}

class SearchProductsModel
{

  int? id;
  String? image;
  dynamic price;
  dynamic discount;
  String? name;
  bool? in_favorites;
  bool? in_cart;


  SearchProductsModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    image=json['image'];
    price=json['price'];
    name=json['name'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];

  }

}