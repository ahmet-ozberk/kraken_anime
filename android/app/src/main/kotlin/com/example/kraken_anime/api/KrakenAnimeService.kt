package com.example.kraken_anime.api

import retrofit2.Retrofit

object KrakenAnimeService {
    private val BASE_URL = "https://api.jikan.moe/v4"

    val api: KrakenAnimeApi by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .build()
            .create(KrakenAnimeApi::class.java)
    }
}