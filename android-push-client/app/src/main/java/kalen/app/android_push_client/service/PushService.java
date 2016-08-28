package kalen.app.android_push_client.service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.Nullable;

import com.goim.bootstrap.AbstractBlockingClient;

import java.net.InetAddress;
import java.net.UnknownHostException;

import kalen.app.android_push_client.util.C;

/**
 * Created by kalen on 8/28/16.
 */
public class PushService extends Service implements IReceivedMsg{

    @Override
    public void onCreate() {
        super.onCreate();
    }


    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void messageReceived(String msg) {

    }
}
