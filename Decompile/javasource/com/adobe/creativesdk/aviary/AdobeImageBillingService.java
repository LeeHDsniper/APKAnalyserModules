package com.adobe.creativesdk.aviary;

import android.app.Activity;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import android.util.Pair;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.account.BillingContentFactory;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils.PackOptionWithPrice;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.Map;
import rx.Observable;
import rx.Subscription;
import rx.functions.Action1;

public class AdobeImageBillingService
  extends Service
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("AdobeImageContentManagerService");
  private BillingContentFactory mBillingFactory;
  private final MyBinder mBinder = new MyBinder();
  
  public AdobeImageBillingService() {}
  
  public boolean handleActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Log.i("IabHelper", "handleActivityResult for AdobeImageBillingService");
    return mBillingFactory.handleActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  public boolean isAuthenticated()
  {
    return mBillingFactory.isAuthenticated();
  }
  
  public boolean isSetupDone()
  {
    return mBillingFactory.isSetupDone();
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    logger.info("onBind: %s", new Object[] { paramIntent });
    return mBinder;
  }
  
  public void onCreate()
  {
    logger.info("onCreate");
    super.onCreate();
    mBillingFactory = BillingContentFactory.create(this);
  }
  
  public void onDestroy()
  {
    logger.info("onDestroy");
    mBillingFactory.dispose();
    mBillingFactory = null;
    super.onDestroy();
  }
  
  public void onRebind(Intent paramIntent)
  {
    logger.info("onRebind");
    super.onRebind(paramIntent);
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    logger.info("onStartCommand: %s, %d, %d", new Object[] { paramIntent, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) });
    return super.onStartCommand(paramIntent, paramInt1, paramInt2);
  }
  
  public boolean onUnbind(Intent paramIntent)
  {
    logger.info("onUnbind");
    return super.onUnbind(paramIntent);
  }
  
  public Observable<Pair<IabResult, Integer>> purchase(Activity paramActivity, int paramInt, long paramLong, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    return purchase(paramActivity, paramInt, paramLong, paramString1, paramString2, paramString3, paramString4, -1);
  }
  
  public Observable<Pair<IabResult, Integer>> purchase(Activity paramActivity, int paramInt1, long paramLong, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt2)
  {
    return mBillingFactory.requestPurchase(paramActivity, paramInt1, paramLong, paramString1, paramString2, paramString3, paramString4, paramInt2);
  }
  
  public Observable<Map<Long, CdsUtils.PackOptionWithPrice>> queryPurchases(Map<Long, String> paramMap)
  {
    return mBillingFactory.queryPurchases(paramMap);
  }
  
  public void requestLogin(Activity paramActivity, Bundle paramBundle)
  {
    mBillingFactory.requestLogin(paramActivity, paramBundle);
  }
  
  public void requestSignUp(Activity paramActivity, Bundle paramBundle)
  {
    mBillingFactory.requestSignUp(paramActivity, paramBundle);
  }
  
  public Observable<? extends Integer> restore(long paramLong, String paramString1, String paramString2, String paramString3)
  {
    return mBillingFactory.requestRestore(paramLong, paramString1, paramString2, paramString3);
  }
  
  public Observable<Pair<AccountResult, IabResult>> startSetup()
  {
    return mBillingFactory.startSetup();
  }
  
  public Subscription subscribeToCdsFinised(Object paramObject, Action1<? super Integer> paramAction1)
  {
    return mBillingFactory.subscribeToCdsFinised(paramObject, paramAction1);
  }
  
  public Subscription subscribeToPackDownloadStatusChanged(Object paramObject, Action1<? super Intent> paramAction1)
  {
    return mBillingFactory.subscribeToPackDownloadStatusChanged(paramObject, paramAction1);
  }
  
  public Subscription subscribeToPackInstalled(Object paramObject, Action1<? super Intent> paramAction1)
  {
    return mBillingFactory.subscribeToPackInstalled(paramObject, paramAction1);
  }
  
  public Subscription subscribeToPackPurchased(Object paramObject, Action1<? super Intent> paramAction1)
  {
    return mBillingFactory.subscribeToPackPurchased(paramObject, paramAction1);
  }
  
  public Subscription subscribeToUserStatusChange(Object paramObject, Action1<? super AdobeAccountUserStatus> paramAction1)
  {
    return mBillingFactory.subscribeToUserStatusChange(paramObject, paramAction1);
  }
  
  public class MyBinder
    extends Binder
  {
    public MyBinder() {}
    
    public AdobeImageBillingService getService()
    {
      return AdobeImageBillingService.this;
    }
  }
}
