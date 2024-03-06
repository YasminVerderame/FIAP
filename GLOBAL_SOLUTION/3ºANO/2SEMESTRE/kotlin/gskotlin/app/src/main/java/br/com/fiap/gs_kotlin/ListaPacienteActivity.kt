package br.com.fiap.gs_kotlin

import android.content.Intent
import br.com.fiap.gs_kotlin.databinding.ActivityListaPacienteBinding
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import br.com.fiap.gs_kotlin.database.AppDatabase
import br.com.fiap.gs_kotlin.database.PacienteModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext


class ListaPacienteActivity : AppCompatActivity() {
    private lateinit var binding: ActivityListaPacienteBinding
    private lateinit var pacientes: List<PacienteModel>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityListaPacienteBinding.inflate(layoutInflater)
        setContentView(binding.root)


        GlobalScope.launch(Dispatchers.IO) {
            pacientes = AppDatabase.getDatabase(applicationContext).pacienteDAO().selectAllPacientes()

            Log.d("ListaPacienteActivity", "Pacientes: $pacientes")

            withContext(Dispatchers.Main) {
                binding.recyclerViewPaciente.layoutManager =
                    LinearLayoutManager(this@ListaPacienteActivity)

                val pacienteAdapter = PacienteAdapter(pacientes)
                binding.recyclerViewPaciente.adapter = pacienteAdapter
            }
        }
    }
}