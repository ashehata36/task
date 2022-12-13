class AddressModel {
  String title;
  String description;
  String details;

  AddressModel({
    required this.description,
    required this.title,
    required this.details,
  });
}

class AddressesModel {
  List<AddressModel> addresses;

  AddressesModel({required this.addresses});
}

AddressesModel dummyAddresses = AddressesModel(
  addresses: [
    AddressModel(
      title: "Home Address",
      description: "Mustafa St. No:2",
      details: "Street x12",
    ),
    AddressModel(
      title: "Office Address",
      description: "Axis Istanbul, B2 Blok",
      details: "Street x12",
    ),
    AddressModel(
      title: "Office Address",
      description: "Mustafa St. No:2",
      details: "Street x12",
    ),
  ],
);
