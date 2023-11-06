package br.com.fiap.checkpoint.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import br.com.fiap.checkpoint.databinding.FragmentPaisListBinding
import com.google.android.material.snackbar.Snackbar

class PaisListFragment : Fragment() {
    private val viewModel: PaisesViewModel by activityViewModels()
    private lateinit var binding: FragmentPaisListBinding
    private val adapter = PaisListAdapter()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentPaisListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.recyclerView.adapter = adapter

        viewModel.paises.observe(viewLifecycleOwner, { paises ->
            adapter.setPaises(paises)
        })

        viewModel.error.observe(viewLifecycleOwner, { error ->
            Snackbar.make(requireView(), error, Snackbar.LENGTH_SHORT).show()
        })

        viewModel.getPaises()
    }
}
