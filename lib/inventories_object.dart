class Inventories_object {
  String idItem;
  String idUser;
  int amount;
  Inventories_object(
      {required this.idItem, required this.idUser, required this.amount});
  Map<String, dynamic> toJson() {
    return {
      'idItem':idItem,
      'idUser':idUser,
      'amount': amount
    };
  }
}
