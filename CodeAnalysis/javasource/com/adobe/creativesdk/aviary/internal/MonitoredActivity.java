package com.adobe.creativesdk.aviary.internal;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.util.Log;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.ToolBarActivity;
import com.adobe.creativesdk.aviary.internal.receipt.IReceiptManager;
import com.adobe.creativesdk.aviary.internal.receipt.ReceiptFactory;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.ThrowableUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import junit.framework.Assert;

public class MonitoredActivity
  extends ToolBarActivity
{
  private BroadcastReceiver mBroadcastReceiver;
  private boolean mDestroy;
  private final ArrayList<LifeCycleListener> mListeners = new ArrayList();
  private IReceiptManager mReceiptManager;
  protected AdobeImageAnalyticsTracker mTracker;
  
  public MonitoredActivity() {}
  
  private AlertDialog generateAlertDialog(Bundle paramBundle)
  {
    Log.i("MonitoredActivity", "generateAlertDialog");
    if (paramBundle == null) {}
    String str;
    Serializable localSerializable;
    do
    {
      return null;
      str = paramBundle.getString("android.intent.extra.TITLE");
      localSerializable = paramBundle.getSerializable("extra-exceptions");
    } while ((str == null) || ((!paramBundle.containsKey("extra-exceptions")) && (!paramBundle.containsKey("android.intent.extra.TEXT"))));
    Object localObject2 = null;
    Object localObject1;
    if (paramBundle.containsKey("extra-exceptions"))
    {
      localObject1 = localObject2;
      if (localSerializable != null)
      {
        localObject1 = localObject2;
        if ((localSerializable instanceof ArrayList)) {
          localObject1 = ThrowableUtils.getLocalizedMessage((Collection)localSerializable, "\n\n");
        }
      }
    }
    for (;;)
    {
      paramBundle = new AlertDialog.Builder(this);
      paramBundle.setTitle(str);
      paramBundle.setIcon(17301543);
      if (localObject1 != null) {
        paramBundle.setMessage((CharSequence)localObject1);
      }
      paramBundle.setPositiveButton(17039360, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          paramAnonymousDialogInterface.dismiss();
        }
      });
      return paramBundle.create();
      localObject1 = localObject2;
      if (paramBundle.containsKey("android.intent.extra.TEXT")) {
        localObject1 = paramBundle.getString("android.intent.extra.TEXT");
      }
    }
  }
  
  private void initializeBroadcastReceivers()
  {
    IntentFilter localIntentFilter = new IntentFilter("aviary.intent.action.ALERT");
    if (!PackageManagerUtils.isStandalone(this)) {
      localIntentFilter.addAction("aviary.intent.action.KILL");
    }
    mBroadcastReceiver = new BroadcastReceiver()
    {
      public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
      {
        Log.i("MonitoredActivity", "onReceive: " + paramAnonymousIntent);
        if ((paramAnonymousIntent != null) && (paramAnonymousContext != null))
        {
          paramAnonymousContext = paramAnonymousIntent.getAction();
          if (!"aviary.intent.action.KILL".equals(paramAnonymousContext)) {
            break label55;
          }
          MonitoredActivity.this.onKill();
        }
        label55:
        while (!"aviary.intent.action.ALERT".equals(paramAnonymousContext)) {
          return;
        }
        MonitoredActivity.this.onAlertMessageReceived(paramAnonymousIntent);
      }
    };
    registerReceiver(mBroadcastReceiver, localIntentFilter);
  }
  
  private void initializeCDS()
  {
    Object localObject = AdobeImageIntent.createCdsInitIntent(getBaseContext(), "editor-opened");
    ((Intent)localObject).putExtra("extra-lazy-execution", false);
    ((Intent)localObject).putExtra("extra-execute-wifi-only", false);
    ((Intent)localObject).putExtra("extra-execute-plugged-only", false);
    localObject = startService((Intent)localObject);
    if (localObject == null) {
      LoggerFactory.printDeveloperError("'AviaryCdsService' not found, did you forget to add to your AndroidManifest.xml file?");
    }
    Assert.assertNotNull(localObject);
  }
  
  private void lazyInitialize()
  {
    Thread localThread = new Thread(new Runnable()
    {
      public void run()
      {
        MonitoredActivity.this.initializeBroadcastReceivers();
        MonitoredActivity.this.initializeCDS();
      }
    });
    localThread.setPriority(1);
    localThread.start();
  }
  
  private void onAlertMessageReceived(Intent paramIntent)
  {
    Log.i("MonitoredActivity", "onAlertMessage: " + paramIntent);
    if (paramIntent != null)
    {
      String str = paramIntent.getAction();
      paramIntent = paramIntent.getExtras();
      if ((paramIntent != null) && ("aviary.intent.action.ALERT".equals(str)))
      {
        paramIntent = generateAlertDialog(paramIntent);
        if (paramIntent != null) {
          paramIntent.show();
        }
      }
    }
  }
  
  private void onKill()
  {
    Log.w("MonitoredActivity", "onKill: " + getPackageName());
    new AlertDialog.Builder(this).setTitle("Removed").setMessage("We're sorry but the application has been banned. Please contact the developer.").setCancelable(false).setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.dismiss();
        finish();
      }
    }).show();
  }
  
  public boolean isDestroyed()
  {
    return mDestroy;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mDestroy = false;
    paramBundle = mListeners.iterator();
    while (paramBundle.hasNext()) {
      ((LifeCycleListener)paramBundle.next()).onActivityCreated(this);
    }
    mTracker = AdobeImageAnalyticsTracker.getInstance(this);
    mTracker.open();
    mTracker.upload();
    mReceiptManager = ReceiptFactory.getReceiptManager(getApplicationContext());
    lazyInitialize();
  }
  
  protected void onDestroy()
  {
    Log.v("MonitoredActivity", "onDestroy");
    super.onDestroy();
    mDestroy = true;
    Iterator localIterator = mListeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityDestroyed(this);
    }
    if (mBroadcastReceiver != null)
    {
      unregisterReceiver(mBroadcastReceiver);
      mBroadcastReceiver = null;
    }
  }
  
  protected void onPause()
  {
    Log.v("MonitoredActivity", "onPause");
    mTracker.close();
    mTracker.upload();
    if (mReceiptManager != null)
    {
      mReceiptManager.close();
      mReceiptManager.upload();
    }
    super.onPause();
  }
  
  protected void onResume()
  {
    Log.v("MonitoredActivity", "onResume");
    super.onResume();
    mTracker.open();
    if (mReceiptManager != null)
    {
      mReceiptManager.open();
      mReceiptManager.upload();
    }
  }
  
  protected void onStart()
  {
    Log.v("MonitoredActivity", "onStart");
    super.onStart();
    Iterator localIterator = mListeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityStarted(this);
    }
  }
  
  protected void onStop()
  {
    Log.v("MonitoredActivity", "onStop");
    super.onStop();
    Iterator localIterator = mListeners.iterator();
    while (localIterator.hasNext()) {
      ((LifeCycleListener)localIterator.next()).onActivityStopped(this);
    }
  }
  
  public static abstract interface LifeCycleListener
  {
    public abstract void onActivityCreated(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityDestroyed(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityStarted(MonitoredActivity paramMonitoredActivity);
    
    public abstract void onActivityStopped(MonitoredActivity paramMonitoredActivity);
  }
}
