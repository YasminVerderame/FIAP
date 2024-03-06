package br.com.fiap.gs_kotlin

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import br.com.fiap.gs_kotlin.database.PacienteModel
import br.com.fiap.gs_kotlin.databinding.ActivityDetalhesPacienteBinding

class DetalhesPacienteActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDetalhesPacienteBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.d("DetalhesPacienteActivity", "onCreate chamado")
        binding = ActivityDetalhesPacienteBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val paciente = intent.getSerializableExtra("PACIENTE") as PacienteModel?

        if (paciente != null) {
            binding.txtNomeDetalhes.text = "Nome: ${paciente.nome}"
            binding.txtIdadeDetalhes.text = "Idade: ${paciente.idade}"
            binding.txtEmailDetalhes.text = "Email: ${paciente?.email}"
            binding.txtTelefoneDetalhes.text = "Telefone: ${paciente?.telefone}"
        } else {
            Log.e("DetalhesPacienteActivity", "Objeto PacienteModel nulo")
        }
    }
}
