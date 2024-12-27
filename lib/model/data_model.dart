class DataModel {
  String companyName;
  List<String> imageURLs;
  String littleDescription;
  String phoneNumber;
  String rent;
  String selectedElectronics;
  String selectHomeAppliances;
  String selectToolsEquipment;
  String selectVehicle;
  String selectedOption;
  String selectedRealEstateOption;
  String selectedSubOption;
  String title;
  String userEmail;

  DataModel({
    required this.companyName,
    required this.imageURLs,
    required this.littleDescription,
    required this.phoneNumber,
    required this.rent,
    required this.selectedElectronics,
    required this.selectHomeAppliances,
    required this.selectToolsEquipment,
    required this.selectVehicle,
    required this.selectedOption,
    required this.selectedRealEstateOption,
    required this.selectedSubOption,
    required this.title,
    required this.userEmail,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      companyName: json['companyName'] ?? '',
      imageURLs: List<String>.from(json['imageURLs'] ?? []),
      littleDescription: json['littledescription'] ?? '',
      phoneNumber: json['phoneno'] ?? '',
      rent: json['rent'] ?? '',
      selectedElectronics: json['selectElectronics'] ?? '',
      selectHomeAppliances: json['selectHomeAppliences'] ?? '',
      selectToolsEquipment: json['selectToolsEquipment'] ?? '',
      selectVehicle: json['selectVachicle'] ?? '',
      selectedOption: json['selectedOption'] ?? '',
      selectedRealEstateOption: json['selectedRealEstateOption'] ?? '',
      selectedSubOption: json['selectedSubOption'] ?? '',
      title: json['title'] ?? '',
      userEmail: json['userEmail'] ?? '',
    );
  }


}
