package com.example.kraken_anime.api

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface KrakenAnimeApi {

    @GET("/top/anime?page={page}")
    suspend fun getAnime(@Path("page") page:String): Call<String>
}