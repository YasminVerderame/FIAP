package br.com.fiap.gs_kotlin

import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.core.content.ContextCompat
import br.com.fiap.gs_kotlin.database.PacientesUtils
import br.com.fiap.gs_kotlin.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val pacientesUtils= PacientesUtils(this)
        pacientesUtils.inserirPacientes()

        binding.btnCadastrarPaciente.setOnClickListener {
            Log.d("MainActivity", "Clicou em Cadastrar Paciente")
            abrirTelaCadastroPaciente()
        }

        binding.btnListarPacientes.setOnClickListener {
            Log.d("MainActivity", "Clicou em Listar Pacientes")
            listarPacientes()
        }
    }

    private fun abrirTelaCadastroPaciente() {
        val intent = Intent(this, CadastroPacienteActivity::class.java)
        startActivity(intent)
    }

    private fun listarPacientes() {
        val intent = Intent(this, ListaPacienteActivity::class.java)
        startActivity(intent)
    }
}