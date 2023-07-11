package com.example.flutter_lab

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)


        //message channel........
        val channel = BasicMessageChannel<String>(flutterEngine.dartExecutor, "myMessageChannel", StringCodec.INSTANCE)
        channel.setMessageHandler { message, reply ->
            Log.d("msg","recieve: $message")
            reply.reply("Reply from Android")
            channel.send("Hello from Android"){ reply ->
                Log.d("msg","reply: $reply")
            }
        }
    }
}
