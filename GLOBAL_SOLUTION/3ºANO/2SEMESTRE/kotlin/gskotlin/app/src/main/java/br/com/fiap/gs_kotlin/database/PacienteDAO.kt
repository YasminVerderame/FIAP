package br.com.fiap.gs_kotlin.database

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Transaction

@Dao
interface PacienteDAO {
    @Transaction
    @Query("SELECT * FROM pacienteTable WHERE id = :pacienteId")
    fun getPaciente(pacienteId: Int): PacienteModel?

    @Query("SELECT * FROM pacienteTable ORDER BY id")
    fun selectAllPacientes(): List<PacienteModel>

    @Insert
    fun insertPaciente(pacienteModel: PacienteModel): Long

    @Insert
    fun insertPacientes(pacienteModel: List<PacienteModel>)
}