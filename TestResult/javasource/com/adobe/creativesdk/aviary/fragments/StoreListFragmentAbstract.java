package com.adobe.creativesdk.aviary.fragments;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Pair;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.account.AccountResult;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.util.IabResult;
import com.adobe.creativesdk.aviary.internal.cds.util.Purchase;
import com.adobe.creativesdk.aviary.internal.utils.CredentialsUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.UUID;
import rx.Observable;
import rx.Subscription;
import rx.android.app.AppObservable;
import rx.functions.Action1;
import rx.subscriptions.CompositeSubscription;

public abstract class StoreListFragmentAbstract
  extends ListFragmentAbstract
  implements AdapterView.OnItemClickListener, StoreFragment
{
  protected static LoggerFactory.Logger logger = LoggerFactory.getLogger("StoreListFragmentAbstract");
  protected String billingKey;
  protected CompositeSubscription compositeSubscription = new CompositeSubscription();
  protected boolean firstTime;
  protected Cds.PackType packType;
  protected CompositeSubscription permanentSubscriptions = new CompositeSubscription();
  protected OnStoreElementSelected selectionListener;
  private String uuid;
  
  public StoreListFragmentAbstract() {}
  
  protected void fireOnItemClick(long paramLong, String paramString)
  {
    if (selectionListener != null) {
      selectionListener.onPackSelected(paramLong, getPackType(), paramString);
    }
  }
  
  protected Cds.PackType getPackType()
  {
    return packType;
  }
  
  public String getUUID()
  {
    if (uuid == null) {
      uuid = UUID.randomUUID().toString();
    }
    return uuid;
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    billingKey = CredentialsUtils.getBillingKey(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    firstTime = true;
    packType = ((Cds.PackType)getArguments().getSerializable("extra-pack-type"));
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    permanentSubscriptions.clear();
  }
  
  public void onDetach()
  {
    selectionListener = null;
    super.onDetach();
  }
  
  protected void onDownloadStatusChanged(long paramLong, String paramString, int paramInt)
  {
    logger.log("onDownloadStatusChanged{packId:%d, packType:%s, status:%d}", new Object[] { Long.valueOf(paramLong), paramString, Integer.valueOf(paramInt) });
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (paramLong > -1L) {
      selectPack(paramLong);
    }
  }
  
  protected void onPackInstalled(long paramLong, String paramString, int paramInt)
  {
    logger.log("onPackInstalled{packId:%d, packType:%s, purchased:%d}", new Object[] { Long.valueOf(paramLong), paramString, Integer.valueOf(paramInt) });
  }
  
  protected void onPurchaseSuccess(long paramLong, String paramString, Purchase paramPurchase)
  {
    logger.log("onPurchaseSuccess{packId:%d, packType:%s, purchase:%s}", new Object[] { Long.valueOf(paramLong), paramString, paramPurchase });
  }
  
  protected void onServiceFinished()
  {
    logger.log("onServiceFinished");
  }
  
  public void onSetupDone(Pair<AccountResult, IabResult> paramPair)
  {
    logger.log("onSetupDone: %s", new Object[] { paramPair });
  }
  
  public void onStart()
  {
    super.onStart();
    logger.log("onStart");
    if (isContentServiceConnected())
    {
      Subscription localSubscription1 = getContentService().subscribeToPackDownloadStatusChanged(this, new Action1()
      {
        public void call(Intent paramAnonymousIntent)
        {
          onDownloadStatusChanged(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), paramAnonymousIntent.getIntExtra("status", 0));
        }
      });
      Subscription localSubscription2 = getContentService().subscribeToCdsFinised(this, new Action1()
      {
        public void call(Integer paramAnonymousInteger)
        {
          if (paramAnonymousInteger.intValue() > 0)
          {
            StoreListFragmentAbstract.logger.verbose("onServiceFinished: %d", new Object[] { paramAnonymousInteger });
            onServiceFinished();
          }
        }
      });
      compositeSubscription.add(localSubscription1);
      compositeSubscription.add(localSubscription2);
      return;
    }
    logger.warn("service not connected");
  }
  
  public void onStop()
  {
    logger.log("onStop");
    super.onStop();
    compositeSubscription.clear();
  }
  
  protected void onUserAuthenticated(AdobeAccountUserStatus paramAdobeAccountUserStatus)
  {
    logger.log("onUserAuthenticated: %s", new Object[] { paramAdobeAccountUserStatus });
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    startSetup();
    getListView().setOnItemClickListener(this);
    getListView().setScrollbarFadingEnabled(true);
    getListView().setScrollBarStyle(33554432);
    if (getArguments().getBoolean("checkableList", false))
    {
      getListView().setChoiceMode(1);
      return;
    }
    getListView().setChoiceMode(0);
  }
  
  public void selectPack(long paramLong)
  {
    logger.info("selectPack: %d", new Object[] { Long.valueOf(paramLong) });
  }
  
  public void setOnSelectedListener(OnStoreElementSelected paramOnStoreElementSelected)
  {
    selectionListener = paramOnStoreElementSelected;
  }
  
  protected void startSetup()
  {
    logger.info("startSetup");
    if (!isContentServiceConnected())
    {
      logger.error("content manager service is unavailable!");
      return;
    }
    Subscription localSubscription1 = AppObservable.bindSupportFragment(this, getContentService().startSetup()).subscribe(new Action1()new Action1
    {
      public void call(Pair<AccountResult, IabResult> paramAnonymousPair)
      {
        onSetupDone(paramAnonymousPair);
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        paramAnonymousThrowable.printStackTrace();
        StoreListFragmentAbstract.logger.error("onError: %s", new Object[] { paramAnonymousThrowable });
      }
    });
    Subscription localSubscription2 = getContentService().subscribeToUserStatusChange(this, new Action1()
    {
      public void call(AdobeAccountUserStatus paramAnonymousAdobeAccountUserStatus)
      {
        onUserAuthenticated(paramAnonymousAdobeAccountUserStatus);
      }
    });
    Subscription localSubscription3 = getContentService().subscribeToPackPurchased(this, new Action1()
    {
      public void call(Intent paramAnonymousIntent)
      {
        onPurchaseSuccess(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), (Purchase)paramAnonymousIntent.getParcelableExtra("purchase"));
      }
    });
    Subscription localSubscription4 = getContentService().subscribeToPackInstalled(this, new Action1()
    {
      public void call(Intent paramAnonymousIntent)
      {
        onPackInstalled(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), paramAnonymousIntent.getIntExtra("purchased", 0));
      }
    });
    permanentSubscriptions.add(localSubscription1);
    permanentSubscriptions.add(localSubscription2);
    permanentSubscriptions.add(localSubscription3);
    permanentSubscriptions.add(localSubscription4);
  }
  
  public static abstract interface OnStoreElementSelected
  {
    public abstract void onPackSelected(long paramLong, Cds.PackType paramPackType, String paramString);
  }
}
