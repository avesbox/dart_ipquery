import 'dart:convert';
import 'dart:io';

import 'models.dart';

/// The base URL of the IPQuery API.
const baseUrl = "https://api.ipquery.io/";

/// The [IpQueryClient] class is used to query the IPQuery API.
class IpQueryClient {
  String? _proxy;

  /// The [HttpClient] instance used to make requests.
  final client = HttpClient();

  /// The [IpQueryClient] constructor is used to create a new instance of the [IpQueryClient] class.
  IpQueryClient({String? proxy}) {
    if (proxy == null) {
      final envProxy = String.fromEnvironment('https_proxy');
      _proxy = envProxy.isEmpty ? null : envProxy;
    }
    if (_proxy != null) {
      client.findProxy = (uri) {
        return "PROXY $_proxy";
      };
    }
  }

  /// The [queryIp] method is used to query the IPQuery API for a single IP.
  Future<IpInfo> queryIp(String ip) async {
    final uri = Uri.parse(baseUrl + ip);
    final request = await client.getUrl(uri);
    final response = await request.close();
    if (response.statusCode >= 400) {
      throw HttpException("Failed to query IP: ${response.statusCode}");
    }
    final body = await response.transform(utf8.decoder).join();
    final json = jsonDecode(body);
    return IpInfo.fromJson(json);
  }

  /// The [queryBulk] method is used to query the IPQuery API for multiple IPs.
  Future<List<IpInfo>> queryBulk(List<String> ips) async {
    final uri = Uri.parse(baseUrl + ips.join(","));
    final request = await client.getUrl(uri);
    final response = await request.close();
    if (response.statusCode >= 400) {
      throw HttpException("Failed to query IPs: ${response.statusCode}");
    }
    final body = await response.transform(utf8.decoder).join();
    final json = jsonDecode(body);
    return (json as List).map((e) => IpInfo.fromJson(e)).toList();
  }

  /// The [queryOwnIp] method is used to query the IPQuery API for the own IP.
  Future<String> queryOwnIp() async {
    final uri = Uri.parse(baseUrl);
    final request = await client.getUrl(uri);
    final response = await request.close();
    if (response.statusCode >= 400) {
      throw HttpException("Failed to query own IP: ${response.statusCode}");
    }
    final body = await response.transform(utf8.decoder).join();
    return body;
  }
}
