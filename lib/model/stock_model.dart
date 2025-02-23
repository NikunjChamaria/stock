class StockModel {
  int? id;
  String? name;
  String? symbol;
  String? createdAt;
  String? updatedAt;
  String? alpacaId;
  String? exchange;
  String? description;
  String? assetType;
  String? isin;
  String? industry;
  String? sector;
  int? employees;
  String? website;
  String? address;
  String? netZeroProgress;
  dynamic carbonIntensityScope3;
  dynamic carbonIntensityScope1And2;
  dynamic carbonIntensityScope1And2And3;
  String? tempAlignmentScopes1And2;
  bool? dnshAssessmentPass;
  bool? goodGovernanceAssessment;
  bool? contributeToEnvironmentOrSocialObjective;
  bool? sustainableInvestment;
  dynamic scope1Emissions;
  dynamic scope2Emissions;
  dynamic scope3Emissions;
  dynamic totalEmissions;
  String? listingDate;
  String? marketCap;
  int? ibkrConnectionId;
  CustomImage? image;
  dynamic createdBy;
  dynamic updatedBy;

  StockModel(
      {this.id,
      this.name,
      this.symbol,
      this.createdAt,
      this.updatedAt,
      this.alpacaId,
      this.exchange,
      this.description,
      this.assetType,
      this.isin,
      this.industry,
      this.sector,
      this.employees,
      this.website,
      this.address,
      this.netZeroProgress,
      this.carbonIntensityScope3,
      this.carbonIntensityScope1And2,
      this.carbonIntensityScope1And2And3,
      this.tempAlignmentScopes1And2,
      this.dnshAssessmentPass,
      this.goodGovernanceAssessment,
      this.contributeToEnvironmentOrSocialObjective,
      this.sustainableInvestment,
      this.scope1Emissions,
      this.scope2Emissions,
      this.scope3Emissions,
      this.totalEmissions,
      this.listingDate,
      this.marketCap,
      this.ibkrConnectionId,
      this.image,
      this.createdBy,
      this.updatedBy});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    alpacaId = json['alpaca_id'];
    exchange = json['exchange'];
    description = json['description'];
    assetType = json['asset_type'];
    isin = json['isin'];
    industry = json['industry'];
    sector = json['sector'];
    employees = json['employees'];
    website = json['website'];
    address = json['address'];
    netZeroProgress = json['net_zero_progress'];
    carbonIntensityScope3 = json['carbon_intensity_scope_3'];
    carbonIntensityScope1And2 = json['carbon_intensity_scope_1_and_2'];
    carbonIntensityScope1And2And3 =
        json['carbon_intensity_scope_1_and_2_and_3'];
    tempAlignmentScopes1And2 = json['temp_alignment_scopes_1_and_2'];
    dnshAssessmentPass = json['dnsh_assessment_pass'];
    goodGovernanceAssessment = json['good_governance_assessment'];
    contributeToEnvironmentOrSocialObjective =
        json['contribute_to_environment_or_social_objective'];
    sustainableInvestment = json['sustainable_investment'];
    scope1Emissions = json['scope_1_emissions'] ?? 0.toDouble();
    scope2Emissions = json['scope_2_emissions'] ?? 0.toDouble();
    scope3Emissions = json['scope_3_emissions'] ?? 0.toDouble();
    totalEmissions = json['total_emissions'];
    listingDate = json['listing_date'];
    marketCap = json['market_cap'];
    ibkrConnectionId = json['ibkr_connection_id'];
    image = json['image'] != null ? CustomImage.fromJson(json['image']) : null;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['alpaca_id'] = alpacaId;
    data['exchange'] = exchange;
    data['description'] = description;
    data['asset_type'] = assetType;
    data['isin'] = isin;
    data['industry'] = industry;
    data['sector'] = sector;
    data['employees'] = employees;
    data['website'] = website;
    data['address'] = address;
    data['net_zero_progress'] = netZeroProgress;
    data['carbon_intensity_scope_3'] = carbonIntensityScope3;
    data['carbon_intensity_scope_1_and_2'] = carbonIntensityScope1And2;
    data['carbon_intensity_scope_1_and_2_and_3'] =
        carbonIntensityScope1And2And3;
    data['temp_alignment_scopes_1_and_2'] = tempAlignmentScopes1And2;
    data['dnsh_assessment_pass'] = dnshAssessmentPass;
    data['good_governance_assessment'] = goodGovernanceAssessment;
    data['contribute_to_environment_or_social_objective'] =
        contributeToEnvironmentOrSocialObjective;
    data['sustainable_investment'] = sustainableInvestment;
    data['scope_1_emissions'] = scope1Emissions;
    data['scope_2_emissions'] = scope2Emissions;
    data['scope_3_emissions'] = scope3Emissions;
    data['total_emissions'] = totalEmissions;
    data['listing_date'] = listingDate;
    data['market_cap'] = marketCap;
    data['ibkr_connection_id'] = ibkrConnectionId;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class CustomImage {
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  dynamic formats;
  String? hash;
  String? ext;
  String? mime;
  dynamic size;
  String? url;
  String? previewUrl;
  String? provider;
  dynamic providerMetadata;
  String? folderPath;
  String? createdAt;
  String? updatedAt;

  CustomImage(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.folderPath,
      this.createdAt,
      this.updatedAt});

  CustomImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    folderPath = json['folderPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternativeText'] = alternativeText;
    data['caption'] = caption;
    data['width'] = width;
    data['height'] = height;
    data['formats'] = formats;
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['previewUrl'] = previewUrl;
    data['provider'] = provider;
    data['provider_metadata'] = providerMetadata;
    data['folderPath'] = folderPath;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
