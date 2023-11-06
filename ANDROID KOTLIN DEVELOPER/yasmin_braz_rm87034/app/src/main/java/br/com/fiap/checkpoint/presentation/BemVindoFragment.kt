package br.com.fiap.checkpoint.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import br.com.fiap.checkpoint.R
import br.com.fiap.checkpoint.databinding.FragmentBemVindoBinding


class BemVindoFragment : Fragment() {

    private lateinit var binding: FragmentBemVindoBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentBemVindoBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.textViewBemVindo.text = "Bem vindo ao Terceiro Checkpoint."
        binding.buttonVisualizarPaises.setOnClickListener {
            findNavController().navigate(R.id.paisListFragment)
        }
    }
}

