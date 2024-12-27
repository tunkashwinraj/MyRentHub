class OffersModel {
  String? description;
  String? title;
  String? littledescrption;
  String? selectedOption;
  String? selectedrealestate;
  String? imageUrl;
  String? doc;
  String? companyName; // New text field
  String? phoneno; // New number field 1
  String? rent; // New number field 2

  OffersModel({
    this.title,
    this.littledescrption,
    this.description,
    this.selectedOption,
    this.selectedrealestate,
    this.imageUrl,
    this.doc,
    this.companyName,
    this.phoneno,
    this.rent,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "littledescrption": this.littledescrption,
      "description": this.description,
      "selectedOption": this.selectedOption,
      "selectedrealestate": this.selectedrealestate,
      "imageUrl": this.imageUrl,
      "doc": this.doc,
      "companyName": this.companyName,
      "phoneno": this.phoneno,
      "rent": this.rent,
    };
  }

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
      title: json["title"] ?? "",
      littledescrption: json["littledescription"] ?? "",
      description: json["description"] ?? "",
      selectedOption: json["selectedOption"] ?? "",
      selectedrealestate: json["selectedrealestate"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      doc: json["doc"] ?? "",
      companyName: json["companyName"] ?? "",
      phoneno: json["phoneno"] ?? 0,
      rent: json["rent"] ?? 0,
    );
  }
}
