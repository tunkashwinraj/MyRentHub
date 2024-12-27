class LandModel {
  String? description;
  String? title;
  String? littledescrption;
  String? selectedOption;
  String? selectedrealestate;
  String? picture;
  String? doc;


  LandModel({
    this.title,
    this.littledescrption,
    this.description,
    this.selectedOption,
    this.selectedrealestate,
    this.picture,
    this.doc,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "littledescrption": this.littledescrption,
      "description": this.description,
      "selectedOption": this.selectedOption,
      "selectedrealestate": this.selectedrealestate,
      "picture": this.picture,
      "doc": this.doc,
    };
  }

  factory LandModel.fromJson(Map<String, dynamic> json) {
    return LandModel(
      title: json["title"] ?? "",
      littledescrption: json["littledescrption"] ?? "",
      description: json["description"] ?? "",
      selectedOption: json["selectedOption"] ?? "",
      selectedrealestate: json["selectedrealestate"] ?? "",
      picture: json["picture"] ?? "",
      doc: json["doc"] ?? "",

    );
  }
}
