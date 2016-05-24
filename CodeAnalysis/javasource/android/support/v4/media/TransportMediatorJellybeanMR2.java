package android.support.v4.media;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.RemoteControlClient.OnGetPlaybackPositionListener;
import android.media.RemoteControlClient.OnPlaybackPositionUpdateListener;
import android.util.Log;
import android.view.KeyEvent;

class TransportMediatorJellybeanMR2
  implements RemoteControlClient.OnGetPlaybackPositionListener, RemoteControlClient.OnPlaybackPositionUpdateListener
{
  final TransportMediatorCallback mTransportCallback;
  
  public long onGetPlaybackPosition()
  {
    return mTransportCallback.getPlaybackPosition();
  }
  
  public void onPlaybackPositionUpdate(long paramLong)
  {
    mTransportCallback.playbackPositionUpdate(paramLong);
  }
}
