package br.com.fiap.GS.Activitys

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import br.com.fiap.GS.R
import br.com.fiap.GS.databinding.ActivityLoginBinding
import com.google.android.material.snackbar.Snackbar


class LoginActivity : AppCompatActivity() {

    lateinit var binding: ActivityLoginBinding
    private lateinit var usernameEditText: EditText
    private lateinit var passwordEditText: EditText

    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)
        usernameEditText = findViewById(R.id.textInputEditTextUser)
        passwordEditText = findViewById(R.id.textInputEditTextPassword)
        val loginButton : Button = findViewById(R.id.button_login)
        loginButton.setOnClickListener{goToMenu()}


    }

    private fun goToMenu() {

        val user = usernameEditText.text.toString()
        val password = passwordEditText.text.toString()

            if (user.isEmpty() || password.isEmpty()) {
                Snackbar.make(
                    binding.buttonLogin,
                    getString(R.string.login_fail_message),
                    Snackbar.LENGTH_SHORT
                ).show()
            }else{
                startActivity(
                    Intent(
                        this,
                        MenuActivity::class.java
                    )
                )
        }
    }


}



