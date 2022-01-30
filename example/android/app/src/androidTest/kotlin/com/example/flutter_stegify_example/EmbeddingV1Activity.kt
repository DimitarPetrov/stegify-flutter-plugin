package com.example.flutter_stegify_example

import androidx.test.rule.ActivityTestRule
import dev.flutter.plugins.e2e.FlutterRunner
import io.flutter.plugins.firebasecoreexample.EmbeddingV1Activity
import org.junit.Rule
import org.junit.runner.RunWith


@RunWith(FlutterRunner::class)
class EmbeddingV1ActivityTest {
    @Rule
    var rule: ActivityTestRule<EmbeddingV1Activity> = ActivityTestRule(EmbeddingV1Activity::class.java)
}