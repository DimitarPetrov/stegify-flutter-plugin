package com.example.flutter_stegify_example_test

import androidx.test.rule.ActivityTestRule
import dev.flutter.plugins.e2e.FlutterRunner
import com.example.flutter_stegify_example.MainActivity
import org.junit.Rule
import org.junit.runner.RunWith


@RunWith(FlutterRunner::class)
class MainActivityTest {
    // Replace `MainActivity` with `io.flutter.embedding.android.FlutterActivity` if you removed `MainActivity`.
    @Rule
    var rule: ActivityTestRule<MainActivity> = ActivityTestRule(MainActivity::class.java)
}