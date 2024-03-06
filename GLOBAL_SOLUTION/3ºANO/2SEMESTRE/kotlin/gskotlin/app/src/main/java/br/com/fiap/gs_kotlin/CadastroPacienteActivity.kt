package br.com.fiap.gs_kotlin


import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import br.com.fiap.gs_kotlin.database.AppDatabase
import br.com.fiap.gs_kotlin.database.PacienteModel
import br.com.fiap.gs_kotlin.databinding.ActivityCadastroPacienteBinding
import com.google.android.material.snackbar.Snackbar
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class CadastroPacienteActivity : AppCompatActivity() {

    private lateinit var binding: ActivityCadastroPacienteBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCadastroPacienteBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnCadastrar.setOnClickListener {
            cadastrarPaciente()
        }

        binding.btnVoltarInicio.setOnClickListener {
            finish()
        }
    }
    private fun cadastrarPaciente() {
        val nome = binding.textInputEditTextNome.text.toString()
        val idade = binding.textInputEditTextIdade.text.toString().toIntOrNull() ?: 0
        val email = binding.textInputEditTextEmail.text.toString()
        val telefone = binding.textInputEditTextTelefone.text.toString()

        if (nome.isNotBlank() && idade > 0) {
            val novoPaciente = PacienteModel(
                nome = nome,
                idade = idade,
                email = email,
                telefone = telefone
            )

            GlobalScope.launch(Dispatchers.IO) {
                AppDatabase.getDatabase(applicationContext).pacienteDAO().insertPaciente(novoPaciente)
            }
            finish()
        } else {
            exibirMensagemErro("Erro ao cadastrar paciente. Verifique os dados inseridos.")
        }
    }

    private fun exibirMensagemErro(mensagem: String) {
        Snackbar.make(binding.root, mensagem, Snackbar.LENGTH_LONG).show()
    }
}
