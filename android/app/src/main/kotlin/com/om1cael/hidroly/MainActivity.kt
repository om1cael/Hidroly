package com.om1cael.hidroly

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private val PRIVACY_POLICY_CHANNEL = "com.om1cael.hidroly/privacy-policy"
    private var privacyPolicyRequested = false

    private val ACTION_SHOW_RATIONALE = "androidx.health.ACTION_SHOW_PERMISSIONS_RATIONALE"
    private val ACTION_VIEW_USAGE = "android.intent.action.VIEW_PERMISSION_USAGE"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handlePrivacyPolicyRequested(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handlePrivacyPolicyRequested(intent)

        if (privacyPolicyRequested) {
            flutterEngine?.dartExecutor?.binaryMessenger?.let { messenger ->
                MethodChannel(messenger, PRIVACY_POLICY_CHANNEL)
                    .invokeMethod("onPrivacyPolicyRequested", null)
            }
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, PRIVACY_POLICY_CHANNEL).setMethodCallHandler {
            call, result ->
            if(call.method == "handlePrivacyPolicyRequested") {
                result.success(privacyPolicyRequested)
                privacyPolicyRequested = false
            } else {
                result.notImplemented()
            }
        }
  }

  private fun handlePrivacyPolicyRequested(intent: Intent?) {
    val action = intent?.action
    if(action == ACTION_SHOW_RATIONALE || action == ACTION_VIEW_USAGE) {
        privacyPolicyRequested = true
    }
  }
}
