package com.adobe.creativesdk.aviary.internal.account;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.CustomPriorityThreadFactory;
import com.adobe.creativesdk.foundation.auth.AdobeAuthErrorCode;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.auth.AdobeAuthSessionLauncher.Builder;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthManager;
import com.adobe.creativesdk.foundation.internal.auth.IAdobeAuthLoginObserver;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.schedulers.Schedulers;

class AdobeBillingContentManager
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger(AdobeBillingContentManager.class.getSimpleName());
  private String[] mCheckedArray = new String[0];
  private Context mContext;
  private boolean mDisposed;
  private final AdobeInventory mInventory;
  private final Object mLock = new Object();
  private LoginClient mLoginClient;
  private AdobeAuthManager mManager;
  private boolean mSetupDone;
  private final ExecutorService mSingleExecutor;
  
  public AdobeBillingContentManager(Context paramContext)
  {
    mContext = paramContext;
    mSingleExecutor = Executors.newSingleThreadExecutor(new CustomPriorityThreadFactory(1));
    mInventory = new AdobeInventory();
  }
  
  private void filterList(List<String> arg1)
  {
    logger.log("filterList. original size: %d", new Object[] { Integer.valueOf(???.size()) });
    Iterator localIterator = ???.iterator();
    for (;;)
    {
      String str;
      synchronized (mInventory)
      {
        if (!localIterator.hasNext()) {
          break;
        }
        str = (String)localIterator.next();
        if (mInventory.hasPurchase(str)) {
          localIterator.remove();
        }
      }
      if (Arrays.binarySearch(mCheckedArray, str) > -1) {
        localObject.remove();
      }
    }
  }
  
  private String getUserId()
  {
    throwIfDisposed();
    throwIfSetupNotDone();
    AdobeAuthUserProfile localAdobeAuthUserProfile = mManager.getUserProfile();
    if (localAdobeAuthUserProfile != null) {
      return localAdobeAuthUserProfile.getAdobeID();
    }
    return null;
  }
  
  private void mergeArray(Collection<String> paramCollection)
  {
    HashSet localHashSet = new HashSet(Arrays.asList(mCheckedArray));
    localHashSet.addAll(paramCollection);
    paramCollection = new ArrayList(localHashSet);
    Collections.sort(paramCollection);
    mCheckedArray = ((String[])paramCollection.toArray(new String[paramCollection.size()]));
    logger.verbose("cache map size %d", new Object[] { Integer.valueOf(mCheckedArray.length) });
  }
  
  private void mergeArrays(Collection<String[]> paramCollection)
  {
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      String[] arrayOfString = (String[])paramCollection.next();
      if ((arrayOfString != null) && (arrayOfString.length > 0)) {
        mergeArray(Arrays.asList(arrayOfString));
      }
    }
  }
  
  private Observable<AdobeInventory> queryInternal(final List<String> paramList)
  {
    Observable.create(new Observable.OnSubscribe()
    {
      /* Error */
      public void call(Subscriber<? super AdobeInventory> paramAnonymousSubscriber)
      {
        // Byte code:
        //   0: getstatic 39	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
        //   3: astore_3
        //   4: aload_0
        //   5: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   8: ifnull +77 -> 85
        //   11: aload_0
        //   12: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   15: invokeinterface 45 1 0
        //   20: istore_2
        //   21: aload_3
        //   22: ldc 47
        //   24: iconst_2
        //   25: anewarray 5	java/lang/Object
        //   28: dup
        //   29: iconst_0
        //   30: iload_2
        //   31: invokestatic 53	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   34: aastore
        //   35: dup
        //   36: iconst_1
        //   37: invokestatic 59	java/lang/Thread:currentThread	()Ljava/lang/Thread;
        //   40: aastore
        //   41: invokeinterface 65 3 0
        //   46: invokestatic 70	com/adobe/creativesdk/aviary/internal/utils/SystemUtils:throwIfUiThread	()V
        //   49: aload_0
        //   50: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   53: invokestatic 74	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$100	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
        //   56: invokevirtual 80	com/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager:isAuthenticated	()Z
        //   59: ifne +31 -> 90
        //   62: aload_1
        //   63: invokevirtual 83	rx/Subscriber:isUnsubscribed	()Z
        //   66: ifne +18 -> 84
        //   69: aload_1
        //   70: aload_0
        //   71: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   74: invokestatic 87	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$200	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
        //   77: invokevirtual 90	rx/Subscriber:onNext	(Ljava/lang/Object;)V
        //   80: aload_1
        //   81: invokevirtual 93	rx/Subscriber:onCompleted	()V
        //   84: return
        //   85: iconst_0
        //   86: istore_2
        //   87: goto -66 -> 21
        //   90: aload_0
        //   91: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   94: ifnull +43 -> 137
        //   97: aload_0
        //   98: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   101: aload_0
        //   102: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   105: invokestatic 96	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$400	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/List;)V
        //   108: getstatic 39	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
        //   111: ldc 98
        //   113: iconst_1
        //   114: anewarray 5	java/lang/Object
        //   117: dup
        //   118: iconst_0
        //   119: aload_0
        //   120: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   123: invokeinterface 45 1 0
        //   128: invokestatic 53	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   131: aastore
        //   132: invokeinterface 65 3 0
        //   137: aload_0
        //   138: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   141: ifnull +32 -> 173
        //   144: getstatic 39	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
        //   147: ldc 100
        //   149: iconst_1
        //   150: anewarray 5	java/lang/Object
        //   153: dup
        //   154: iconst_0
        //   155: aload_0
        //   156: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   159: invokeinterface 45 1 0
        //   164: invokestatic 53	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
        //   167: aastore
        //   168: invokeinterface 65 3 0
        //   173: aload_0
        //   174: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   177: ifnull +17 -> 194
        //   180: aload_0
        //   181: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   184: invokeinterface 45 1 0
        //   189: istore_2
        //   190: iload_2
        //   191: ifle +95 -> 286
        //   194: aconst_null
        //   195: astore 4
        //   197: aload 4
        //   199: astore_3
        //   200: aload_0
        //   201: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   204: invokestatic 104	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$500	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/String;
        //   207: ifnull +31 -> 238
        //   210: aload_0
        //   211: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   214: invokestatic 108	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$000	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;
        //   217: aload_0
        //   218: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   221: invokestatic 108	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$000	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;
        //   224: invokevirtual 114	android/content/Context:getPackageName	()Ljava/lang/String;
        //   227: aload_0
        //   228: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   231: invokestatic 104	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$500	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/String;
        //   234: invokestatic 120	com/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils:queryPurchases	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;
        //   237: astore_3
        //   238: aload_3
        //   239: ifnull +47 -> 286
        //   242: aload_0
        //   243: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   246: invokestatic 87	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$200	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
        //   249: astore 4
        //   251: aload 4
        //   253: monitorenter
        //   254: aload_0
        //   255: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   258: ifnull +63 -> 321
        //   261: aload_0
        //   262: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   265: aload_0
        //   266: getfield 22	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:val$skus	Ljava/util/List;
        //   269: invokestatic 124	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$600	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V
        //   272: aload_0
        //   273: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   276: invokestatic 87	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$200	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
        //   279: aload_3
        //   280: invokevirtual 130	com/adobe/creativesdk/aviary/internal/account/AdobeInventory:addAll	(Ljava/util/HashMap;)V
        //   283: aload 4
        //   285: monitorexit
        //   286: aload_1
        //   287: aload_0
        //   288: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   291: invokestatic 87	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$200	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
        //   294: invokevirtual 90	rx/Subscriber:onNext	(Ljava/lang/Object;)V
        //   297: aload_1
        //   298: invokevirtual 93	rx/Subscriber:onCompleted	()V
        //   301: return
        //   302: astore_3
        //   303: aload_3
        //   304: invokevirtual 133	java/lang/Exception:printStackTrace	()V
        //   307: aload 4
        //   309: astore_3
        //   310: goto -72 -> 238
        //   313: astore_3
        //   314: aload_3
        //   315: invokevirtual 133	java/lang/Exception:printStackTrace	()V
        //   318: goto -32 -> 286
        //   321: aload_0
        //   322: getfield 20	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2:this$0	Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;
        //   325: aload_3
        //   326: invokevirtual 139	java/util/HashMap:values	()Ljava/util/Collection;
        //   329: invokestatic 142	com/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager:access$700	(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V
        //   332: goto -60 -> 272
        //   335: astore_3
        //   336: aload 4
        //   338: monitorexit
        //   339: aload_3
        //   340: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	341	0	this	2
        //   0	341	1	paramAnonymousSubscriber	Subscriber<? super AdobeInventory>
        //   20	171	2	i	int
        //   3	277	3	localObject1	Object
        //   302	2	3	localException1	Exception
        //   309	1	3	localObject2	Object
        //   313	13	3	localException2	Exception
        //   335	5	3	localObject3	Object
        // Exception table:
        //   from	to	target	type
        //   200	238	302	java/lang/Exception
        //   137	173	313	java/lang/Exception
        //   173	190	313	java/lang/Exception
        //   242	254	313	java/lang/Exception
        //   303	307	313	java/lang/Exception
        //   339	341	313	java/lang/Exception
        //   254	272	335	finally
        //   272	286	335	finally
        //   321	332	335	finally
        //   336	339	335	finally
      }
    }).subscribeOn(Schedulers.from(mSingleExecutor));
  }
  
  private void throwIfDisposed()
  {
    if (mDisposed) {
      throw new IllegalStateException("AdobeAccountManager already disposed");
    }
  }
  
  private void throwIfSetupNotDone()
  {
    synchronized (mLock)
    {
      if (!mSetupDone) {
        throw new IllegalStateException("Setup already done");
      }
    }
  }
  
  public Observable<Object> clearInventory()
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super Object> paramAnonymousSubscriber)
      {
        AdobeBillingContentManager.logger.log("clearInventory: %s", new Object[] { Thread.currentThread() });
        synchronized (mInventory)
        {
          mInventory.clear();
          AdobeBillingContentManager.access$302(AdobeBillingContentManager.this, new String[0]);
          paramAnonymousSubscriber.onNext(null);
          paramAnonymousSubscriber.onCompleted();
          return;
        }
      }
    }).subscribeOn(Schedulers.from(mSingleExecutor));
  }
  
  public void dispose()
  {
    mDisposed = true;
    mContext = null;
    mSingleExecutor.shutdown();
  }
  
  public AdobeAuthUserProfile getUserProfile()
  {
    throwIfDisposed();
    throwIfSetupNotDone();
    return mManager.getUserProfile();
  }
  
  public boolean isAuthenticated()
  {
    throwIfDisposed();
    throwIfSetupNotDone();
    return mManager.isAuthenticated();
  }
  
  public boolean isSetupDone()
  {
    synchronized (mLock)
    {
      boolean bool = mSetupDone;
      return bool;
    }
  }
  
  public void login(Activity paramActivity, Bundle paramBundle)
  {
    logger.log("login");
    throwIfDisposed();
    throwIfSetupNotDone();
    paramActivity = new AdobeAuthSessionLauncher.Builder().withActivity(paramActivity).build();
    if (mLoginClient != null) {}
    try
    {
      mManager.unregisterLoginClient(mLoginClient);
      mLoginClient = new LoginClient(paramBundle);
      mManager.registerLoginClient(mLoginClient);
      mManager.login(paramActivity);
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      for (;;) {}
    }
  }
  
  public Observable<AdobeInventory> queryPurchases()
  {
    return Observable.concat(startSetup(), queryInternal(null)).elementAt(1).cast(AdobeInventory.class);
  }
  
  public Observable<AdobeInventory> querySkus(ArrayList<String> paramArrayList)
  {
    return Observable.concat(startSetup(), queryInternal(paramArrayList)).elementAt(1).cast(AdobeInventory.class);
  }
  
  public void signUp(Activity paramActivity, Bundle paramBundle)
  {
    logger.log("signUp");
    throwIfDisposed();
    throwIfSetupNotDone();
    paramActivity = new AdobeAuthSessionLauncher.Builder().withActivity(paramActivity).build();
    if (mLoginClient != null) {}
    try
    {
      mManager.unregisterLoginClient(mLoginClient);
      mLoginClient = new LoginClient(paramBundle);
      mManager.registerLoginClient(mLoginClient);
      mManager.promptForSignUp(paramActivity);
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      for (;;) {}
    }
  }
  
  public Observable<AccountResult> startSetup()
  {
    Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super AccountResult> paramAnonymousSubscriber)
      {
        AdobeBillingContentManager.logger.log("startSetup: %s", new Object[] { Thread.currentThread() });
        SystemUtils.throwIfUiThread();
        if (paramAnonymousSubscriber.isUnsubscribed()) {
          return;
        }
        AdobeBillingContentManager.this.throwIfDisposed();
        for (;;)
        {
          synchronized (mLock)
          {
            if (mSetupDone)
            {
              paramAnonymousSubscriber.onNext(new AccountResult());
              paramAnonymousSubscriber.onCompleted();
              return;
            }
          }
          AdobeBillingContentManager.access$102(AdobeBillingContentManager.this, AdobeAuthManager.sharedAuthManager());
          paramAnonymousSubscriber.onNext(new AccountResult());
          paramAnonymousSubscriber.onCompleted();
          AdobeBillingContentManager.access$1002(AdobeBillingContentManager.this, true);
        }
      }
    });
  }
  
  class LoginClient
    implements IAdobeAuthLoginObserver
  {
    private final Bundle options;
    
    public LoginClient(Bundle paramBundle)
    {
      options = paramBundle;
    }
    
    public void onError(AdobeAuthException paramAdobeAuthException)
    {
      if (mContext == null) {
        return;
      }
      AdobeBillingContentManager.logger.error("Login::onError");
      Intent localIntent = new Intent(mContext.getPackageName() + ".adobeId.user.signin");
      localIntent.putExtra("error", paramAdobeAuthException.getErrorCode().ordinal());
      localIntent.putExtra("options", options);
      try
      {
        mManager.unregisterLoginClient(this);
        paramAdobeAuthException.printStackTrace();
        return;
      }
      catch (NullPointerException localNullPointerException)
      {
        for (;;) {}
      }
    }
    
    public void onSuccess(AdobeAuthUserProfile paramAdobeAuthUserProfile)
    {
      if (mContext == null) {
        return;
      }
      AdobeBillingContentManager.logger.info("Login::onSuccess: %s", new Object[] { paramAdobeAuthUserProfile });
      Intent localIntent = new Intent(mContext.getPackageName() + ".adobeId.user.signin");
      localIntent.putExtra("error", AdobeAuthErrorCode.ADOBE_AUTH_ERROR_CODE_NO_ERROR.ordinal());
      localIntent.putExtra("user", paramAdobeAuthUserProfile);
      localIntent.putExtra("options", options);
      mContext.sendBroadcast(localIntent);
      try
      {
        mManager.unregisterLoginClient(this);
        return;
      }
      catch (NullPointerException paramAdobeAuthUserProfile) {}
    }
  }
}
