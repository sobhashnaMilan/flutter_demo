package com.flutter.demo.flutter_demo

import android.R
import android.app.AlertDialog
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.content.ContextCompat
import android.content.Context
import android.content.pm.PackageManager
import android.Manifest
import android.app.Activity;
import androidx.core.app.ActivityCompat
import android.os.Build

class MainActivity : FlutterActivity() {

    var builder: AlertDialog.Builder? = null

    private val CHANNEL = "flutter.native/helper"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {
                "getValue" -> {
                    var text = call.argument<String>("text")
                    val greetings = helloFromNativeCode(text = text).toString()
                    result.success(greetings)
                }
                "printLog" -> {
                    Log.d("TAG", "message call method channel")
                }
                "permissionCheck" -> {
                    var t = isPermissionGrantedCode()
                    result.success(t)
                }
                "openDialog" -> {
                    showDefaultDialog()
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun showDefaultDialog() {
        builder = AlertDialog.Builder(this@MainActivity)
        builder?.setTitle("Alert Dialog")
        builder?.setMessage("Do you want to close this application ?")
            ?.setCancelable(false)
            ?.setPositiveButton("Yes") { dialog, id ->
                finish()
                Toast.makeText(
                    this@MainActivity, "you choose yes action",
                    Toast.LENGTH_SHORT
                ).show()
            }
            ?.setNegativeButton(
                "No"
            ) { dialog, id ->
                dialog.cancel()
                Toast.makeText(
                    this@MainActivity, "you choose no action",
                    Toast.LENGTH_SHORT
                ).show()
            }
        val alert: AlertDialog = builder!!.create()
        alert.show()
    }

    private fun helloFromNativeCode(text: String?): Int {
        if (text == null) return 0
        var t = text.toInt()
        t++
        return t
    }


    private fun isPermissionGrantedCode(): Boolean {
        val isPermissionGranted = checkMissingPermission(
            this@MainActivity, 1, arrayOf(
                Manifest.permission.READ_MEDIA_IMAGES,
                Manifest.permission.READ_MEDIA_VIDEO,
                Manifest.permission.READ_MEDIA_AUDIO
            )
        )
        if (isPermissionGranted) {
            return  true
        } else {
            return  false
        }
    }

    private fun checkMissingPermission(
        mActivity: Activity,
        permissionCode: Int,
        permissions: Array<String>
    ): Boolean {
        val revokedPermissions: MutableList<String> = ArrayList()
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            //iterating over permission, if not granted then add to our list and ask permission to user
            for (permission in permissions) {
                if (isPermissionGranted(mActivity, permission)) {
                    Log.d("Permission", "$permission is granted")
                } else {
                    Log.d("Permission", "$permission is revoked")
                    revokedPermissions.add(permission) //to ask only non-granted permissions
                }
            }
            //if all permissions are granted, list of revoked permissions will be empty
            if (revokedPermissions.isEmpty()) {
                true
            } else {
                requestPermissions(revokedPermissions.toTypedArray(), permissionCode)
                false
            }
        } else {
            true
        }
    }


    private fun isPermissionGranted(context: Context?, permission: String?): Boolean {
        return ActivityCompat.checkSelfPermission(
            context!!,
            permission!!
        ) == PackageManager.PERMISSION_GRANTED
    }

}
