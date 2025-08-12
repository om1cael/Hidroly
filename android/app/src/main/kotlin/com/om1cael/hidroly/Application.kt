import io.flutter.app.FlutterApplication

import dev.fluttercommunity.workmanager.WorkmanagerDebug
import dev.fluttercommunity.workmanager.LoggingDebugHandler

class Application : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        WorkmanagerDebug.setCurrent(LoggingDebugHandler())
    }
}