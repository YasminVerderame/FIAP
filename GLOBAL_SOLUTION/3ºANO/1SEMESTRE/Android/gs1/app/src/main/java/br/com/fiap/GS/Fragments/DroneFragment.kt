package br.com.fiap.GS.Fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import br.com.fiap.GS.DroneAdapter
import br.com.fiap.GS.DroneDataSource
import br.com.fiap.GS.R

import br.com.fiap.GS.databinding.FragmentDronesBinding

class DroneFragment : Fragment(){

lateinit var binding : FragmentDronesBinding
private val droneAdapter = DroneAdapter()

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentDronesBinding.inflate(
            inflater,
            container,
            false
        )
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        goToRegister()
        backToMenu()
    }

    private fun goToRegister() {
        binding.buttonAddDrone.setOnClickListener {
            findNavController().navigate(R.id.action_to_RegisterDroneFragment)
        }

        binding.recyclerViewDrones.setHasFixedSize(true)
        binding.recyclerViewDrones.adapter = droneAdapter

        droneAdapter.setData(DroneDataSource.countriesList)
    }

private fun backToMenu(){

    binding.buttonBackToMenu.setOnClickListener {
        findNavController().navigate(R.id.action_to_backToMenu)
    }
}

}