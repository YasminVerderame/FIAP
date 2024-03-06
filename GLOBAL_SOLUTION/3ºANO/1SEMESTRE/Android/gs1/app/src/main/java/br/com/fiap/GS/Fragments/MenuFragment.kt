package br.com.fiap.GS.Fragments


import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import br.com.fiap.GS.R
import br.com.fiap.GS.databinding.FragmentMenuBinding

class MenuFragment : Fragment() {

  lateinit var binding : FragmentMenuBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentMenuBinding.inflate(
            inflater,
            container,
            false
        )
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        goToRegister()
        goToShop()
    }

    private fun goToRegister(){
        binding.cadastroButton.setOnClickListener {
            findNavController().navigate(R.id.action_to_listDrones)
        }
        }

    private fun goToShop(){

        binding.comprarButton.setOnClickListener {
            findNavController().navigate(R.id.action_to_DroneProject)
        }

    }
}