import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Last updated: September 8, 2026"),
              InkWell(
                child: Row(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  spacing: 4,
                  children: [
                    Text(
                      "View all updates here",
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Icon(Icons.open_in_new, size: 12,)
                  ],
                ),
                onTap: () => launchUrl(
                  Uri.https("github.com", "/om1cael/Hidroly/commits/main/PRIVACY.md")
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '''
Hidroly is built as an open source app. This service is provided at no cost and is intended for use as is.

1. Data Collection and Usage
Hidroly does not collect or transmit personal data to the developer or any third parties. Information provided by the user—such as weight, age, and water intake records—is stored locally on the user's device using an internal database.

Hidroly may optionally integrate with Android Health Connect to read and/or write hydration data using only the HydrationRecord data type. This integration is entirely optional and is only used when the user explicitly grants the relevant Health Connect permission.

Health Connect data accessed by Hidroly is processed locally on the user's device and is not transmitted to Hidroly's servers, the developer, or any third parties. Hidroly does not use Health Connect data for advertising, analytics, profiling, or any purpose unrelated to the app's hydration functionality.

Hidroly only accesses the HydrationRecord type through Health Connect and does not request or access other Health Connect data types.

2. Permissions
The app may request certain permissions to function correctly:
* Notifications: To send hydration reminders.
* Health Connect: Optional permission to read and/or write hydration information using the HydrationRecord data type. This permission is only requested if the user chooses to use the Health Connect integration.

Health Connect permissions can be managed or revoked by the user through Android's Health Connect settings.

3. Third-Party Services
The app does not use any third-party analytics, tracking, or advertising SDKs. There are no hidden cookies or tracking identifiers.

Hidroly's optional integration with Android Health Connect is used solely to provide hydration-related functionality. Hidroly does not sell, share, or transfer Health Connect data to third parties.

4. Open Source
As an open-source project, our source code is available for public audit to ensure transparency and security.

5. Changes to This Policy
We may update our Privacy Policy from time to time. These changes will typically reflect new app features or changes to supported integrations.

6. Contact
If you have any questions, feel free to open an issue on our official repository.
          '''
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}