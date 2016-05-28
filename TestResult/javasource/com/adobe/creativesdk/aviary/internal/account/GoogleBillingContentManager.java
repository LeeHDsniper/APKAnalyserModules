package com.adobe.creativesdk.aviary.internal.account;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Pair;
import com.adobe.creativesdk.aviary.IAviaryClientCredentials;
import com.adobe.creativesdk.aviary.internal.cds.util.IabException;
import com.adobe.creativesdk.aviary.internal.cds.util.IabHelper;
import com.adobe.creativesdk.aviary.internal.cds.util.IabHelper.OnIabPurchaseFinishedListener;
import com.adobe.creativesdk.aviary.internal.cds.util.IabHelper.OnIabSetupFinishedListener;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.cds.util.Inventory;
import com.adobe.creativesdk.aviary.internal.cds.util.Purchase;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.CustomPriorityThreadFactory;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

class GoogleBillingContentManager
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("GoogleBillingContentManager");
  private final IabHelper helper;
  private final Inventory mInventory = new Inventory();
  private IabResult mResult;
  private final Semaphore mSetupLock = new Semaphore(1);
  private final ExecutorService mSingleExecutor;
  
  public GoogleBillingContentManager(Context paramContext)
  {
    helper = new IabHelper(paramContext, ((IAviaryClientCredentials)paramContext.getApplicationContext()).getBillingKey());
    mSingleExecutor = Executors.newSingleThreadExecutor(new CustomPriorityThreadFactory(1));
  }
  
  private void filterList(List<String> paramList)
  {
    logger.log("filterList. original size: %d", new Object[] { Integer.valueOf(paramList.size()) });
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      String str = (String)paramList.next();
      if ((mInventory.hasPurchase(str)) || (mInventory.hasDetails(str))) {
        paramList.remove();
      }
    }
  }
  
  private Observable<Inventory> queryInternal(final List<String> paramList)
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super Inventory> paramAnonymousSubscriber)
      {
        GoogleBillingContentManager.logger.verbose("queryInternal. list size: %d, thread: %s", new Object[] { Integer.valueOf(paramList.size()), Thread.currentThread() });
        SystemUtils.throwIfUiThread();
        GoogleBillingContentManager.this.filterList(paramList);
        GoogleBillingContentManager.logger.verbose("list size is now: %d", new Object[] { Integer.valueOf(paramList.size()) });
        try
        {
          if ((paramList.size() > 0) && (isConnected()))
          {
            Inventory localInventory = helper.queryInventory(true, paramList, null);
            mInventory.addAll(localInventory);
          }
          if (!paramAnonymousSubscriber.isUnsubscribed())
          {
            paramAnonymousSubscriber.onNext(mInventory);
            paramAnonymousSubscriber.onCompleted();
          }
          return;
        }
        catch (IabException localIabException)
        {
          for (;;)
          {
            localIabException.printStackTrace();
          }
        }
      }
    }).subscribeOn(Schedulers.from(mSingleExecutor));
  }
  
  private Observable<Inventory> queryPurchasesInternal()
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super Inventory> paramAnonymousSubscriber)
      {
        GoogleBillingContentManager.logger.verbose("queryPurchasesInternal: %s", new Object[] { Thread.currentThread() });
        SystemUtils.throwIfUiThread();
        try
        {
          if (isConnected())
          {
            Inventory localInventory = helper.queryInventory(false, null);
            mInventory.addAll(localInventory);
          }
          if (!paramAnonymousSubscriber.isUnsubscribed())
          {
            paramAnonymousSubscriber.onNext(mInventory);
            paramAnonymousSubscriber.onCompleted();
          }
          return;
        }
        catch (Exception localException)
        {
          do
          {
            localException.printStackTrace();
          } while (paramAnonymousSubscriber.isUnsubscribed());
          paramAnonymousSubscriber.onError(localException);
        }
      }
    }).subscribeOn(Schedulers.from(mSingleExecutor));
  }
  
  private void startSetupInternal(final Subscriber<? super IabResult> paramSubscriber)
  {
    logger.verbose("startSetupInternal: %s", new Object[] { Thread.currentThread() });
    SystemUtils.throwIfUiThread();
    try
    {
      mSetupLock.acquire();
      if (helper.isDisposed())
      {
        if (!paramSubscriber.isUnsubscribed()) {
          paramSubscriber.onError(new IllegalStateException("IABHelperDisposed"));
        }
        mSetupLock.release();
        return;
      }
      if (helper.isSetupDone())
      {
        if (!paramSubscriber.isUnsubscribed())
        {
          paramSubscriber.onNext(mResult);
          paramSubscriber.onCompleted();
        }
        mSetupLock.release();
        return;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      localInterruptedException.printStackTrace();
      paramSubscriber.onError(localInterruptedException);
      return;
    }
    helper.startSetup(new IabHelper.OnIabSetupFinishedListener()
    {
      public void onIabSetupFinished(IabResult paramAnonymousIabResult)
      {
        GoogleBillingContentManager.logger.log("onIabSetupFinished: %s", new Object[] { paramAnonymousIabResult });
        GoogleBillingContentManager.access$402(GoogleBillingContentManager.this, paramAnonymousIabResult);
        if (!paramSubscriber.isUnsubscribed())
        {
          paramSubscriber.onNext(paramAnonymousIabResult);
          paramSubscriber.onCompleted();
        }
        mSetupLock.release();
      }
    });
  }
  
  public void dispose()
  {
    logger.info("dispose");
    helper.dispose();
    mSingleExecutor.shutdown();
  }
  
  public boolean handleActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    return (helper.isAvailable()) && (helper.handleActivityResult(paramInt1, paramInt2, paramIntent));
  }
  
  public boolean isConnected()
  {
    return (isSetupDone()) && (mResult != null) && (mResult.isSuccess());
  }
  
  public boolean isSetupDone()
  {
    return helper.isSetupDone();
  }
  
  public Observable<Pair> launchPurchaseFlow(final Activity paramActivity, final int paramInt, final String paramString)
  {
    Observable.concat(startSetup(), Observable.create(new Observable.OnSubscribe()
    {
      public void call(final Subscriber<? super Pair<IabResult, Purchase>> paramAnonymousSubscriber)
      {
        GoogleBillingContentManager.logger.log("launchPurchaseFlow: %s", new Object[] { paramString });
        SystemUtils.throwIfNonUiThread();
        if (!helper.isAvailable())
        {
          paramAnonymousSubscriber.onError(new IabException(64528, "Unknow Error"));
          return;
        }
        try
        {
          helper.launchPurchaseFlow(paramActivity, paramString, paramInt, new IabHelper.OnIabPurchaseFinishedListener()
          {
            public void onIabPurchaseFinished(IabResult paramAnonymous2IabResult, Purchase paramAnonymous2Purchase)
            {
              GoogleBillingContentManager.logger.log("onIabPurchaseFinished: result=%s, info=%s", new Object[] { paramAnonymous2IabResult, paramAnonymous2Purchase });
              if ((paramAnonymous2IabResult != null) && (paramAnonymous2Purchase != null) && (paramAnonymous2IabResult.isSuccess()))
              {
                GoogleBillingContentManager.logger.verbose("adding purchase to inventory", new Object[0]);
                mInventory.addPurchase(paramAnonymous2Purchase);
              }
              paramAnonymousSubscriber.onNext(Pair.create(paramAnonymous2IabResult, paramAnonymous2Purchase));
              paramAnonymousSubscriber.onCompleted();
            }
          });
          return;
        }
        catch (IllegalStateException localIllegalStateException)
        {
          localIllegalStateException.printStackTrace();
          paramAnonymousSubscriber.onError(localIllegalStateException);
        }
      }
    }).subscribeOn(AndroidSchedulers.mainThread())).elementAt(1).cast(Pair.class);
  }
  
  public Observable<Inventory> queryPurchases()
  {
    logger.log("queryPurchases");
    return Observable.concat(startSetup(), queryPurchasesInternal()).elementAt(1).cast(Inventory.class);
  }
  
  public Observable<Inventory> querySkus(List<String> paramList)
  {
    logger.log("querySkus");
    return Observable.concat(startSetup(), queryInternal(paramList)).elementAt(1).cast(Inventory.class);
  }
  
  public Observable<IabResult> startSetup()
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super IabResult> paramAnonymousSubscriber)
      {
        GoogleBillingContentManager.this.startSetupInternal(paramAnonymousSubscriber);
      }
    });
  }
}
