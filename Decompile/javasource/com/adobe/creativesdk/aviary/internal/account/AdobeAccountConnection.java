package com.adobe.creativesdk.aviary.internal.account;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.AdobeImageBillingService.MyBinder;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Action1;
import rx.schedulers.Schedulers;
import rx.subjects.PublishSubject;

public class AdobeAccountConnection
{
  private PublishSubject<AdobeImageBillingService> connectionSubject = PublishSubject.create();
  private Context context;
  private LoggerFactory.Logger logger = LoggerFactory.getLogger("AdobeAccountConnection");
  private boolean mConnected;
  private boolean mConnecting;
  private boolean mDisposed;
  final Executor mExecutor = Executors.newSingleThreadExecutor();
  private Semaphore mSemaphore = new Semaphore(1);
  private AdobeImageBillingService mService;
  private ServiceConnection mServiceConnection;
  
  public AdobeAccountConnection(Context paramContext)
  {
    context = paramContext;
  }
  
  public void dispose()
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super Object> paramAnonymousSubscriber)
      {
        logger.verbose("dispose.start: %s", new Object[] { Thread.currentThread() });
        for (;;)
        {
          try
          {
            mSemaphore.acquire();
            if (mDisposed)
            {
              mSemaphore.release();
              if (paramAnonymousSubscriber.isUnsubscribed()) {
                return;
              }
              paramAnonymousSubscriber.onError(new IllegalStateException("Already disposed"));
              return;
            }
            ServiceConnection localServiceConnection = mServiceConnection;
            if (localServiceConnection == null) {}
          }
          catch (InterruptedException paramAnonymousSubscriber)
          {
            paramAnonymousSubscriber.printStackTrace();
            continue;
          }
          try
          {
            context.unbindService(mServiceConnection);
            AdobeAccountConnection.access$702(AdobeAccountConnection.this, null);
            AdobeAccountConnection.access$502(AdobeAccountConnection.this, true);
            AdobeAccountConnection.access$802(AdobeAccountConnection.this, null);
            mSemaphore.release();
            if (paramAnonymousSubscriber.isUnsubscribed())
            {
              paramAnonymousSubscriber.onNext(null);
              paramAnonymousSubscriber.onCompleted();
            }
            logger.verbose("dispose.end", new Object[0]);
            return;
          }
          catch (Throwable localThrowable)
          {
            localThrowable.printStackTrace();
          }
        }
      }
    }).subscribeOn(Schedulers.from(mExecutor)).subscribe(new Action1()new Action1
    {
      public void call(Object paramAnonymousObject)
      {
        logger.verbose("disposed!", new Object[0]);
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        logger.error("exception during disposal...");
      }
    });
  }
  
  public AdobeImageBillingService getService()
  {
    return mService;
  }
  
  public boolean isConnected()
  {
    return mConnected;
  }
  
  public Observable<AdobeImageBillingService> tryConnect()
  {
    logger.log("tryConnect");
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(final Subscriber<? super AdobeImageBillingService> paramAnonymousSubscriber)
      {
        logger.verbose("connect.start: %s", new Object[] { Thread.currentThread() });
        SystemUtils.throwIfUiThread();
        if (mConnected)
        {
          logger.verbose("already connected...", new Object[0]);
          connectionSubject.onNext(mService);
          if (!paramAnonymousSubscriber.isUnsubscribed())
          {
            paramAnonymousSubscriber.onNext(mService);
            paramAnonymousSubscriber.onCompleted();
          }
          return;
        }
        try
        {
          mSemaphore.acquire();
          if (mDisposed)
          {
            if (!paramAnonymousSubscriber.isUnsubscribed()) {
              paramAnonymousSubscriber.onError(new IllegalStateException("Already disposed"));
            }
            connectionSubject.onError(new IllegalStateException("Already disposed"));
            mSemaphore.release();
            return;
          }
        }
        catch (InterruptedException paramAnonymousSubscriber)
        {
          paramAnonymousSubscriber.printStackTrace();
          return;
        }
        if (mConnecting)
        {
          logger.warn("already trying to connect...");
          mSemaphore.release();
          return;
        }
        if (mService != null)
        {
          logger.warn("already connected. Return current connection");
          connectionSubject.onNext(mService);
          if (!paramAnonymousSubscriber.isUnsubscribed())
          {
            paramAnonymousSubscriber.onNext(mService);
            paramAnonymousSubscriber.onCompleted();
          }
          mSemaphore.release();
          logger.verbose("connect.end", new Object[0]);
          return;
        }
        AdobeAccountConnection.access$602(AdobeAccountConnection.this, true);
        AdobeAccountConnection.access$702(AdobeAccountConnection.this, new ServiceConnection()
        {
          public void onServiceConnected(ComponentName paramAnonymous2ComponentName, IBinder paramAnonymous2IBinder)
          {
            logger.verbose("--- connect.onConnected", new Object[0]);
            AdobeAccountConnection.access$202(AdobeAccountConnection.this, ((AdobeImageBillingService.MyBinder)paramAnonymous2IBinder).getService());
            AdobeAccountConnection.access$602(AdobeAccountConnection.this, false);
            AdobeAccountConnection.access$102(AdobeAccountConnection.this, true);
            connectionSubject.onNext(mService);
            if (!paramAnonymousSubscriber.isUnsubscribed())
            {
              paramAnonymousSubscriber.onNext(mService);
              paramAnonymousSubscriber.onCompleted();
            }
            mSemaphore.release();
          }
          
          public void onServiceDisconnected(ComponentName paramAnonymous2ComponentName)
          {
            logger.verbose("--- connect.onDisconnected", new Object[0]);
            AdobeAccountConnection.access$602(AdobeAccountConnection.this, false);
            AdobeAccountConnection.access$102(AdobeAccountConnection.this, false);
            connectionSubject.onNext(null);
            if (!paramAnonymousSubscriber.isUnsubscribed())
            {
              paramAnonymousSubscriber.onNext(null);
              paramAnonymousSubscriber.onCompleted();
            }
          }
        });
        paramAnonymousSubscriber = AdobeImageIntent.createAccountManagerIntent(context);
        context.bindService(paramAnonymousSubscriber, mServiceConnection, 1);
        logger.verbose("connect.end", new Object[0]);
      }
    }).observeOn(AndroidSchedulers.mainThread()).subscribeOn(Schedulers.from(mExecutor));
  }
}
