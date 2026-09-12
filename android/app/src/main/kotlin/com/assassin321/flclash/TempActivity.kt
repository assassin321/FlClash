package com.assassin321.flclash

import android.app.Activity
import android.os.Bundle
import com.assassin321.flclash.extensions.wrapAction

class TempActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        when (intent.action) {
            wrapAction("START") -> GlobalState.handleStart()
            wrapAction("STOP") -> GlobalState.handleStop()
            wrapAction("CHANGE") -> GlobalState.handleToggle()
        }
        finishAndRemoveTask()
    }
}
