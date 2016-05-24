package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.MediaController;
import android.widget.ProgressBar;
import android.widget.Toast;
import android.widget.VideoView;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability.AdobeNetworkStatus;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeUXAssetVideoActivity
  extends Activity
{
  private int _assetPos;
  private MediaController _mediaController;
  private Observer _network_reachability_observer;
  private ProgressBar _progressBar;
  private int _stopPosition;
  private VideoView _vidView;
  private boolean noInternet = false;
  private View no_network_banner;
  
  public AdobeUXAssetVideoActivity() {}
  
  private void refreshVideoView()
  {
    String str = ((AdobeAssetFileInternal)AdobeAssetViewerController.getAssetAtPos(_assetPos)).getHlsHref();
    Uri localUri = Uri.parse(str);
    _vidView.setOnErrorListener(new MediaPlayer.OnErrorListener()
    {
      public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        AdobeLogger.log(Level.ERROR, "VideoActivity-onError", String.format("error code is %d:%d", new Object[] { Integer.valueOf(paramAnonymousInt1), Integer.valueOf(paramAnonymousInt2) }));
        _progressBar.setVisibility(4);
        Toast.makeText(AdobeUXAssetVideoActivity.this, "Can't play this video", 0).show();
        finish();
        return true;
      }
    });
    AdobeLogger.log(Level.INFO, "VideoActivity", String.format("VideoUrl is %s", new Object[] { str }));
    _vidView.setOnPreparedListener(new MediaPlayer.OnPreparedListener()
    {
      boolean progressBarShown = true;
      
      public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
      {
        if (_stopPosition != 0) {
          paramAnonymousMediaPlayer.seekTo(_stopPosition);
        }
        paramAnonymousMediaPlayer.setOnBufferingUpdateListener(new MediaPlayer.OnBufferingUpdateListener()
        {
          public void onBufferingUpdate(MediaPlayer paramAnonymous2MediaPlayer, int paramAnonymous2Int)
          {
            if (progressBarShown)
            {
              _progressBar.setVisibility(4);
              progressBarShown = false;
            }
          }
        });
        paramAnonymousMediaPlayer.setOnErrorListener(new MediaPlayer.OnErrorListener()
        {
          public boolean onError(MediaPlayer paramAnonymous2MediaPlayer, int paramAnonymous2Int1, int paramAnonymous2Int2)
          {
            AdobeUXAssetVideoActivity.access$102(AdobeUXAssetVideoActivity.this, paramAnonymous2MediaPlayer.getCurrentPosition());
            return true;
          }
        });
        paramAnonymousMediaPlayer.setOnInfoListener(new MediaPlayer.OnInfoListener()
        {
          public boolean onInfo(MediaPlayer paramAnonymous2MediaPlayer, int paramAnonymous2Int1, int paramAnonymous2Int2)
          {
            if (paramAnonymous2Int1 == 701) {
              _progressBar.setVisibility(0);
            }
            if ((paramAnonymous2Int1 == 702) || (paramAnonymous2Int1 == 3)) {
              _progressBar.setVisibility(4);
            }
            return false;
          }
        });
        paramAnonymousMediaPlayer.start();
      }
    });
    _vidView.setVideoURI(localUri);
    _vidView.start();
  }
  
  private void wentOffline()
  {
    noInternet = true;
    no_network_banner.setVisibility(0);
  }
  
  private void wentOnline()
  {
    noInternet = false;
    no_network_banner.setVisibility(8);
    _progressBar.setVisibility(0);
    refreshVideoView();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(R.layout.activity_videoview);
    _vidView = ((VideoView)findViewById(R.id.asset_video_viewContainer));
    _progressBar = ((ProgressBar)findViewById(R.id.asset_videoInit_progressBar));
    _mediaController = new MediaController(this);
    _mediaController.setAnchorView(_vidView);
    _mediaController.setMediaPlayer(_vidView);
    _vidView.setMediaController(_mediaController);
    no_network_banner = findViewById(R.id.video_container_no_network_notification_bar);
    if (!AdobeAssetViewerController.isDataSourceValidForAssetViewerLaunch())
    {
      finish();
      return;
    }
    if (paramBundle != null) {}
    for (_stopPosition = paramBundle.getInt("position");; _stopPosition = 0)
    {
      _assetPos = getIntent().getExtras().getInt("current_asset_position");
      return;
    }
  }
  
  protected void onDestroy()
  {
    _mediaController.hide();
    _vidView.stopPlayback();
    _vidView.setMediaController(null);
    _vidView.setVisibility(4);
    super.onDestroy();
  }
  
  protected void onPause()
  {
    _stopPosition = _vidView.getCurrentPosition();
    super.onPause();
  }
  
  protected void onResume()
  {
    super.onResume();
    refreshVideoView();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putInt("position", _vidView.getCurrentPosition());
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
    registerLocalNofications();
  }
  
  protected void onStop()
  {
    unRegisterLocalNotifications();
    super.onStop();
  }
  
  protected void registerLocalNofications()
  {
    if (_network_reachability_observer == null) {
      _network_reachability_observer = new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeNetworkReachability.AdobeNetworkStatus)((AdobeNotification)paramAnonymousObject).getInfo().get("AdobeNetworkReachabilityStatusKey");
          switch (AdobeUXAssetVideoActivity.4.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$net$AdobeNetworkReachability$AdobeNetworkStatusCode[networkStatusCode.ordinal()])
          {
          default: 
            AdobeUXAssetVideoActivity.this.wentOffline();
            return;
          }
          AdobeUXAssetVideoActivity.this.wentOnline();
        }
      };
    }
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
  }
  
  protected void unRegisterLocalNotifications()
  {
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeNetworkStatusChangeNotification, _network_reachability_observer);
  }
}
