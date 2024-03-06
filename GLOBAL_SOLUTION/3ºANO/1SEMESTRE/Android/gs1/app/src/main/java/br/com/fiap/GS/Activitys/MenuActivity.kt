package br.com.fiap.GS.Activitys

import android.content.Intent
import android.os.Bundle
import android.widget.ImageView
import androidx.appcompat.app.AppCompatActivity
import br.com.fiap.GS.databinding.ActivityMenuBinding

class MenuActivity : AppCompatActivity() {

    lateinit var binding: ActivityMenuBinding


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMenuBinding.inflate(layoutInflater)
        setContentView(binding.root)


    }



    }





