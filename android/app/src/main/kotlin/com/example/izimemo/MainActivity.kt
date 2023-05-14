package com.example.izimemo

import android.Manifest
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import java.io.File

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.izimemo/speech"

    private val REQUEST_CODE = 1

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "speak") {
                val textToSpeech = call.argument<String>("textToSpeech")
                if (textToSpeech != null) {
                    GlobalScope.launch(Dispatchers.IO) {
                        if (ContextCompat.checkSelfPermission(
                                this@MainActivity,
                                Manifest.permission.RECORD_AUDIO
                            ) != PackageManager.PERMISSION_GRANTED
                        ) {
                            requestRecordAudioPermission()
                        } else {
                            val flitePath = "${filesDir}/flite"
                            val fliteFile = File(flitePath)
                            if (!fliteFile.exists()) {
                                val fliteData = assets.open("flite").readBytes()
                                fliteFile.writeBytes(fliteData)
                                fliteFile.setExecutable(true)
                            }

                            val processBuilder = ProcessBuilder(flitePath, "-t", textToSpeech)
                            val process = processBuilder.start()
                            val output = process.inputStream.bufferedReader().use { it.readText() }
                            result.success(output)
                        }
                    }
                }
            }
        }
    }

    private fun requestRecordAudioPermission() {
        ActivityCompat.requestPermissions(
            this,
            arrayOf(Manifest.permission.RECORD_AUDIO),
            REQUEST_CODE
        )
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (requestCode == REQUEST_CODE) {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                // Permission granted
            } else {
                // Permission denied
            }
        }
    }
}