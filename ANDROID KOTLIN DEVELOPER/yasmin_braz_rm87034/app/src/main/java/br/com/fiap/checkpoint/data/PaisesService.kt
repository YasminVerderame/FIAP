package br.com.fiap.checkpoint.data

import retrofit2.http.GET

interface PaisesService {
    @GET("v1/paises/todos")
    suspend fun getPaises(): List<Pais>
}

data class Pais(
    val nome: Nome,
    val localizacao: Localizacao,
    val governo: Governo
)

data class Nome(
    val abreviado: String,
    val nome: String
)

data class Localizacao(
    val regiao: Regiao
)

data class Regiao(
    val nome: String
)

data class Governo(
    val capital: Capital
)

data class Capital(
    val nome: String
)