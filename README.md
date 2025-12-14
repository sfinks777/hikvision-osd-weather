# hikvision-osd-weather

A utility for setting the On-Screen Display (OSD) text with weather forecast for Hikvision IP cameras.

## Overview

Sometimes we need to set some mutable text to cameras OSD. This is working example of it.
Script tested on Hikvision DS-2DE4425IW-DE camera.

## Features

- Updates camera OSD
- Compatible with Hikvision IP cameras supporting ISAPI.
- Command-line interface for simplicity.

## Requirements

- Bash
- Curl
- ansiweather

## Installation

Install [ansiweather](https://github.com/fcambus/ansiweather):

```bash
sudo apt-get install ansiweather
```

Clone the repository and install dependencies:

```bash
git clone https://github.com/sfinks777/hikvision-osd-weather.git
cd hikvision-osd-weather
```

Create a `.secrets` with the `HIK_USER` and `HIK_PASS` environment variables.

Update `.settings` with `WEATHER_LOCATION` paramener.

## Usage

```bash
bash ./setOverlayWeather.sh
```

## Security Notes

- **Never expose camera credentials to the public internet.**
- Store credentials securely and use strong passwords.
- The tool uses HTTP Digest Auth to communicate with cameras, which isn't great, but is (slightly) better than HTTP Basic Auth.

## Limitations

- Only tested with Hikvision cameras supporting ISAPI.
- Some camera firmware versions might not support OSD updates via API.
- This tool only updates the OSD overlay with weather forecast.

## Troubleshooting

- Ensure your user account has permission to configure OSD settings.
- Camera and host running this utility must be on the same network or have proper routing.
- You have access to Internet for getting weather forecast.

## License

[MIT License](LICENSE)

## Author(s)

[sfinks777](https://github.com/na4ma4)

Thanks to [na4ma4](https://github.com/na4ma4) for [base sources](https://github.com/na4ma4/hikvision-osd-ntp).

## Contributions

Feel free to open issues or pull requests for improvements or bug fixes.
