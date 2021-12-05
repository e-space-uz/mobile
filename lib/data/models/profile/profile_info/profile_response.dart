class ProfileResponse {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? phoneNumber;
  String? userType;
  String? middleName;
  String? fullName;
  String? nationality;
  String? permanentAddress;
  String? passportNumber;
  String? passportIssueDate;
  String? passportExpiryDate;
  String? passportIssuePlace;
  String? pin;
  String? email;
  String? birthDate;
  String? birthPlace;
  String? citizenship;
  String? login;
  String? createdAt;
  String? updatedAt;

  ProfileResponse(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.phoneNumber,
        this.userType,
        this.middleName,
        this.fullName,
        this.nationality,
        this.permanentAddress,
        this.passportNumber,
        this.passportIssueDate,
        this.passportExpiryDate,
        this.passportIssuePlace,
        this.pin,
        this.email,
        this.birthDate,
        this.birthPlace,
        this.citizenship,
        this.login,
        this.createdAt,
        this.updatedAt});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    userType = json['user_type'];
    middleName = json['middle_name'];
    fullName = json['full_name'];
    nationality = json['nationality'];
    permanentAddress = json['permanent_address'];
    passportNumber = json['passport_number'];
    passportIssueDate = json['passport_issue_date'];
    passportExpiryDate = json['passport_expiry_date'];
    passportIssuePlace = json['passport_issue_place'];
    pin = json['pin'];
    email = json['email'];
    birthDate = json['birth_date'];
    birthPlace = json['birth_place'];
    citizenship = json['citizenship'];
    login = json['login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['user_type'] = this.userType;
    data['middle_name'] = this.middleName;
    data['full_name'] = this.fullName;
    data['nationality'] = this.nationality;
    data['permanent_address'] = this.permanentAddress;
    data['passport_number'] = this.passportNumber;
    data['passport_issue_date'] = this.passportIssueDate;
    data['passport_expiry_date'] = this.passportExpiryDate;
    data['passport_issue_place'] = this.passportIssuePlace;
    data['pin'] = this.pin;
    data['email'] = this.email;
    data['birth_date'] = this.birthDate;
    data['birth_place'] = this.birthPlace;
    data['citizenship'] = this.citizenship;
    data['login'] = this.login;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
