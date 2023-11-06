package br.com.fiap.checkpoint.presentation

import android.util.Log
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import br.com.fiap.checkpoint.data.Pais
import br.com.fiap.checkpoint.data.PaisesService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class PaisesViewModel: ViewModel() {
    private val apiService = Retrofit.Builder()
        .baseUrl("https://servicodados.ibge.gov.br/api/")
        .addConverterFactory(GsonConverterFactory.create())
        .build()
        .create(PaisesService::class.java)

    private val _paises = MutableLiveData<List<Pais>>()
    val paises: LiveData<List<Pais>> get() = _paises

    private val _error = MutableLiveData<String>()
    val error: LiveData<String> get() = _error

    fun getPaises() {
        viewModelScope.launch {
            try {
                val response = apiService.getPaises()
                withContext(Dispatchers.Main) {
                    _paises.value = response
                }
            } catch (e: Exception) {
                Log.e("PaisesViewModel", "Erro ao buscar países: ${e.message}")
                withContext(Dispatchers.Main) {
                    _error.value = "Ocorreu um erro ao buscar os países"
                }
            }
        }
    }
}