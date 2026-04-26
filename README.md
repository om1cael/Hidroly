<h1 align="center">Hidroly</h1>
<p align="center">Hidroly is a health application that helps you track and manage your water intake.</p>
<div align="center">
  <img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/om1cael/Hidroly/merge_sentinel.yaml?label=Merge%20Sentinel">
  <img alt="GitHub Sponsors" src="https://img.shields.io/github/sponsors/om1cael">
  <img alt="Latest Release" src="https://img.shields.io/github/v/release/om1cael/hidroly">
  <img alt="GPL-3.0 license" src="https://img.shields.io/github/license/om1cael/hidroly">
</div>

## Table of Contents
<ul>
  <li><a href="#screenshots">Screenshots</a></li>
  <li><a href="#features">Features</a></li>
  <li><a href="#getting-started">Getting Started</a></li>
  <li><a href="#license">License</a></li>
</ul>

## Screenshots
| <img src="./metadata/en-US/images/phoneScreenshots/1.png" />        | <img src="./metadata/en-US/images/phoneScreenshots/2.png" />     | <img src="./metadata/en-US/images/phoneScreenshots/3.png" />        |
|----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| <img src="./metadata/en-US/images/phoneScreenshots/4.png" />      | <img src="./metadata/en-US/images/phoneScreenshots/5.png" /> | <img src="./metadata/en-US/images/phoneScreenshots/6.png" />

## Features
* 💧 **Smart Hydration Tracking**: Intelligent daily goals based on your profile.
* 📈 **Summary**: Weekly, monthly and yearly chart, total intake, average intake and streak indicators.
* 🌍 **Unit System Support**: Switch between the Metric and Imperial systems.
* ⚡ **Offline**: Fast perfomance, with the bonus of no data being sent over the Internet.

## Getting Started
You'll need at least 8GB (16 recommended) of RAM to build and run this project.

```
# Clone the repository
git clone https://github.com/om1cael/hidroly.git

# Install dependencies
flutter pub get

# Generate code (Drift/Riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

## License
This project is licensed under [GPL-3.0](LICENSE).
