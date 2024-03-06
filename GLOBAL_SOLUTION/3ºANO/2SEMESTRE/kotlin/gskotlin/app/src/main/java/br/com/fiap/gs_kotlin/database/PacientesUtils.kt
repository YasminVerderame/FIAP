package br.com.fiap.gs_kotlin.database

import android.content.Context
import android.widget.Toast
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class PacientesUtils(private val context: Context){

    private val db = AppDatabase.getDatabase(context)
    private val pacienteDAO = db.pacienteDAO()

    fun inserirPacientes() {
        GlobalScope.launch(Dispatchers.IO) {
            try {
                pacienteDAO.insertPacientes(getPacientes())
            } catch (e: Exception) {
                e.printStackTrace()
                withContext(Dispatchers.Main) {
                    Toast.makeText(context, "Erro ao inserir pacientes: ${e.message}", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }

    private fun getPacientes(): List<PacienteModel> {
        val pacientes = mutableListOf<PacienteModel>()

        pacientes.add(PacienteModel(
            nome = "Yasmin Verderame",
            idade = 22,
            telefone = "99285-3008",
            email = "yasmin@verderame.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Vinicius Bouvier",
            idade = 20,
            telefone = "91234-5678",
            email = "vini@orsi.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Gabirel Mota",
            idade = 20,
            telefone = "99123-3456",
            email = "gabriel@mota.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Rafael Afonso",
            idade = 21,
            telefone = "96054-8374",
            email = "rafael@afonso.com",
        ))

        pacientes.add(PacienteModel(
            nome = "José Silva",
            idade = 40,
            telefone = "95908-6392",
            email = "jose@silva.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Maria Joaquina de Souza",
            idade = 37,
            telefone = "98076-7125",
            email = "maria@joaquina.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Vanessa Alonso",
            idade = 49,
            telefone = "93490-8683",
            email = "vanessa@alonso.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Thereza Capassi",
            idade = 80,
            telefone = "97620-7191",
            email = "thereza@capassi.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Beatriz Braz",
            idade = 30,
            telefone = "99675-9087",
            email = "beatriz@braz.com",
        ))

        pacientes.add(PacienteModel(
            nome = "Ricardo Ushinohama",
            idade = 48,
            telefone = "99871-2258",
            email = "ricardo@ushinohama.com",
        ))
        return pacientes
    }
}