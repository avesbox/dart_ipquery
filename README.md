# dart_ipquery

A Dart library to query IP addresses using the [ipquery.io](https://ipquery.io) API. This library allows you to easily retrieve detailed information about IP addresses, including ISP data, geolocation details, and risk analysis.

## Features

- Query detailed information for a specific IP address.
- Fetch your own public IP address.
- Perform bulk queries for multiple IP addresses.
- Includes Pydantic models for easy data validation and parsing.

## Installation

Install the package using pub:

```bash
dart pub add dart_ipquery
```

## Usage

### Importing the Package

```dart
import 'package:dart_ipquery/dart_ipquery.dart';
```

### Query a Specific IP Address

Fetch information about a specific IP address:

```dart
import 'package:dart_ipquery/dart_ipquery.dart';

Future<void> main() async {
	final client = IpQueryCient();
	final ipInfo = await client.queryIp("8.8.8.8");
	print(ipInfo);
}
```

#### Example Output

```bash
IpInfo{ip: 8.8.8.8, ispInfo: null, location: Location{country: United States, countryCode: US, state: California, city: Mountain View, zipCode: 94043, lat: null, lon: null, timezone: America/Los_Angeles, localTime: 2025-03-19T19:11:46}, risk: Risk{isMobile: false, isVpn: false, isTor: false, isProxy: false, isDatacenter: true, riskScore: 0}}
```

### Fetch Your Own Public IP Address

Retrieve your machine's public IP address:

```dart
import 'package:dart_ipquery/dart_ipquery.dart';

Future<void> main() async {
	final client = IpQueryCient();
	final ip = await client.queryOwnIp();
	print(ip);
}
```

#### Example Output

```bash
203.0.113.45
```

### Bulk Query Multiple IP Addresses

Fetch details for multiple IP addresses in a single request:

```dart
Future<void> main() async {
	final ips = ["8.8.8.8", "1.1.1.1"];
	final client = IpQueryCient();
	final results = await client.queryBulk(ips);
	for (final ipInfo in results) {
		print(ipInfo);
	}
}
```

#### Example Output

```bash
IPInfo{ip: 8.8.8.8, ...}
IPInfo{ip: 1.1.1.1, ...}
```

## Running Tests

If you want to run tests to verify functionality:

```bash
dart test .
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
