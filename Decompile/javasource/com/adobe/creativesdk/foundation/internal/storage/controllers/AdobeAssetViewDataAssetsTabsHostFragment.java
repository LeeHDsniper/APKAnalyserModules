package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.Fragment.InstantiationException;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.assets.R.color;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.MobileCreationsDataSourceFactory;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.SlidingTabLayout;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeAssetViewDataAssetsTabsHostFragment
  extends AdobeAssetViewBaseHostFragment
{
  private ArrayList<AssetTabDetails> _allAssetTabsList;
  private AdobeCloud _cloud;
  private EnumSet<AdobeAssetDataSourceType> _dataSourcesList;
  private DatSourceObserver _observer;
  private SlidingTabLayout mSlidingTabLayout;
  private ViewPager mViewPager;
  private OurViewPagerAdapter mViewPagerAdapter;
  
  public AdobeAssetViewDataAssetsTabsHostFragment() {}
  
  private EnumSet<AdobeAssetDataSourceType> getDataSourcesList()
  {
    return AdobeAssetViewBrowserControllerFactory.getDataSourcesListToDisplayFromBundle(getArguments());
  }
  
  private String getDisplayNameOfDataSource(AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    String str = "";
    if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceFiles) {
      str = getLocalizedString(R.string.adobe_uxassetbrowser_files);
    }
    do
    {
      return str;
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePhotos) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_photos);
      }
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_psmix);
      }
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_designlibrary);
      }
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceSketches) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_sketches);
      }
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLine) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_lines);
      }
      if (paramAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceDraw) {
        return getLocalizedString(R.string.adobe_uxassetbrowser_drawings);
      }
    } while (paramAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions);
    return getLocalizedString(R.string.adobe_uxassetbrowser_comps);
  }
  
  private AdobeAssetViewBrowserControllerFactory.AdobeAssetViewFragmentDetails getHostDetailsFromDataSource(AdobeAssetDataSourceType paramAdobeAssetDataSourceType, Bundle paramBundle)
  {
    return AdobeAssetViewBrowserControllerFactory.getAssetViewFragmentDetails(AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext(), paramAdobeAssetDataSourceType, paramBundle, null);
  }
  
  private String getLocalizedString(int paramInt)
  {
    return AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getResources().getString(paramInt);
  }
  
  private void setupTabsBasedOnGivenDataSources()
  {
    _dataSourcesList = getDataSourcesList();
    _allAssetTabsList = new ArrayList();
    if (_cloud == null) {
      _cloud = AdobeCloudManager.getSharedCloudManager().getDefaultCloud();
    }
    Object localObject = _dataSourcesList.iterator();
    AdobeAssetDataSourceType localAdobeAssetDataSourceType;
    AssetTabDetails localAssetTabDetails;
    while (((Iterator)localObject).hasNext())
    {
      localAdobeAssetDataSourceType = (AdobeAssetDataSourceType)((Iterator)localObject).next();
      if (AdobeAssetViewBrowserControllerFactory.shouldShowComponent(localAdobeAssetDataSourceType, _cloud))
      {
        localAssetTabDetails = new AssetTabDetails(null);
        assetsTabName = getDisplayNameOfDataSource(localAdobeAssetDataSourceType);
        fragmentDetails = getHostDetailsFromDataSource(localAdobeAssetDataSourceType, getArguments());
        _allAssetTabsList.add(localAssetTabDetails);
      }
    }
    localObject = MobileCreationsDataSourceFactory.getInstance().getLoadedDataSourcesTypes();
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        localAdobeAssetDataSourceType = (AdobeAssetDataSourceType)((Iterator)localObject).next();
        if ((!_dataSourcesList.contains(localAdobeAssetDataSourceType)) && (AdobeAssetViewBrowserControllerFactory.shouldShowComponent(localAdobeAssetDataSourceType, _cloud)))
        {
          localAssetTabDetails = new AssetTabDetails(null);
          assetsTabName = getDisplayNameOfDataSource(localAdobeAssetDataSourceType);
          fragmentDetails = getHostDetailsFromDataSource(localAdobeAssetDataSourceType, getArguments());
          _allAssetTabsList.add(localAssetTabDetails);
        }
      }
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    _cloud = ((AdobeCloud)getArguments().getSerializable(AdobeAssetMainBrowserConfiguration.ADOBE_CLOUD_KEY));
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_assetsview_datasource_tabs, paramViewGroup, false);
    mViewPager = ((ViewPager)paramLayoutInflater.findViewById(R.id.view_pager));
    mViewPagerAdapter = new OurViewPagerAdapter(getChildFragmentManager());
    setupTabsBasedOnGivenDataSources();
    mViewPager.setAdapter(mViewPagerAdapter);
    mSlidingTabLayout = ((SlidingTabLayout)paramLayoutInflater.findViewById(R.id.sliding_tabs));
    mSlidingTabLayout.setCustomTabView(R.layout.tab_layout, R.id.creativesdk_tab_title);
    paramViewGroup = getResources();
    mSlidingTabLayout.setSelectedIndicatorColors(new int[] { paramViewGroup.getColor(R.color.creative_sdk_tab_indicator_color), -1 });
    mSlidingTabLayout.setDistributeEvenly(true);
    if (mViewPagerAdapter.getCount() != 0) {
      mSlidingTabLayout.setViewPager(mViewPager);
    }
    mSlidingTabLayout.setOnPageChangeListener(new ViewPager.OnPageChangeListener()
    {
      public void onPageScrollStateChanged(int paramAnonymousInt) {}
      
      public void onPageScrolled(int paramAnonymousInt1, float paramAnonymousFloat, int paramAnonymousInt2) {}
      
      public void onPageSelected(int paramAnonymousInt)
      {
        AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification(new AdobeNotification(AdobeInternalNotificationID.AdobeUxTabDataSourceChanged, null));
      }
    });
    _observer = new DatSourceObserver();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeDataSourceReady, _observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged, _observer);
    return paramLayoutInflater;
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeDataSourceReady, _observer);
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().removeObserver(AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged, _observer);
    _observer = null;
  }
  
  private class AssetTabDetails
  {
    String assetsTabName;
    AdobeAssetViewBrowserControllerFactory.AdobeAssetViewFragmentDetails fragmentDetails;
    
    private AssetTabDetails() {}
  }
  
  private class DatSourceObserver
    implements Observer
  {
    DatSourceObserver() {}
    
    public void update(Observable paramObservable, Object paramObject)
    {
      paramObservable = (AdobeNotification)paramObject;
      if (paramObservable.getId() == AdobeInternalNotificationID.AdobeDataSourceReady)
      {
        paramObservable = (AdobeAssetDataSourceType)paramObservable.getInfo().get("DataSourceReady");
        paramObject = new AdobeAssetViewDataAssetsTabsHostFragment.AssetTabDetails(AdobeAssetViewDataAssetsTabsHostFragment.this, null);
        assetsTabName = AdobeAssetViewDataAssetsTabsHostFragment.this.getDisplayNameOfDataSource(paramObservable);
        fragmentDetails = AdobeAssetViewDataAssetsTabsHostFragment.this.getHostDetailsFromDataSource(paramObservable, getArguments());
        _allAssetTabsList.add(paramObject);
        mSlidingTabLayout.setDistributeEvenly(false);
        mSlidingTabLayout.setViewPager(mViewPager);
        mViewPagerAdapter.notifyDataSetChanged();
        mSlidingTabLayout.forceLayout();
      }
      while (paramObservable.getId() != AdobeInternalNotificationID.AdobeAppOrientationConfigurationChanged) {
        return;
      }
      mSlidingTabLayout.setViewPager(mViewPager);
      mViewPagerAdapter.notifyDataSetChanged();
      mSlidingTabLayout.forceLayout();
    }
  }
  
  private class OurViewPagerAdapter
    extends FragmentPagerAdapter
  {
    public OurViewPagerAdapter(FragmentManager paramFragmentManager)
    {
      super();
    }
    
    public int getCount()
    {
      if (_allAssetTabsList != null) {
        return _allAssetTabsList.size();
      }
      return 0;
    }
    
    public Fragment getItem(int paramInt)
    {
      try
      {
        Object localObject = _allAssetTabsList.get(paramInt)).fragmentDetails;
        localObject = Fragment.instantiate(getActivity(), classTag.getName(), argumentsBundle);
        return localObject;
      }
      catch (Fragment.InstantiationException localInstantiationException) {}
      return null;
    }
    
    public CharSequence getPageTitle(int paramInt)
    {
      return _allAssetTabsList.get(paramInt)).assetsTabName;
    }
  }
}
