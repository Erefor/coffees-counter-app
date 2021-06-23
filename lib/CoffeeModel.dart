class Coffee {
  Coffee({
      this.id = 1,
      this.coffeeInt =1,
      this.size = 'small',
      this.date = '1-1-2021',
      
  });
  int coffeeInt;
  String size;
  String date;
  int id;

  factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
      id: json['id'],
      coffeeInt: json["int"],
      size: json["size"],
      date: json["date"]
      
  );
  Map<String, dynamic> toJson() => {
      "id":id,
      "int": coffeeInt,
      "size": size,
      "date": date
  };
}
