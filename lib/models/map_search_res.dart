class MapSearchResponseModel {
  String? type;
  List<Features>? features;
  String? attribution;

  MapSearchResponseModel({this.type, this.features, this.attribution});

  MapSearchResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
    attribution = json['attribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    data['attribution'] = this.attribution;
    return data;
  }
}

class Features {
  String? type;
  String? id;
  Geometry? geometry;
  Properties? properties;

  Features({this.type, this.id, this.geometry, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Properties {
  String? mapboxId;
  String? featureType;
  String? fullAddress;
  String? name;
  String? namePreferred;
  Coordinates? coordinates;
  String? placeFormatted;
  List<double>? bbox;
  Context? context;

  Properties(
      {this.mapboxId,
      this.featureType,
      this.fullAddress,
      this.name,
      this.namePreferred,
      this.coordinates,
      this.placeFormatted,
      this.bbox,
      this.context});

  Properties.fromJson(Map<String, dynamic> json) {
    mapboxId = json['mapbox_id'];
    featureType = json['feature_type'];
    fullAddress = json['full_address'];
    name = json['name'];
    namePreferred = json['name_preferred'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    placeFormatted = json['place_formatted'];
    bbox = json['bbox'].cast<double>();
    context =
        json['context'] != null ? new Context.fromJson(json['context']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapbox_id'] = this.mapboxId;
    data['feature_type'] = this.featureType;
    data['full_address'] = this.fullAddress;
    data['name'] = this.name;
    data['name_preferred'] = this.namePreferred;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['place_formatted'] = this.placeFormatted;
    data['bbox'] = this.bbox;
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? longitude;
  double? latitude;

  Coordinates({this.longitude, this.latitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Context {
  Place? place;
  Place? district;
  Region? region;
  Country? country;
  Place? locality;
  Street? street;
  Street? postcode;

  Context(
      {this.place,
      this.district,
      this.region,
      this.country,
      this.locality,
      this.street,
      this.postcode});

  Context.fromJson(Map<String, dynamic> json) {
    place = json['place'] != null ? new Place.fromJson(json['place']) : null;
    district =
        json['district'] != null ? new Place.fromJson(json['district']) : null;
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    locality =
        json['locality'] != null ? new Place.fromJson(json['locality']) : null;
    street =
        json['street'] != null ? new Street.fromJson(json['street']) : null;
    postcode =
        json['postcode'] != null ? new Street.fromJson(json['postcode']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.place != null) {
      data['place'] = this.place!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.locality != null) {
      data['locality'] = this.locality!.toJson();
    }
    if (this.street != null) {
      data['street'] = this.street!.toJson();
    }
    if (this.postcode != null) {
      data['postcode'] = this.postcode!.toJson();
    }
    return data;
  }
}

class Place {
  String? mapboxId;
  String? name;
  String? wikidataId;

  Place({this.mapboxId, this.name, this.wikidataId});

  Place.fromJson(Map<String, dynamic> json) {
    mapboxId = json['mapbox_id'];
    name = json['name'];
    wikidataId = json['wikidata_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapbox_id'] = this.mapboxId;
    data['name'] = this.name;
    data['wikidata_id'] = this.wikidataId;
    return data;
  }
}

class Region {
  String? mapboxId;
  String? name;
  String? wikidataId;
  String? regionCode;
  String? regionCodeFull;

  Region(
      {this.mapboxId,
      this.name,
      this.wikidataId,
      this.regionCode,
      this.regionCodeFull});

  Region.fromJson(Map<String, dynamic> json) {
    mapboxId = json['mapbox_id'];
    name = json['name'];
    wikidataId = json['wikidata_id'];
    regionCode = json['region_code'];
    regionCodeFull = json['region_code_full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapbox_id'] = this.mapboxId;
    data['name'] = this.name;
    data['wikidata_id'] = this.wikidataId;
    data['region_code'] = this.regionCode;
    data['region_code_full'] = this.regionCodeFull;
    return data;
  }
}

class Country {
  String? mapboxId;
  String? name;
  String? wikidataId;
  String? countryCode;
  String? countryCodeAlpha3;

  Country(
      {this.mapboxId,
      this.name,
      this.wikidataId,
      this.countryCode,
      this.countryCodeAlpha3});

  Country.fromJson(Map<String, dynamic> json) {
    mapboxId = json['mapbox_id'];
    name = json['name'];
    wikidataId = json['wikidata_id'];
    countryCode = json['country_code'];
    countryCodeAlpha3 = json['country_code_alpha_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapbox_id'] = this.mapboxId;
    data['name'] = this.name;
    data['wikidata_id'] = this.wikidataId;
    data['country_code'] = this.countryCode;
    data['country_code_alpha_3'] = this.countryCodeAlpha3;
    return data;
  }
}

class Street {
  String? mapboxId;
  String? name;

  Street({this.mapboxId, this.name});

  Street.fromJson(Map<String, dynamic> json) {
    mapboxId = json['mapbox_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapbox_id'] = this.mapboxId;
    data['name'] = this.name;
    return data;
  }
}
