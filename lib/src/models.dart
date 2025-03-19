/// Model for the Isp Information returned by the API
class IspInfo {
  /// The ISP of the IP address
  final String? isp;

  /// The organization of the IP address
  final String? organization;

  /// The ASN of the IP address
  final String? asn;

  /// The [IspInfo] constructor is used to create a new instance of the [IspInfo] class.
  const IspInfo({this.isp, this.organization, this.asn});

  /// The [IspInfo.fromJson] factory constructor is used to create a new instance of the [IspInfo] class from a JSON object.
  factory IspInfo.fromJson(Map<String, dynamic> json) {
    return IspInfo(
      isp: json['isp'],
      organization: json['org'],
      asn: json['asn'],
    );
  }

  @override
  String toString() {
    return 'IspInfo{isp: $isp, organization: $organization, asn: $asn}';
  }
}

/// Model for the Location Information returned by the API
class Location {
  /// The country of the IP address
  final String? country;

  /// The country code of the IP address
  final String? countryCode;

  /// The state of the IP address
  final String? state;

  /// The city of the IP address
  final String? city;

  /// The zip code of the IP address
  final String? zipCode;

  /// The latitude of the IP address
  final double? lat;

  /// The longitude of the IP address
  final double? lon;

  /// The timezone of the IP address
  final String? timezone;

  /// The local time of the IP address
  final String? localTime;

  /// The [Location] constructor is used to create a new instance of the [Location] class.
  const Location({
    this.country,
    this.countryCode,
    this.state,
    this.city,
    this.zipCode,
    this.lat,
    this.lon,
    this.timezone,
    this.localTime,
  });

  /// The [Location.fromJson] factory constructor is used to create a new instance of the [Location] class from a JSON object.
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      countryCode: json['country_code'],
      state: json['state'],
      city: json['city'],
      zipCode: json['zipcode'],
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      localTime: json['localtime'],
    );
  }

  @override
  String toString() {
    return 'Location{country: $country, countryCode: $countryCode, state: $state, city: $city, zipCode: $zipCode, lat: $lat, lon: $lon, timezone: $timezone, localTime: $localTime}';
  }
}

/// Model for the Risk Information returned by the API
class Risk {
  /// Whether the IP address is mobile
  final bool? isMobile;

  /// Whether the IP address is a VPN
  final bool? isVpn;

  /// Whether the IP address is a Tor node
  final bool? isTor;

  /// Whether the IP address is a proxy
  final bool? isProxy;

  /// Whether the IP address is a datacenter
  final bool? isDatacenter;

  /// The risk score of the IP address
  final int? riskScore;

  /// The [Risk] constructor is used to create a new instance of the [Risk] class.
  const Risk({
    required this.isMobile,
    required this.isVpn,
    required this.isTor,
    required this.isProxy,
    required this.isDatacenter,
    required this.riskScore,
  });

  /// The [Risk.fromJson] factory constructor is used to create a new instance of the [Risk] class from a JSON object.
  factory Risk.fromJson(Map<String, dynamic> json) {
    return Risk(
      isMobile: json['is_mobile'],
      isVpn: json['is_vpn'],
      isTor: json['is_tor'],
      isProxy: json['is_proxy'],
      isDatacenter: json['is_datacenter'],
      riskScore: json['risk_score'],
    );
  }

  @override
  String toString() {
    return 'Risk{isMobile: $isMobile, isVpn: $isVpn, isTor: $isTor, isProxy: $isProxy, isDatacenter: $isDatacenter, riskScore: $riskScore}';
  }
}

/// Model for the IP Information returned by the API
class IpInfo {
  /// The IP address
  final String ip;

  /// The ISP information of the IP address
  final IspInfo? ispInfo;

  /// The location information of the IP address
  final Location? location;

  /// The risk information of the IP address
  final Risk? risk;

  /// The [IpInfo] constructor is used to create a new instance of the [IpInfo] class.
  const IpInfo({
    required this.ip,
    this.ispInfo,
    this.location,
    this.risk,
  });

  /// The [IpInfo.fromJson] factory constructor is used to create a new instance of the [IpInfo] class from a JSON object.
  factory IpInfo.fromJson(Map<String, dynamic> json) {
    return IpInfo(
      ip: json['ip'],
      ispInfo:
          json['isp_info'] != null ? IspInfo.fromJson(json['isp_info']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      risk: json['risk'] != null ? Risk.fromJson(json['risk']) : null,
    );
  }

  @override
  String toString() {
    return 'IpInfo{ip: $ip, ispInfo: $ispInfo, location: $location, risk: $risk}';
  }
}
