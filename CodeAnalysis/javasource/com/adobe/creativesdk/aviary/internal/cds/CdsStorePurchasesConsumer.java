package com.adobe.creativesdk.aviary.internal.cds;

import android.content.Context;
import com.adobe.creativesdk.aviary.internal.account.BillingContentFactory;
import com.adobe.creativesdk.aviary.internal.account.BillingContentFactory.StoreType;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import rx.Observable;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.schedulers.Schedulers;

public final class CdsStorePurchasesConsumer
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsStorePurchasesConsumer");
  private final Context mContext;
  private final List<Exception> mExceptions;
  private final Object mLock = new Object();
  private final LinkedHashSet<String> mPurchases = new LinkedHashSet();
  
  private CdsStorePurchasesConsumer(Context paramContext)
  {
    mContext = paramContext;
    mExceptions = new ArrayList();
  }
  
  private void queryAdobePurchases(final BillingContentFactory paramBillingContentFactory)
  {
    logger.info("queryAdobePurchases");
    paramBillingContentFactory.queryPurchases(BillingContentFactory.StoreType.Adobe).observeOn(Schedulers.newThread()).subscribeOn(Schedulers.newThread()).subscribe(new Action1()new Action1
    {
      public void call(List<String> arg1)
      {
        LoggerFactory.Logger localLogger = CdsStorePurchasesConsumer.logger;
        if (??? != null) {}
        for (int i = ???.size();; i = 0)
        {
          localLogger.log("[adobe] query purchases result: %d", new Object[] { Integer.valueOf(i) });
          if (??? != null) {
            mPurchases.addAll(???);
          }
          synchronized (mLock)
          {
            mLock.notify();
            paramBillingContentFactory.dispose();
            return;
          }
        }
      }
    }, new Action1()
    {
      public void call(Throwable arg1)
      {
        CdsStorePurchasesConsumer.logger.error("[adobe] query purchases error: %s", new Object[] { ???.getMessage() });
        mExceptions.add(new Exception(???));
        synchronized (mLock)
        {
          mLock.notify();
          paramBillingContentFactory.dispose();
          return;
        }
      }
    });
  }
  
  private void queryGooglePurchases(final BillingContentFactory paramBillingContentFactory)
  {
    logger.info("queryGooglePurchases");
    paramBillingContentFactory.queryPurchases(BillingContentFactory.StoreType.Google).observeOn(Schedulers.newThread()).subscribeOn(Schedulers.newThread()).subscribe(new Action1()new Action1
    {
      public void call(List<String> paramAnonymousList)
      {
        LoggerFactory.Logger localLogger = CdsStorePurchasesConsumer.logger;
        if (paramAnonymousList != null) {}
        for (int i = paramAnonymousList.size();; i = 0)
        {
          localLogger.log("[google] query purchases result: %d", new Object[] { Integer.valueOf(i) });
          if (paramAnonymousList != null) {
            mPurchases.addAll(paramAnonymousList);
          }
          return;
        }
      }
    }, new Action1()new Action0
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        CdsStorePurchasesConsumer.logger.error("[google] query purchases error: %s", new Object[] { paramAnonymousThrowable.getMessage() });
        mExceptions.add(new Exception(paramAnonymousThrowable));
        CdsStorePurchasesConsumer.this.queryAdobePurchases(paramBillingContentFactory);
      }
    }, new Action0()
    {
      public void call()
      {
        CdsStorePurchasesConsumer.this.queryAdobePurchases(paramBillingContentFactory);
      }
    });
  }
  
  public HashSet<String> consume()
  {
    logger.log("consume");
    SystemUtils.throwIfUiThread();
    synchronized (mLock)
    {
      queryPurchases();
      try
      {
        mLock.wait();
        logger.log("computation completed!");
        if (mPurchases != null) {
          return mPurchases;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
      }
    }
    return null;
  }
  
  public List<Exception> getExceptions()
  {
    return mExceptions;
  }
  
  public void queryPurchases()
  {
    queryGooglePurchases(BillingContentFactory.create(mContext));
  }
  
  static class Builder
  {
    private Context context;
    
    Builder(Context paramContext)
    {
      context = paramContext;
    }
    
    CdsStorePurchasesConsumer build()
    {
      if (context == null) {
        throw new IllegalArgumentException("Context is null");
      }
      return new CdsStorePurchasesConsumer(context, null);
    }
  }
}
