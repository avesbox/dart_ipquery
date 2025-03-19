import 'package:dart_ipquery/dart_ipquery.dart';

void main(List<String> arguments) async {
  final client = IpQueryClient();
  final res = await client.queryIp("8.8.8.8");
  print(res);
  final myIp = await client.queryOwnIp();
  print(myIp);
  final myIpQuery = await client.queryIp(myIp);
  print(myIpQuery);
  final ips = await client.queryBulk(["8.8.8.8", "1.1.1.1"]);
  print(ips);
}
