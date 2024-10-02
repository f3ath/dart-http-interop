## [2.1.1] - 2024-10-01
### Changed
- Lowered the required version of `collection`

## [2.1.0] - 2024-08-18
### Added
- Message context
- Custom JSON encoding/decoding functions

## [2.0.1] - 2024-06-30
### Fixed
- Updated the docs and clarified the expectations for Hearders

## [2.0.0] - 2024-06-23
### Changed
- `Handler` is now just a typedef
- Dropped dependency on `http_parser`
- Most of the classes are now final

## [1.0.1] - 2023-11-11
### Changed
- Updated the README

## [1.0.0] - 2023-10-16
### Changed
- Request constructor signature
- Body constructors signature

### Removed
- Method class

## [0.8.1] - 2023-10-16
### Fixed
- Empty body should produce empty stream

## [0.8.0] - 2023-08-24
### Changed
- Split headers

### Removed
- LoggingHandler

## [0.7.1] - 2023-08-23
### Fixed
- Body bytes must be immutable
- Body.empty should produce a new stream instance every time

## [0.7.0] - 2023-08-20
### Changed
- Simplified interface

## [0.6.0] - 2023-08-16
### Changed
- Bump http to 1.1.0
- `Request`/`Response` constructor signatures

### Fixed
- Removed dependency on the `http` package

## [0.4.0] - 2023-05-07
### Changed
- Relaxed SDK version to 2.19

## [0.3.0] - 2023-05-07
### Added
- HttpMethod class

### Changed
- Request and Response signature

## [0.2.0] - 2023-05-06
### Added
- Binary messages support

## [0.1.0] - 2023-04-22
### Changed
- Add `Http` prefix

## [0.0.2] - 2023-04-17
### Added
- Export the `Headers` mixin

## [0.0.1] - 2023-04-16
### Added
- Initial release

[2.1.1]: https://github.com/f3ath/dart-http-interop/compare/2.1.0...2.1.1
[2.1.0]: https://github.com/f3ath/dart-http-interop/compare/2.0.1...2.1.0
[2.0.1]: https://github.com/f3ath/dart-http-interop/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/f3ath/dart-http-interop/compare/1.0.1...2.0.0
[1.0.1]: https://github.com/f3ath/dart-http-interop/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/f3ath/dart-http-interop/compare/0.8.1...1.0.0
[0.8.1]: https://github.com/f3ath/dart-http-interop/compare/0.8.0...0.8.1
[0.8.0]: https://github.com/f3ath/dart-http-interop/compare/0.7.1...0.8.0
[0.7.1]: https://github.com/f3ath/dart-http-interop/compare/0.7.0...0.7.1
[0.7.0]: https://github.com/f3ath/dart-http-interop/compare/0.6.0...0.7.0
[0.6.0]: https://github.com/f3ath/dart-http-interop/compare/0.4.0...0.6.0
[0.4.0]: https://github.com/f3ath/dart-http-interop/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/f3ath/dart-http-interop/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/f3ath/dart-http-interop/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/f3ath/dart-http-interop/compare/0.0.2...0.1.0
[0.0.2]: https://github.com/f3ath/dart-http-interop/compare/0.0.1...0.0.2
[0.0.1]: https://github.com/f3ath/dart-http-interop/releases/tag/0.0.1
