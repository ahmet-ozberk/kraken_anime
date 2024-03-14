package com.example.kraken_anime.api

import com.example.kraken_anime.model.KrakenAnimeModel

class KrakenAnimeDataSource() {
    private var dao:KrakenAnimeApi = KrakenAnimeService.api
    suspend fun getAnime(page:String): KrakenAnimeModel = dao.getAnime(page)

    suspend fun getAnimeCharacters(id:String): Map<String, Any> = dao.getAnimeCharacters(id)
}