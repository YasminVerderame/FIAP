package br.com.fiap.GS.Fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import androidx.viewbinding.ViewBindings
import br.com.fiap.GS.R
import br.com.fiap.GS.databinding.FragmentProjetoBinding


class ProjectFragment : Fragment(){

    lateinit var binding : FragmentProjetoBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentProjetoBinding.inflate(
            inflater,
            container,
            false
        )
        return binding.root

    }



    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        goToMenu()
    }

    private fun goToMenu() {
        binding.buttonBackToMenu.setOnClickListener {
            findNavController().navigate(R.id.action_to_backToMenu)
        }
    }

}