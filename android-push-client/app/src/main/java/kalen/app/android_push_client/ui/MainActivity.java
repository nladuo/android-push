package kalen.app.android_push_client.ui;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import kalen.app.android_push_client.R;
import kalen.app.android_push_client.service.PushService;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        System.out.println("Start Activity");

        startService(new Intent(MainActivity.this, PushService.class));
    }


}
