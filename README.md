# Ruboty::Touban

Ruboty plug-in that tells someone the duty of the specified day.

## Installation

```ruby
# Gemfile
gem 'ruboty-touban'
```

## ENV

```
TOUBAN_GOOGLE_CLIENT_ID, 'Google Client ID for Touban'
TOUBAN_GOOGLE_CLIENT_SECRET, 'Google Client secret for Touban'
TOUBAN_GOOGLE_REDIRECT_URI, 'Google Redirect URI for Touban'
TOUBAN_GOOGLE_REFRESH_TOKEN, 'Google Refresh token issued with access token for Touban'
TOUBAN_SPREADSHEET_KEY, 'Google Spreadsheet key for Touban (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)'
```

## Usage

```
@ruboty touban today|tomorrow
```

## Todo

- [ ] Add spec
- [ ] Use GoogleDrive API V3 (google_drive 2.x)
- [ ] Support multiple spreadsheets

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hidakatsuya/ruboty-touban.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
