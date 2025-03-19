import 'package:dart_ipquery/dart_ipquery.dart';
import 'package:test/test.dart';

void main() {
  late IpQueryClient client;
  setUpAll(() {
    client = IpQueryClient();
  });

  test('queryIp', () async {
    final res = await client.queryIp("8.8.8.8");
    expect(res.ip, "8.8.8.8");
    expect(res.location, isNotNull);
  });

  test('queryOwnIp', () async {
    final myIp = await client.queryOwnIp();
    expect(myIp.length, greaterThan(0));
  });

  test('queryBulk', () async {
    final ips = await client.queryBulk(["8.8.8.8", "1.1.1.1"]);
    expect(ips.length, 2);
    expect(ips[0].ip, "8.8.8.8");
  });
}
