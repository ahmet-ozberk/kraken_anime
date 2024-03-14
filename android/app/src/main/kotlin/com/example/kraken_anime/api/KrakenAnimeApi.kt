package com.example.kraken_anime.api

import com.example.kraken_anime.model.KrakenAnimeModel
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query

interface KrakenAnimeApi {

    @GET("top/anime")
    suspend fun getAnime(@Query("page") page: String): KrakenAnimeModel

    @GET("anime/{id}/characters")
    suspend fun getAnimeCharacters(@Path("id") id: String): Map<String, Any>
}