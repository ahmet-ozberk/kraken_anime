package com.example.kraken_anime.api

class KrakenAnimeDataSource() {
    private var dao:KrakenAnimeApi = KrakenAnimeService.api
        suspend fun getAnime(page:String) = dao.getAnime(page)
}