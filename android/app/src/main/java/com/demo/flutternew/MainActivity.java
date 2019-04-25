package com.demo.flutternew;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterNativeView;
import io.flutter.view.FlutterView;
import static android.content.Context.BATTERY_SERVICE;
import android.view.WindowManager;
public class MainActivity extends FlutterActivity {
    private static final String EVENT_CHANNEL = "com.womai.flutter/receive";
    private static final String METHOD_CHANNEL = "com.womai.flutter/fetch";
    private String routeName = "";
    String data = "{\n" +
            "\t\"animals\":{\n" +
            "\t\"dog\":[\n" +
            "\t\t{\"name\":\"Rufus\",\"breed\":\"labrador\",\"count\":1,\"twoFeet\":false},\n" +
            "\t\t{\"name\":\"Marty\",\"breed\":\"whippet\",\"count\":1,\"twoFeet\":false}\n" +
            "\t],\n" +
            "\t\"cat\":{\"name\":\"Matilda\"}\n" +
            "}\n" +
            "}";

    @Override
    public FlutterView createFlutterView(Context context) {
        WindowManager.LayoutParams matchParent = new WindowManager.LayoutParams(-1, -1);
        FlutterNativeView nativeView = this.createFlutterNativeView();
        FlutterView flutterView = new FlutterView(this,  null, nativeView);
        flutterView.setInitialRoute(routeName);
        flutterView.setLayoutParams(matchParent);
        this.setContentView(flutterView);
        return flutterView;
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        routeName = "demo?{\"id\":112233}";
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        native2Dart();
        responseDart();
    }

    /**
     * native data to  dart
     */
    private void native2Dart() {
        /**
         * 数据流的通信（event streams）
         */
        EventChannel eventChannel = new EventChannel(getFlutterView(), EVENT_CHANNEL);
        EventChannel.StreamHandler streamHandler = new EventChannel.StreamHandler() {

            @Override
            public void onListen(Object arguments, EventSink eventSink) {
                Log.e("plateform_channel", "arguments: " + arguments.toString());
                eventSink.success(data);
            }

            @Override
            public void onCancel(Object arguments) {
                Log.e("plateform_channel", "arguments: " + arguments.toString());
            }
        };
        eventChannel.setStreamHandler(streamHandler);
    }

    private void responseDart() {
        MethodChannel methodChannel = new MethodChannel(getFlutterView(), METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, Result result) {
                if (methodCall.method.equals("customMethodName")) {
                    result.success(data);
                } else {
                    result.notImplemented();
                }
            }
        });
    }
}