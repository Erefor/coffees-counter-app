class Coffee {
  Coffee({
    this.id,
    this.coffeeInt = 1,
    this.size = 'small',
    this.date = '1-1-2021',
  });
  int coffeeInt;
  String size;
  String date;
  int? id;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
      id: json['id'],
      coffeeInt: json["entero"],
      size: json["size"],
      date: json["date"]);
  Map<String, dynamic> toJson() =>
      {"id": id, "entero": coffeeInt, "size": size, "date": date};
}
