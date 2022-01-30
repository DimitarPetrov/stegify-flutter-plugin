package com.example.flutter_stegify_example_test

import androidx.test.rule.ActivityTestRule
import dev.flutter.plugins.e2e.FlutterRunner
import com.example.flutter_stegify_example.EmbeddingV1Activity
import org.junit.Rule
import org.junit.runner.RunWith


@RunWith(FlutterRunner::class)
class EmbeddingV1ActivityTest {
    @Rule
    var rule: ActivityTestRule<EmbeddingV1Activity> = ActivityTestRule(EmbeddingV1Activity::class.java)
}