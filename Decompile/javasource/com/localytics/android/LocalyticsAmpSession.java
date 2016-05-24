package com.localytics.android;

import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.HandlerThread;
import android.os.Looper;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.widget.Toast;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;

public class LocalyticsAmpSession
  extends LocalyticsSession
{
  public LocalyticsAmpSession(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LocalyticsAmpSession(Context paramContext, String paramString)
  {
    this(paramContext, paramString, null);
  }
  
  LocalyticsAmpSession(Context paramContext, String paramString1, String paramString2)
  {
    super(paramContext, paramString1, paramString2);
    sSessionHandlerThread.setName(AmpSessionHandler.class.getSimpleName());
    createLocalyticsDirectory(paramContext);
  }
  
  private boolean createLocalyticsDirectory(Context paramContext)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContext.getFilesDir().getAbsolutePath());
    localStringBuilder.append(File.separator);
    localStringBuilder.append(".localytics");
    paramContext = new File(localStringBuilder.toString());
    return (paramContext.mkdirs()) || (paramContext.isDirectory());
  }
  
  public static boolean isTestModeEnabled()
  {
    return AmpConstants.isTestModeEnabled();
  }
  
  public void attach(FragmentActivity paramFragmentActivity)
  {
    if (paramFragmentActivity == null) {
      throw new IllegalArgumentException("attached activity cannot be null");
    }
    AmpSessionHandler localAmpSessionHandler = (AmpSessionHandler)getSessionHandler();
    localAmpSessionHandler.setFragmentManager(paramFragmentActivity.getSupportFragmentManager());
    if (isTestModeEnabled()) {
      localAmpSessionHandler.sendMessage(localAmpSessionHandler.obtainMessage(15));
    }
  }
  
  protected SessionHandler createSessionHandler(Context paramContext, String paramString, Looper paramLooper)
  {
    return new AmpSessionHandler(paramContext, paramString, paramLooper);
  }
  
  public void detach()
  {
    ((AmpSessionHandler)getSessionHandler()).setFragmentManager(null);
  }
  
  protected void uploadAnalytics()
  {
    final AmpSessionHandler localAmpSessionHandler = (AmpSessionHandler)getSessionHandler();
    localAmpSessionHandler.sendMessage(localAmpSessionHandler.obtainMessage(4, new Runnable()
    {
      public void run()
      {
        localAmpSessionHandler.sendMessage(localAmpSessionHandler.obtainMessage(13, new Object[] { "AMP Loaded", null }));
      }
    }));
  }
}
