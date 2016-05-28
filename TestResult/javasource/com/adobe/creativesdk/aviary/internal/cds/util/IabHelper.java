package com.adobe.creativesdk.aviary.internal.cds.util;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.utils.Objects;
import com.android.vending.billing.IInAppBillingService;
import com.android.vending.billing.IInAppBillingService.Stub;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;

public class IabHelper
{
  String mAsyncOperation = "";
  Context mContext;
  boolean mDebugLog = true;
  String mDebugTag = "IabHelper";
  boolean mDisposed = false;
  OnIabPurchaseFinishedListener mPurchaseListener;
  String mPurchasingItemType;
  int mRequestCode;
  IInAppBillingService mService;
  ServiceConnection mServiceConn;
  boolean mSetupDone = false;
  String mSignatureBase64 = null;
  boolean mSubscriptionsSupported = false;
  
  public IabHelper(Context paramContext, String paramString)
  {
    mContext = paramContext.getApplicationContext();
    mSignatureBase64 = paramString;
    logDebug("IAB helper created.");
  }
  
  private void checkNotDisposed()
  {
    if (mDisposed) {
      throw new IllegalStateException("IabHelper was disposed of, so it cannot be used.");
    }
  }
  
  public static String getResponseDesc(int paramInt)
  {
    String[] arrayOfString1 = "0:OK/1:User Canceled/2:Unknown/3:Billing Unavailable/4:Item unavailable/5:Developer Error/6:Error/7:Item Already Owned/8:Item not owned".split("/");
    String[] arrayOfString2 = "0:OK/-1001:Remote exception during initialization/-1002:Bad response received/-1003:Purchase signature verification failed/-1004:Send intent failed/-1005:User cancelled/-1006:Unknown purchase response/-1007:Missing token/-1008:Unknown error/-1009:Subscriptions not available/-1010:Invalid consumption attempt".split("/");
    if (paramInt <= 64536)
    {
      int i = 64536 - paramInt;
      if ((i >= 0) && (i < arrayOfString2.length)) {
        return arrayOfString2[i];
      }
      return String.valueOf(paramInt) + ":Unknown IAB Helper Error";
    }
    if ((paramInt < 0) || (paramInt >= arrayOfString1.length)) {
      return String.valueOf(paramInt) + ":Unknown";
    }
    return arrayOfString1[paramInt];
  }
  
  void checkSetupDone(String paramString)
  {
    if (!mSetupDone)
    {
      logError("Illegal state for operation (" + paramString + "): IAB helper is not set up.");
      throw new IllegalStateException("IAB helper is not set up. Can't perform operation: " + paramString);
    }
  }
  
  public void dispose()
  {
    logDebug("Disposing.");
    mSetupDone = false;
    if (mServiceConn != null)
    {
      logDebug("Unbinding from service.");
      if (mContext == null) {}
    }
    try
    {
      mContext.unbindService(mServiceConn);
      mDisposed = true;
      mContext = null;
      mServiceConn = null;
      mService = null;
      mPurchaseListener = null;
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        localThrowable.printStackTrace();
      }
    }
  }
  
  void flagEndAsync()
  {
    logDebug("Ending async operation: " + mAsyncOperation);
    mAsyncOperation = "";
  }
  
  void flagStartAsync(String paramString)
  {
    if (Objects.equal(paramString, mAsyncOperation)) {
      throw new IllegalStateException("Can't start async operation (" + paramString + ") because another async operation(" + mAsyncOperation + ") is in progress.");
    }
    mAsyncOperation = paramString;
    logDebug("Starting async operation: " + paramString);
  }
  
  int getResponseCodeFromBundle(Bundle paramBundle)
  {
    paramBundle = paramBundle.get("RESPONSE_CODE");
    if (paramBundle == null)
    {
      logDebug("Bundle with null response code, assuming OK (known issue)");
      return 0;
    }
    if ((paramBundle instanceof Integer)) {
      return ((Integer)paramBundle).intValue();
    }
    if ((paramBundle instanceof Long)) {
      return (int)((Long)paramBundle).longValue();
    }
    logError("Unexpected type for bundle response code.");
    logError(paramBundle.getClass().getName());
    throw new RuntimeException("Unexpected type for bundle response code: " + paramBundle.getClass().getName());
  }
  
  int getResponseCodeFromIntent(Intent paramIntent)
  {
    paramIntent = paramIntent.getExtras().get("RESPONSE_CODE");
    if (paramIntent == null)
    {
      logError("Intent with no response code, assuming OK (known issue)");
      return 0;
    }
    if ((paramIntent instanceof Integer)) {
      return ((Integer)paramIntent).intValue();
    }
    if ((paramIntent instanceof Long)) {
      return (int)((Long)paramIntent).longValue();
    }
    logError("Unexpected type for intent response code.");
    logError(paramIntent.getClass().getName());
    throw new RuntimeException("Unexpected type for intent response code: " + paramIntent.getClass().getName());
  }
  
  public boolean handleActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    logDebug("handleActivityResult: " + paramInt1);
    if ((paramInt1 != mRequestCode) || (paramInt1 == 0)) {
      return false;
    }
    checkNotDisposed();
    checkSetupDone("handleActivityResult");
    flagEndAsync();
    if ((paramIntent == null) || (paramIntent.getExtras() == null))
    {
      logError("Null data in IAB activity result.");
      paramIntent = new IabResult(64534, "Null data in IAB result");
      if (mPurchaseListener != null) {
        mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
      }
      return true;
    }
    paramInt1 = getResponseCodeFromIntent(paramIntent);
    Object localObject = paramIntent.getStringExtra("INAPP_PURCHASE_DATA");
    String str1 = paramIntent.getStringExtra("INAPP_DATA_SIGNATURE");
    if ((paramInt2 == -1) && (paramInt1 == 0))
    {
      logDebug("Successful resultcode from purchase activity.");
      logDebug("Purchase data: " + (String)localObject);
      logDebug("Data signature: " + str1);
      logDebug("Extras: " + paramIntent.getExtras());
      logDebug("Expected item type: " + mPurchasingItemType);
      if ((localObject == null) || (str1 == null))
      {
        logError("BUG: either purchaseData or dataSignature is null.");
        logDebug("Extras: " + paramIntent.getExtras().toString());
        paramIntent = new IabResult(64528, "IAB returned null purchaseData or dataSignature");
        if (mPurchaseListener != null) {
          mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
        return true;
      }
    }
    for (;;)
    {
      try
      {
        paramIntent = new Purchase(mPurchasingItemType, (String)localObject, str1);
        String str2;
        logError("Failed to parse purchase data.");
      }
      catch (JSONException paramIntent)
      {
        try
        {
          str2 = paramIntent.getSku();
          if (!Security.verifyPurchase(mSignatureBase64, (String)localObject, str1))
          {
            logError("Purchase signature verification FAILED for sku " + str2);
            localObject = new IabResult(64533, "Signature verification failed for sku " + str2);
            if (mPurchaseListener == null) {
              break;
            }
            mPurchaseListener.onIabPurchaseFinished((IabResult)localObject, paramIntent);
            break;
          }
          logDebug("Purchase signature successfully verified.");
          if (mPurchaseListener != null) {
            mPurchaseListener.onIabPurchaseFinished(new IabResult(0, "Success"), paramIntent);
          }
          return true;
        }
        catch (JSONException paramIntent)
        {
          for (;;) {}
        }
        paramIntent = paramIntent;
      }
      paramIntent.printStackTrace();
      paramIntent = new IabResult(64534, "Failed to parse purchase data.");
      if (mPurchaseListener != null) {
        mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
      }
      return true;
      if (paramInt2 == -1)
      {
        logDebug("Result code was OK but in-app billing response was not OK: " + getResponseDesc(paramInt1));
        if (mPurchaseListener != null)
        {
          paramIntent = new IabResult(paramInt1, "Problem purchashing item.");
          mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
      else if (paramInt2 == 0)
      {
        logDebug("Purchase canceled - Response: " + getResponseDesc(paramInt1));
        paramIntent = new IabResult(64531, "User canceled.");
        if (mPurchaseListener != null) {
          mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
      else
      {
        logError("Purchase failed. Result code: " + Integer.toString(paramInt2) + ". Response: " + getResponseDesc(paramInt1));
        paramIntent = new IabResult(64530, "Unknown purchase response.");
        if (mPurchaseListener != null) {
          mPurchaseListener.onIabPurchaseFinished(paramIntent, null);
        }
      }
    }
    return true;
  }
  
  public boolean isAvailable()
  {
    return (!mDisposed) && (mSetupDone);
  }
  
  public boolean isDisposed()
  {
    return mDisposed;
  }
  
  public boolean isSetupDone()
  {
    return mSetupDone;
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener)
  {
    launchPurchaseFlow(paramActivity, paramString, paramInt, paramOnIabPurchaseFinishedListener, "");
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString1, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener, String paramString2)
  {
    launchPurchaseFlow(paramActivity, paramString1, "inapp", paramInt, paramOnIabPurchaseFinishedListener, paramString2);
  }
  
  public void launchPurchaseFlow(Activity paramActivity, String paramString1, String paramString2, int paramInt, OnIabPurchaseFinishedListener paramOnIabPurchaseFinishedListener, String paramString3)
  {
    checkNotDisposed();
    checkSetupDone("launchPurchaseFlow");
    flagStartAsync("launchPurchaseFlow");
    if ((paramString2.equals("subs")) && (!mSubscriptionsSupported))
    {
      paramActivity = new IabResult(64527, "Subscriptions are not available.");
      flagEndAsync();
      if (paramOnIabPurchaseFinishedListener != null) {
        paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
      }
    }
    do
    {
      for (;;)
      {
        return;
        try
        {
          logDebug("Constructing buy intent for " + paramString1 + ", item type: " + paramString2);
          paramString3 = mService.getBuyIntent(3, mContext.getPackageName(), paramString1, paramString2, paramString3);
          int i = getResponseCodeFromBundle(paramString3);
          if (i != 0)
          {
            logError("Unable to buy item, Error response: " + getResponseDesc(i));
            flagEndAsync();
            paramActivity = new IabResult(i, "Unable to buy item");
            if (paramOnIabPurchaseFinishedListener == null) {
              continue;
            }
            paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
          }
        }
        catch (IntentSender.SendIntentException paramActivity)
        {
          logError("SendIntentException while launching purchase flow for sku " + paramString1);
          paramActivity.printStackTrace();
          flagEndAsync();
          paramActivity = new IabResult(64532, "Failed to send intent.");
          if (paramOnIabPurchaseFinishedListener != null)
          {
            paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
            return;
            paramString3 = (PendingIntent)paramString3.getParcelable("BUY_INTENT");
            logDebug("Launching buy intent for " + paramString1 + ". Request code: " + paramInt);
            mRequestCode = paramInt;
            mPurchaseListener = paramOnIabPurchaseFinishedListener;
            mPurchasingItemType = paramString2;
            paramActivity.startIntentSenderForResult(paramString3.getIntentSender(), paramInt, new Intent(), Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue(), Integer.valueOf(0).intValue());
            return;
          }
        }
        catch (RemoteException paramActivity)
        {
          logError("RemoteException while launching purchase flow for sku " + paramString1);
          paramActivity.printStackTrace();
          flagEndAsync();
          paramActivity = new IabResult(64535, "Remote exception while starting purchase flow");
        }
      }
    } while (paramOnIabPurchaseFinishedListener == null);
    paramOnIabPurchaseFinishedListener.onIabPurchaseFinished(paramActivity, null);
  }
  
  void logDebug(String paramString)
  {
    if (mDebugLog) {
      Log.d(mDebugTag, paramString);
    }
  }
  
  void logError(String paramString)
  {
    Log.e(mDebugTag, "In-app billing error: " + paramString);
  }
  
  void logWarn(String paramString)
  {
    Log.w(mDebugTag, "In-app billing warning: " + paramString);
  }
  
  public Inventory queryInventory(boolean paramBoolean, List<String> paramList)
    throws IabException
  {
    return queryInventory(paramBoolean, paramList, null);
  }
  
  public Inventory queryInventory(boolean paramBoolean, List<String> paramList1, List<String> paramList2)
    throws IabException
  {
    checkNotDisposed();
    checkSetupDone("queryInventory");
    Inventory localInventory;
    int i;
    try
    {
      localInventory = new Inventory();
      i = queryPurchases(localInventory, "inapp");
      if (i != 0) {
        throw new IabException(i, "Error refreshing inventory (querying owned items).");
      }
    }
    catch (RemoteException paramList1)
    {
      throw new IabException(64535, "Remote exception while refreshing inventory.", paramList1);
      if (paramBoolean)
      {
        i = querySkuDetails("inapp", localInventory, paramList1);
        if (i != 0) {
          throw new IabException(i, "Error refreshing inventory (querying prices of items).");
        }
      }
    }
    catch (JSONException paramList1)
    {
      throw new IabException(64534, "Error parsing JSON response while refreshing inventory.", paramList1);
      if (!mSubscriptionsSupported) {
        break label201;
      }
      i = queryPurchases(localInventory, "subs");
      if (i != 0) {
        throw new IabException(i, "Error refreshing inventory (querying owned subscriptions).");
      }
    }
    catch (IllegalStateException paramList1)
    {
      throw new IabException(64528, "Unknown Error", paramList1);
    }
    if (paramBoolean)
    {
      i = querySkuDetails("subs", localInventory, paramList2);
      if (i != 0) {
        throw new IabException(i, "Error refreshing inventory (querying prices of subscriptions).");
      }
    }
    label201:
    return localInventory;
  }
  
  int queryPurchases(Inventory paramInventory, String paramString)
    throws JSONException, RemoteException
  {
    checkNotDisposed();
    logDebug("Querying owned items, item type: " + paramString);
    logDebug("Package name: " + mContext.getPackageName());
    int i = 0;
    Object localObject1 = null;
    int j;
    Object localObject2;
    do
    {
      logDebug("Calling getPurchases with continuation token: " + (String)localObject1);
      localObject1 = mService.getPurchases(3, mContext.getPackageName(), paramString, (String)localObject1);
      j = getResponseCodeFromBundle((Bundle)localObject1);
      logDebug("Owned items response: " + String.valueOf(j));
      if (j != 0)
      {
        logDebug("getPurchases() failed: " + getResponseDesc(j));
        return j;
      }
      if ((!((Bundle)localObject1).containsKey("INAPP_PURCHASE_ITEM_LIST")) || (!((Bundle)localObject1).containsKey("INAPP_PURCHASE_DATA_LIST")) || (!((Bundle)localObject1).containsKey("INAPP_DATA_SIGNATURE_LIST")))
      {
        logError("Bundle returned from getPurchases() doesn't contain required fields.");
        return 64534;
      }
      localObject2 = ((Bundle)localObject1).getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
      ArrayList localArrayList1 = ((Bundle)localObject1).getStringArrayList("INAPP_PURCHASE_DATA_LIST");
      ArrayList localArrayList2 = ((Bundle)localObject1).getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
      int k = 0;
      j = i;
      i = k;
      if (i < localArrayList1.size())
      {
        String str1 = (String)localArrayList1.get(i);
        Object localObject3 = (String)localArrayList2.get(i);
        String str2 = (String)((ArrayList)localObject2).get(i);
        if (Security.verifyPurchase(mSignatureBase64, str1, (String)localObject3))
        {
          logDebug("Sku is owned: " + str2);
          localObject3 = new Purchase(paramString, str1, (String)localObject3);
          if (TextUtils.isEmpty(((Purchase)localObject3).getToken()))
          {
            logWarn("BUG: empty/null token!");
            logDebug("Purchase data: " + str1);
          }
          paramInventory.addPurchase((Purchase)localObject3);
        }
        for (;;)
        {
          i += 1;
          break;
          logWarn("Purchase signature verification **FAILED**. Not adding item.");
          logDebug("   Purchase data: " + str1);
          logDebug("   Signature: " + (String)localObject3);
          j = 1;
        }
      }
      localObject2 = ((Bundle)localObject1).getString("INAPP_CONTINUATION_TOKEN");
      logDebug("Continuation token: " + (String)localObject2);
      localObject1 = localObject2;
      i = j;
    } while (!TextUtils.isEmpty((CharSequence)localObject2));
    if (j != 0) {}
    for (i = 64533;; i = 0) {
      return i;
    }
  }
  
  int querySkuDetails(String paramString, Inventory paramInventory, List<String> paramList)
    throws RemoteException, JSONException
  {
    logDebug("Querying SKU details.");
    Object localObject1 = new ArrayList();
    Object localObject2;
    if (paramList != null)
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        localObject2 = (String)paramList.next();
        if (!((ArrayList)localObject1).contains(localObject2)) {
          ((ArrayList)localObject1).add(localObject2);
        }
      }
    }
    if (((ArrayList)localObject1).size() == 0)
    {
      logDebug("queryPrices: nothing to do because there are no SKUs.");
      return 0;
    }
    paramList = new ArrayList();
    int j = ((ArrayList)localObject1).size() / 20;
    int k = ((ArrayList)localObject1).size() % 20;
    int i = 0;
    while (i < j)
    {
      localObject2 = new ArrayList();
      Iterator localIterator = ((ArrayList)localObject1).subList(i * 20, i * 20 + 20).iterator();
      while (localIterator.hasNext()) {
        ((ArrayList)localObject2).add((String)localIterator.next());
      }
      paramList.add(localObject2);
      i += 1;
    }
    if (k != 0)
    {
      localObject2 = new ArrayList();
      localObject1 = ((ArrayList)localObject1).subList(j * 20, j * 20 + k).iterator();
      while (((Iterator)localObject1).hasNext()) {
        ((ArrayList)localObject2).add((String)((Iterator)localObject1).next());
      }
      paramList.add(localObject2);
    }
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      localObject1 = (ArrayList)paramList.next();
      logDebug("Processing chunk of " + ((ArrayList)localObject1).size() + " items");
      localObject2 = new Bundle();
      ((Bundle)localObject2).putStringArrayList("ITEM_ID_LIST", (ArrayList)localObject1);
      localObject1 = mService.getSkuDetails(3, mContext.getPackageName(), paramString, (Bundle)localObject2);
      if (!((Bundle)localObject1).containsKey("DETAILS_LIST"))
      {
        i = getResponseCodeFromBundle((Bundle)localObject1);
        if (i != 0)
        {
          logDebug("getSkuDetails() failed: " + getResponseDesc(i));
          return i;
        }
        logError("getSkuDetails() returned a bundle with neither an error nor a detail list.");
        return 64534;
      }
      localObject1 = ((Bundle)localObject1).getStringArrayList("DETAILS_LIST").iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = new SkuDetails(paramString, (String)((Iterator)localObject1).next());
        logDebug("Got sku details: " + localObject2);
        paramInventory.addSkuDetails((SkuDetails)localObject2);
      }
    }
    return 0;
  }
  
  public void startSetup(final OnIabSetupFinishedListener paramOnIabSetupFinishedListener)
  {
    checkNotDisposed();
    if (mSetupDone) {
      throw new IllegalStateException("IAB helper is already set up.");
    }
    logDebug("Starting in-app billing setup.");
    mServiceConn = new ServiceConnection()
    {
      public void onServiceConnected(ComponentName paramAnonymousComponentName, IBinder paramAnonymousIBinder)
      {
        if (mDisposed) {
          return;
        }
        logDebug("Billing service connected.");
        mService = IInAppBillingService.Stub.asInterface(paramAnonymousIBinder);
        paramAnonymousComponentName = mContext.getPackageName();
        try
        {
          logDebug("Checking for in-app billing 3 support.");
          i = mService.isBillingSupported(3, paramAnonymousComponentName, "inapp");
          if (i != 0)
          {
            if (paramOnIabSetupFinishedListener != null) {
              paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(i, "Error checking for billing v3 support."));
            }
            mSubscriptionsSupported = false;
            return;
          }
        }
        catch (RemoteException paramAnonymousComponentName)
        {
          if (paramOnIabSetupFinishedListener != null) {
            paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(64535, "RemoteException while setting up in-app billing."));
          }
          logError("handled exception");
          paramAnonymousComponentName.printStackTrace();
          return;
        }
        logDebug("In-app billing version 3 supported for " + paramAnonymousComponentName);
        int i = mService.isBillingSupported(3, paramAnonymousComponentName, "subs");
        if (i == 0)
        {
          logDebug("Subscriptions AVAILABLE.");
          mSubscriptionsSupported = true;
        }
        for (;;)
        {
          mSetupDone = true;
          if (paramOnIabSetupFinishedListener == null) {
            break;
          }
          paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(0, "Setup successful."));
          return;
          logDebug("Subscriptions NOT AVAILABLE. Response: " + i);
        }
      }
      
      public void onServiceDisconnected(ComponentName paramAnonymousComponentName)
      {
        logDebug("Billing service disconnected.");
        mService = null;
      }
    };
    Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
    localIntent.setPackage("com.android.vending");
    for (;;)
    {
      try
      {
        boolean bool = mContext.getPackageManager().queryIntentServices(localIntent, 0).isEmpty();
        if (bool) {
          continue;
        }
        i = 1;
      }
      catch (NullPointerException localNullPointerException)
      {
        localNullPointerException.printStackTrace();
        int i = 0;
        continue;
        mServiceConn = null;
        if (paramOnIabSetupFinishedListener == null) {
          continue;
        }
        paramOnIabSetupFinishedListener.onIabSetupFinished(new IabResult(3, "Billing service unavailable on device."));
      }
      if (i == 0) {
        continue;
      }
      mContext.bindService(localIntent, mServiceConn, 1);
      return;
      i = 0;
    }
  }
  
  public static abstract interface OnIabPurchaseFinishedListener
  {
    public abstract void onIabPurchaseFinished(IabResult paramIabResult, Purchase paramPurchase);
  }
  
  public static abstract interface OnIabSetupFinishedListener
  {
    public abstract void onIabSetupFinished(IabResult paramIabResult);
  }
}
