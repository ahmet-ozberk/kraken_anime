package com.example.kraken_anime

import com.example.kraken_anime.api.KrakenAnimeDataSource
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking
import io.flutter.plugin.common.MethodChannel.Result


class MainActivity: FlutterActivity() {
    private val CHANNEL = "kraken_anime_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: Result ->
                if (call.method == "nativeMethod") {
                    val page = call.argument<String>("page")
                    runBlocking {
                        try {
                            val dataSource = KrakenAnimeDataSource()
                            val response = dataSource.getAnime(page ?: "1")
                            val parseValue = Gson().toJson(response)
                            result.success(parseValue)
                        } catch (e: Exception) {
                            result.error("Error 'nativeMethod' page: $page", e.message, e.localizedMessage)
                        }
                    }
                } else if(call.method == "animeDetailMethod"){
                    val id = call.argument<String>("id")
                    runBlocking {
                        try {
                            val dataSource = KrakenAnimeDataSource()
                            val response = dataSource.getAnimeCharacters(id ?: "0")
                            val parseValue = Gson().toJson(response)
                            result.success(parseValue)
                        } catch (e: Exception) {
                            result.error("Error 'animeDetailMethod' id: $id", e.message, e.localizedMessage)
                        }
                    }
                } else {
                    result.notImplemented()
                }
            }
    }
}
