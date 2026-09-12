package com.assassin321.flclash

import android.app.Application
import android.content.Context
import android.os.Build

import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngineGroup

class FlClashApplication : Application() {
    companion object {
        private lateinit var instance: FlClashApplication
        fun getAppContext(): Context = instance.applicationContext
    }

    lateinit var engineGroup: FlutterEngineGroup

    override fun onCreate() {
        super.onCreate()
        instance = this
        FlutterInjector.instance().flutterLoader().startInitialization(this)
        engineGroup = FlutterEngineGroup(this)
    }
}
