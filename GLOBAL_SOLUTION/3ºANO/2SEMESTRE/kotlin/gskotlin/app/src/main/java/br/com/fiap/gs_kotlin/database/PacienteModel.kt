package br.com.fiap.gs_kotlin.database

import androidx.annotation.NonNull
import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.versionedparcelable.VersionedParcelize
import java.io.Serializable

const val PACIENTE_MODEL_TABLE_NAME = "pacienteTable"
@Entity(tableName = PACIENTE_MODEL_TABLE_NAME)
@VersionedParcelize
data class PacienteModel(
    @PrimaryKey(autoGenerate = true)
    var id: Int = 0,
    @NonNull @ColumnInfo val nome: String,
    @NonNull @ColumnInfo val idade: Int,
    @NonNull @ColumnInfo val email: String,
    @NonNull @ColumnInfo val telefone: String,
) : Serializable
