package id.flutter.flutter_{{ service_name.snakeCase() }}_background_service;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import androidx.core.content.ContextCompat;


public class {{ service_name.pascalCase() }}BootReceiver extends BroadcastReceiver {
    @SuppressLint("WakelockTimeout")
    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals(Intent.ACTION_BOOT_COMPLETED) || intent.getAction().equals("android.intent.action.QUICKBOOT_POWERON")) {
            final {{ service_name.pascalCase() }}Config config = new {{ service_name.pascalCase() }}Config(context);
            boolean autoStart = config.isAutoStartOnBoot();
            if (autoStart) {
                if ({{ service_name.pascalCase() }}BackgroundService.lockStatic == null) {
                    {{ service_name.pascalCase() }}BackgroundService.getLock(context).acquire();
                }

                if (config.isForeground()) {
                    ContextCompat.startForegroundService(context, new Intent(context, {{ service_name.pascalCase() }}BackgroundService.class));
                } else {
                    context.startService(new Intent(context, {{ service_name.pascalCase() }}BackgroundService.class));
                }
            }
        }
    }
}
