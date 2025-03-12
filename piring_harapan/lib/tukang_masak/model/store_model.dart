class StoreModel {
  String storeID;
  String storeName;
  int storeRating;
  int storeResponse;
  int storeSubscribers;
  int storeTotalIncome;

  StoreModel.fromJson(Map json)
      : storeID = json['store_id'] as String,
        storeName = json['store_name'] as String,
        storeRating = json['store_rating'] as int,
        storeResponse = json['store_response'] as int,
        storeSubscribers = json['store_subscribers'] as int,
        storeTotalIncome = json['store_totalincome'] as int;
}