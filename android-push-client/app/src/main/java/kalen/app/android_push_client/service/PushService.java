package kalen.app.android_push_client.service;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Observable;
import java.util.Observer;

import kalen.app.android_push_client.R;
import kalen.app.android_push_client.util.C;


/**
 * Created by kalen on 8/28/16.
 */
public class PushService extends Service implements IReceivedMsg{

    NotificationManager manager;
    Notification notification=new Notification();
    private RemoteViews view=null;
    PushClient pc = null;
    private Handler notificationHandler = new Handler(){

        @Override
        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            switch (msg.what) {
                case 0:
                    view.setTextViewText(R.id.noti_tv, msg.getData().getString("msg"));
                    notification.contentView=view;
                    manager.notify(0, notification);
                    break;
                default:
                    break;
            }
        }

    };

    public class Listener implements Observer {
        @Override
        public void update(Observable o, Object arg) {

            try {
                System.out.println( "PushClient died" );
                pc = null;
                pc = new PushClient(PushService.this, InetAddress.getByName(C.serverIp), C.serverPort, 1, "android-push-client");
                pc.addObserver( this );
                new Thread(pc).start();
                System.out.println( "PushClient restart" );
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }

        }
    }

    @Override
    public void onCreate() {
        super.onCreate();
        System.out.println("Start Service");
        try {
            pc = new PushClient(this, InetAddress.getByName(C.serverIp), C.serverPort, 1, "android-push-client");
            Listener listen = new Listener();
            pc.addObserver(listen);
            Thread t = new Thread(pc);
            t.start();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        view = new RemoteViews(getPackageName(), R.layout.notification_view);
        manager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        notification.icon = R.mipmap.ic_launcher;
        view.setImageViewResource(R.id.noti_image, R.mipmap.ic_launcher);
    }


    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void messageReceived(String msg) {

        System.out.println("received-->" + msg);

        Message message = new Message();
        message.what = 0;
        Bundle bundle = new Bundle();
        bundle.putString("msg", msg);
        message.setData(bundle);
        notificationHandler.sendMessage(message);
    }
}
