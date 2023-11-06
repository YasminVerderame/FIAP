package br.com.fiap.checkpoint.presentation

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import br.com.fiap.checkpoint.data.Pais
import br.com.fiap.checkpoint.databinding.ListItemPaisBinding

class PaisListAdapter : RecyclerView.Adapter<PaisViewHolder>() {
    private var paises: List<Pais> = emptyList()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PaisViewHolder {
        val binding = ListItemPaisBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return PaisViewHolder(binding)
    }

    override fun onBindViewHolder(holder: PaisViewHolder, position: Int) {
        val pais = paises[position]
        holder.bind(pais)
    }

    override fun getItemCount(): Int {
        return paises.size
    }

    fun setPaises(paises: List<Pais>) {
        this.paises = paises
        notifyDataSetChanged()
    }
}

class PaisViewHolder(private val binding: ListItemPaisBinding) : RecyclerView.ViewHolder(binding.root) {
    fun bind(pais: Pais) {
        binding.nomeAbreviado.text = pais.nome.abreviado
        binding.regiaoNome.text = pais.localizacao.regiao.nome
        binding.capitalNome.text = pais.governo.capital.nome
    }
}

class PaisDiffCallback : DiffUtil.ItemCallback<Pais>() {
    override fun areItemsTheSame(oldItem: Pais, newItem: Pais): Boolean {
        return oldItem.nome == newItem.nome
    }

    override fun areContentsTheSame(oldItem: Pais, newItem: Pais): Boolean {
        return oldItem == newItem
    }
}