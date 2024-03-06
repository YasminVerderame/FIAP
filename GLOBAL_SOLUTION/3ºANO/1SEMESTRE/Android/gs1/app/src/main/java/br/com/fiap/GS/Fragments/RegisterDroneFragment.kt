package br.com.fiap.GS.Fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import br.com.fiap.GS.Model.DroneModel
import androidx.navigation.fragment.findNavController
import br.com.fiap.GS.DroneDataSource
import br.com.fiap.GS.R
import br.com.fiap.GS.databinding.FragmentRegisterDroneBinding
import com.google.android.material.snackbar.Snackbar

class RegisterDroneFragment : Fragment(){

    lateinit var binding: FragmentRegisterDroneBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentRegisterDroneBinding.inflate(
            inflater,
            container,
            false
        )
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupViews()
    }

    private fun setupViews() {
        binding.buttonBackToDrones.setOnClickListener {
            findNavController().navigateUp()
        }

        binding.registerUpdateDroneButton.setOnClickListener {
            insertData()
        }
    }

    private fun insertData() {
        val droneModel = DroneModel(
            name = binding.textInputEditTextDroneName.text.toString(),
            model = binding.textInputEditTextDroneModel.text.toString(),
            date = binding.textInputEditTextDroneDate.text.toString(),
            battery = binding.textInputEditTextDroneBattery.text.toString(),
            serie = binding.textInputEditTextDroneSerie.text.toString()
        )
        DroneDataSource.countriesList.add(droneModel)
        clearForm()
        showSnackBar(droneModel.name)
    }

    private fun clearForm() {
        binding.textInputEditTextDroneName.text?.clear()
        binding.textInputEditTextDroneModel.text?.clear()
        binding.textInputEditTextDroneDate.text?.clear()
        binding.textInputEditTextDroneBattery.text?.clear()
        binding.textInputEditTextDroneSerie.text?.clear()
    }


    private fun showSnackBar(droneName: String) {
        Snackbar.make(
            binding.registerUpdateDroneButton,
            getString(R.string.register_success_message, droneName),
            Snackbar.LENGTH_SHORT
        ).show()
    }
}