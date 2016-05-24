package com.adobe.creativesdk.aviary.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.Toast;
import android.widget.ViewAnimator;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import com.adobe.creativesdk.aviary.internal.account.AdobeImageAccountDelegate;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.ScreenUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.anim;
import com.aviary.android.feather.sdk.R.fraction;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import java.util.HashMap;
import rx.Observable;
import rx.functions.Action1;

public class StoreContainerFragment
  extends DialogFragment
  implements StoreListFragmentAbstract.OnStoreElementSelected
{
  public static LoggerFactory.Logger logger = LoggerFactory.getLogger("StoreContainerFragment");
  private boolean mArgumentsChanged;
  private ViewGroup.LayoutParams mViewLayoutParams;
  private ViewAnimator viewAnimator;
  
  public StoreContainerFragment() {}
  
  private void connectIfNecessary()
  {
    logger.log("connectIfNecessary");
    AdobeImageAccountDelegate localAdobeImageAccountDelegate = (AdobeImageAccountDelegate)getActivity();
    if (localAdobeImageAccountDelegate.isContentServiceConnected())
    {
      logger.verbose("already connected", new Object[0]);
      update();
      return;
    }
    localAdobeImageAccountDelegate.tryConnectToContentService().subscribe(new Action1()new Action1
    {
      public void call(AdobeImageBillingService paramAnonymousAdobeImageBillingService)
      {
        if ((getActivity() != null) && (isAdded()) && (!isDetached())) {
          update();
        }
      }
    }, new Action1()
    {
      public void call(Throwable paramAnonymousThrowable)
      {
        Toast.makeText(getActivity(), paramAnonymousThrowable.getMessage(), 0).show();
      }
    });
    logger.warn("not yet connected");
  }
  
  private void createFragmentIfRequired(int paramInt)
  {
    boolean bool2 = true;
    FragmentManager localFragmentManager = getChildFragmentManager();
    if (paramInt == 0) {
      if (localFragmentManager.findFragmentByTag("list-fragment") == null)
      {
        localObject = StoreListFragment.newInstance((Cds.PackType)getArguments().getSerializable("extra-pack-type"));
        localFragmentManager.beginTransaction().replace(R.id.listView, (Fragment)localObject, "list-fragment").commit();
        ((StoreListFragment)localObject).setOnSelectedListener(this);
      }
    }
    while (paramInt != 1) {
      return;
    }
    Object localObject = (StoreDetailFragment)localFragmentManager.findFragmentByTag("detail-fragment");
    long l = getArguments().getLong("extra-pack-id");
    Cds.PackType localPackType = (Cds.PackType)getArguments().getSerializable("extra-pack-type");
    if (localObject == null)
    {
      boolean bool1 = bool2;
      if (!ApiHelper.AT_LEAST_21) {
        if (localFragmentManager.findFragmentByTag("list-fragment") != null) {
          break label162;
        }
      }
      label162:
      for (bool1 = bool2;; bool1 = false)
      {
        localObject = StoreDetailFragment.newInstance(l, localPackType, bool1);
        localFragmentManager.beginTransaction().replace(R.id.detailView, (Fragment)localObject, "detail-fragment").commit();
        return;
      }
    }
    ((StoreDetailFragment)localObject).showPackInfo(l);
  }
  
  public static StoreContainerFragment newInstance(Bundle paramBundle)
  {
    StoreContainerFragment localStoreContainerFragment = new StoreContainerFragment();
    localStoreContainerFragment.setArguments(paramBundle);
    return localStoreContainerFragment;
  }
  
  private void updateDialogLayoutSize()
  {
    if (ScreenUtils.isTablet(getActivity()))
    {
      Resources localResources = getResources();
      int i = getDisplayMetricsheightPixels;
      float f = localResources.getFraction(R.fraction.com_adobe_image_editor_store_container_height, 1, 1);
      i = (int)(i * f);
      logger.verbose("ratio: %f, final height: %d", new Object[] { Float.valueOf(f), Integer.valueOf(i) });
      viewAnimator.getLayoutParams().height = i;
    }
  }
  
  public boolean isFragmentVisible(Fragment paramFragment)
  {
    boolean bool = false;
    int i = viewAnimator.getDisplayedChild();
    logger.verbose("child: %d", new Object[] { Integer.valueOf(i) });
    if (i == 0) {
      bool = paramFragment instanceof StoreListFragmentAbstract;
    }
    while (i != 1) {
      return bool;
    }
    return paramFragment instanceof StoreDetailFragmentAbstract;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    logger.info("onActivityCreated");
    super.onActivityCreated(paramBundle);
    connectIfNecessary();
  }
  
  public boolean onBackPressed()
  {
    logger.verbose("onBackPressed. displayedChild: %d", new Object[] { Integer.valueOf(viewAnimator.getDisplayedChild()) });
    if ((viewAnimator.getDisplayedChild() == 1) && (getChildFragmentManager().findFragmentByTag("list-fragment") != null))
    {
      getArguments().remove("extra-pack-id");
      setArguments(getArguments());
      update();
      return true;
    }
    return false;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    logger.info("onConfigurationChanged: %s", new Object[] { paramConfiguration });
    super.onConfigurationChanged(paramConfiguration);
    updateDialogLayoutSize();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    logger.info("onCreate");
    super.onCreate(paramBundle);
    setStyle(1, 0);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_store_container_fragment, paramViewGroup, false);
  }
  
  public void onPackSelected(long paramLong, Cds.PackType paramPackType, String paramString)
  {
    logger.verbose("onPackSelected: %d", new Object[] { Long.valueOf(paramLong) });
    paramPackType = getArguments();
    paramPackType.putLong("extra-pack-id", paramLong);
    setArguments(paramPackType);
    update();
  }
  
  public void onResume()
  {
    super.onResume();
    Dialog localDialog = getDialog();
    if (localDialog != null) {
      localDialog.setOnKeyListener(new DialogInterface.OnKeyListener()
      {
        public boolean onKey(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
        {
          boolean bool2 = false;
          StoreContainerFragment.logger.log("onKey: %d", new Object[] { Integer.valueOf(paramAnonymousInt) });
          boolean bool1 = bool2;
          if (paramAnonymousKeyEvent.getAction() == 1)
          {
            bool1 = bool2;
            if (paramAnonymousInt == 4) {
              bool1 = onBackPressed();
            }
          }
          return bool1;
        }
      });
    }
  }
  
  public void onStart()
  {
    logger.info("onStart");
    super.onStart();
    if (getDialog() == null) {
      return;
    }
    updateDialogLayoutSize();
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    mViewLayoutParams = paramView.getLayoutParams();
    viewAnimator = ((ViewAnimator)paramView.findViewById(R.id.view_animator));
    paramView.setFocusableInTouchMode(true);
    paramView.requestFocus();
  }
  
  public void setArguments(Bundle paramBundle)
  {
    mArgumentsChanged = true;
    if (getArguments() != null)
    {
      getArguments().putAll(paramBundle);
      return;
    }
    super.setArguments(paramBundle);
  }
  
  public void setDisplayedChild(int paramInt)
  {
    createFragmentIfRequired(paramInt);
    boolean bool;
    if (paramInt != viewAnimator.getDisplayedChild())
    {
      bool = true;
      logger.verbose("animationRequired: %b", new Object[] { Boolean.valueOf(bool) });
      if (bool)
      {
        if (paramInt != 0) {
          break label90;
        }
        viewAnimator.setInAnimation(getActivity(), R.anim.com_adobe_image_void_animation);
        viewAnimator.setOutAnimation(getActivity(), R.anim.com_adobe_image_slide_out_right);
      }
    }
    for (;;)
    {
      viewAnimator.setDisplayedChild(paramInt);
      return;
      bool = false;
      break;
      label90:
      viewAnimator.setInAnimation(getActivity(), R.anim.com_adobe_image_slide_in_right);
      viewAnimator.setOutAnimation(getActivity(), R.anim.com_adobe_image_void_animation);
      viewAnimator.getInAnimation().setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          StoreContainerFragment.logger.error("in animation completed");
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      });
    }
  }
  
  public void update()
  {
    int i = 0;
    if (mArgumentsChanged)
    {
      Bundle localBundle = getArguments();
      long l = localBundle.getLong("extra-pack-id", -1L);
      if ((Cds.PackType)localBundle.getSerializable("extra-pack-type") == null) {
        throw new IllegalArgumentException("packType is missing!!");
      }
      mArgumentsChanged = false;
      if (l >= 0L) {
        break label75;
      }
    }
    for (;;)
    {
      setDisplayedChild(i);
      viewAnimator.setAnimateFirstView(true);
      return;
      label75:
      i = 1;
    }
  }
  
  public static class Builder
  {
    private HashMap<String, String> eventAttributes = new HashMap();
    private String eventName;
    private Bundle extras;
    private long featuredPackId = -1L;
    private long packId = -1L;
    private Cds.PackType packType;
    
    public Builder() {}
    
    public Builder addEventAttributes(String paramString1, String paramString2)
    {
      eventAttributes.put(paramString1, paramString2);
      return this;
    }
    
    public Bundle build()
    {
      Bundle localBundle = new Bundle();
      localBundle.putLong("extra-pack-id", packId);
      localBundle.putLong("featured_pack_id", featuredPackId);
      localBundle.putSerializable("extra-pack-type", packType);
      localBundle.putSerializable("event_attributes", eventAttributes);
      localBundle.putString("event_name", eventName);
      localBundle.putBundle("extras", extras);
      return localBundle;
    }
    
    public Builder setEvent(String paramString)
    {
      eventName = paramString;
      return this;
    }
    
    public Builder setExtras(Bundle paramBundle)
    {
      extras = paramBundle;
      return this;
    }
    
    public Builder setFeaturedPackId(long paramLong)
    {
      featuredPackId = paramLong;
      return this;
    }
    
    public Builder setPackId(long paramLong)
    {
      packId = paramLong;
      return this;
    }
    
    public Builder setPackType(Cds.PackType paramPackType)
    {
      packType = paramPackType;
      return this;
    }
  }
}
