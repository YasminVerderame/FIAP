package br.com.fiap.gs_kotlin.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

const val GS_DATABASE_NAME = "GS_DATABASE_NAME"

@Database(entities = [PacienteModel::class], version = 1)
abstract class AppDatabase: RoomDatabase() {

    abstract fun pacienteDAO(): PacienteDAO

    companion object {
        private var INSTANCE: AppDatabase? = null
        fun getDatabase(context: Context): AppDatabase {
            if (INSTANCE != null) {
                return INSTANCE!!
            } else {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    GS_DATABASE_NAME
                ).build()
                INSTANCE = instance
                return instance
            }
        }
    }


}