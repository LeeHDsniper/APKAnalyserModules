package com.adobe.creativesdk.aviary.fragments;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.internal.AdobeAccountUserStatus;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.util.Purchase;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.StoreDetailLayout;
import com.aviary.android.feather.sdk.R.layout;
import java.util.UUID;
import rx.Subscription;
import rx.functions.Action1;
import rx.subscriptions.CompositeSubscription;

public abstract class StoreDetailFragmentAbstract
  extends Fragment
  implements StoreFragment
{
  protected static LoggerFactory.Logger logger = LoggerFactory.getLogger(StoreDetailFragmentAbstract.class.getSimpleName());
  private StoreDetailLayout mDetailView;
  private long mPackId = -1L;
  private final CompositeSubscription mSubjectSubscriptions = new CompositeSubscription();
  private String uuid;
  private boolean visible;
  
  public StoreDetailFragmentAbstract() {}
  
  public AdobeImageBillingService getContentService()
  {
    return ((AdobeImageAccountDelegate)getActivity()).getContentService();
  }
  
  public String getUUID()
  {
    if (uuid == null) {
      uuid = UUID.randomUUID().toString();
    }
    return uuid;
  }
  
  public boolean isContentServiceConnected()
  {
    return ((AdobeImageAccountDelegate)getActivity()).isContentServiceConnected();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    logger.log("onActivityCreated");
    super.onActivityCreated(paramBundle);
    mPackId = getArguments().getLong("extra-pack-id", -1L);
    if ((mPackId > 0L) && (visible))
    {
      mDetailView.update(mPackId, true, null);
      if (isContentServiceConnected()) {
        onServiceCreated(getContentService());
      }
    }
    else
    {
      return;
    }
    logger.error("not connected");
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.com_adobe_image_store_detail_fragment, paramViewGroup, false);
    onSetupView(paramLayoutInflater);
    return paramLayoutInflater;
  }
  
  public void onDestroyView()
  {
    mDetailView.setParentFragment(null);
    mSubjectSubscriptions.clear();
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    super.onDetach();
  }
  
  public void onDownloadStatusChanged(long paramLong, String paramString, int paramInt)
  {
    if ((!isDetached()) && (isAdded())) {
      mDetailView.onDownloadStatusChanged(paramLong, paramString, paramInt);
    }
  }
  
  public void onPackInstalled(long paramLong, String paramString, int paramInt)
  {
    if ((!isDetached()) && (isAdded())) {
      mDetailView.onPackInstalled(paramLong, paramString, paramInt);
    }
  }
  
  public void onPurchaseSuccess(long paramLong, String paramString, Purchase paramPurchase)
  {
    if ((isAdded()) && (!isDetached())) {
      mDetailView.onPurchaseSuccess(paramLong, paramString, paramPurchase);
    }
  }
  
  public void onServiceCreated(AdobeImageBillingService paramAdobeImageBillingService)
  {
    if (mDetailView != null)
    {
      mDetailView.onServiceCreated(paramAdobeImageBillingService);
      mSubjectSubscriptions.clear();
      Subscription localSubscription1 = paramAdobeImageBillingService.subscribeToUserStatusChange(this, new Action1()
      {
        public void call(AdobeAccountUserStatus paramAnonymousAdobeAccountUserStatus)
        {
          onUserAuthenticated(paramAnonymousAdobeAccountUserStatus);
        }
      });
      Subscription localSubscription2 = paramAdobeImageBillingService.subscribeToPackInstalled(this, new Action1()
      {
        public void call(Intent paramAnonymousIntent)
        {
          onPackInstalled(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), paramAnonymousIntent.getIntExtra("purchased", 0));
        }
      });
      Subscription localSubscription3 = paramAdobeImageBillingService.subscribeToPackDownloadStatusChanged(this, new Action1()
      {
        public void call(Intent paramAnonymousIntent)
        {
          onDownloadStatusChanged(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), paramAnonymousIntent.getIntExtra("status", 0));
        }
      });
      paramAdobeImageBillingService = paramAdobeImageBillingService.subscribeToPackPurchased(this, new Action1()
      {
        public void call(Intent paramAnonymousIntent)
        {
          onPurchaseSuccess(paramAnonymousIntent.getLongExtra("packId", -1L), paramAnonymousIntent.getStringExtra("packType"), (Purchase)paramAnonymousIntent.getParcelableExtra("purchase"));
        }
      });
      mSubjectSubscriptions.add(localSubscription1);
      mSubjectSubscriptions.add(localSubscription2);
      mSubjectSubscriptions.add(localSubscription3);
      mSubjectSubscriptions.add(paramAdobeImageBillingService);
    }
  }
  
  protected final void onSetupView(View paramView)
  {
    mDetailView = ((StoreDetailLayout)paramView);
    mDetailView.setParentFragment(this);
  }
  
  public void onUserAuthenticated(AdobeAccountUserStatus paramAdobeAccountUserStatus)
  {
    if ((isAdded()) && (!isDetached())) {
      mDetailView.onUserAuthenticated(paramAdobeAccountUserStatus);
    }
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    visible = isFragmentVisible();
  }
  
  public void showPackInfo(long paramLong)
  {
    logger.log("showPackInfo: %d", new Object[] { Long.valueOf(paramLong) });
    mSubjectSubscriptions.clear();
    mPackId = paramLong;
    mDetailView.update(paramLong, false, null);
    if (isContentServiceConnected()) {
      onServiceCreated(getContentService());
    }
  }
}
