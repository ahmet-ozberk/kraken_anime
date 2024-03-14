package com.example.kraken_anime

import com.example.kraken_anime.api.KrakenAnimeApi
import com.example.kraken_anime.api.KrakenAnimeDataSource
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import okhttp3.Dispatcher

class MainActivity : FlutterActivity() {
    private val CHANNEL = "kraken_anime_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: Result ->
                if (call.method == "nativeMethod") {
                    val page = call.argument<String>("page")
                    var resultValue: String? = null
                    CoroutineScope(Dispatchers.IO).launch {
                        try {
                            val response = KrakenAnimeDataSource().getAnime(page!!)
                            resultValue = response.request().body.toString()
                        } catch (e: Exception) {
                            result.error("Error", e.message, e.localizedMessage)
                        }
                    }
                    result.success(resultValue)
                } else {
                    result.notImplemented()
                }
            }
    }
}
