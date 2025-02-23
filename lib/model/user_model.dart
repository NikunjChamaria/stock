class UserModel {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  String? investorType;
  String? fcmToken;
  int? mobileNo;
  String? city;
  String? state;
  int? zipCode;
  int? resetPasswordOtp;
  String? deletedAt;
  String? externalProfilePictureUrl;
  String? addressLine1;
  String? addressLine2;
  String? fullName;
  dynamic ibkrOnboardingFinished;
  dynamic guidedInvestingFinished;
  dynamic customiseClimatePortfolio;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      this.investorType,
      this.fcmToken,
      this.mobileNo,
      this.city,
      this.state,
      this.zipCode,
      this.resetPasswordOtp,
      this.deletedAt,
      this.externalProfilePictureUrl,
      this.addressLine1,
      this.addressLine2,
      this.fullName,
      this.ibkrOnboardingFinished,
      this.guidedInvestingFinished,
      this.customiseClimatePortfolio});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    investorType = json['investor_type'];
    fcmToken = json['fcm_token'];
    mobileNo = json['mobile_no'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    resetPasswordOtp = json['reset_password_otp'];
    deletedAt = json['deleted_at'];
    externalProfilePictureUrl = json['external_profile_picture_url'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    fullName = json['full_name'];
    ibkrOnboardingFinished = json['ibkr_onboarding_finished'];
    guidedInvestingFinished = json['guided_investing_finished'];
    customiseClimatePortfolio = json['customise_climate_portfolio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['provider'] = provider;
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['investor_type'] = investorType;
    data['fcm_token'] = fcmToken;
    data['mobile_no'] = mobileNo;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['reset_password_otp'] = resetPasswordOtp;
    data['deleted_at'] = deletedAt;
    data['external_profile_picture_url'] = externalProfilePictureUrl;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['full_name'] = fullName;
    data['ibkr_onboarding_finished'] = ibkrOnboardingFinished;
    data['guided_investing_finished'] = guidedInvestingFinished;
    data['customise_climate_portfolio'] = customiseClimatePortfolio;
    return data;
  }
}
