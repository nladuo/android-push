package kalen.app.android_push_client.service;

import com.goim.bootstrap.AbstractBlockingClient;

import java.net.InetAddress;

import kalen.app.android_push_client.util.C;

/**
 * Created by kalen on 8/28/16.
 */
public class PushClient extends AbstractBlockingClient{


    IReceivedMsg delegate;

    public PushClient(IReceivedMsg delegate, InetAddress server, int port , Integer uid , String game) {
        super(server, port , uid, game);
        this.delegate = delegate;
    }

    @Override
    protected void messageReceived(Long packageLength, Long headLength, Long version, Long operation, Long sequenceId, String message) {

    }

    @Override
    protected void messageReceived(String message) {
        delegate.messageReceived(message);
    }

    @Override
    protected void heartBeatReceived() {
        System.out.println("heartBeatReceived ...");
    }

    @Override
    protected void authSuccess() {
        System.out.println("authSuccess ...");
    }

    @Override
    protected void connected(boolean alreadyConnected) {

    }

    @Override
    protected void disconnected() {

    }


}
