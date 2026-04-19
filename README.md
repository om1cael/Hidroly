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
| | | |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/6f7bb9a9-d856-4edd-a4c4-8820d6b739e6" width="250" /> | <img src="https://github.com/user-attachments/assets/a2003a40-73f1-448f-ae43-fd0de0d42794" width="250" /> | <img src="https://github.com/user-attachments/assets/ba4b2637-f82d-4d94-be21-1117b3890da7" width="250" /> |
| <img src="https://github.com/user-attachments/assets/4bc9b66f-280e-45cd-ba8e-ffc673bce235" width="250" /> | <img src="https://github.com/user-attachments/assets/18ddecf2-83cf-4e34-95f7-e4e632ee17cd" width="250" /> | <img width="250" alt="6" src="https://github.com/user-attachments/assets/6c3069e8-e4e4-4206-93e8-2449e95d0a0c" /> |

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
