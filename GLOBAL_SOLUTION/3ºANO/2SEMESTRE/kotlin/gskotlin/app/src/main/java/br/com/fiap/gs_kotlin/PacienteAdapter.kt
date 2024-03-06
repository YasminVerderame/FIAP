package br.com.fiap.gs_kotlin

import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.recyclerview.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import br.com.fiap.gs_kotlin.database.PacienteModel
import br.com.fiap.gs_kotlin.databinding.ItemPacienteViewBinding


class PacienteAdapter(val pacientes: List<PacienteModel>) : RecyclerView.Adapter<PacienteAdapter.PacienteViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PacienteViewHolder {
        val binding = ItemPacienteViewBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return PacienteViewHolder(binding)
    }

    override fun onBindViewHolder(holder: PacienteViewHolder, position: Int) {
        val paciente = pacientes[position]
        holder.bind(paciente)
    }

    override fun getItemCount(): Int {
        return pacientes.size
    }

    inner class PacienteViewHolder(private val binding: ItemPacienteViewBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(paciente: PacienteModel) {
            binding.txtNome.text = "Nome: ${paciente.nome}"
            binding.txtIdade.text = "Idade: ${paciente.idade}"

            binding.btnDetalhesPaciente.setOnClickListener {
                abrirDetalhesPaciente(paciente, binding.root.context)
            }
        }
    }

    private fun abrirDetalhesPaciente(paciente: PacienteModel, context: Context) {
        val intent = Intent(context, DetalhesPacienteActivity::class.java)
        intent.putExtra("PACIENTE", paciente)
        context.startActivity(intent)
    }
}