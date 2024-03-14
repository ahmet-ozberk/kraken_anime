package com.example.kraken_anime.api

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object KrakenAnimeService {
    private val BASE_URL = "https://api.jikan.moe/v4/"

    val api: KrakenAnimeApi by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(KrakenAnimeApi::class.java)
    }
}