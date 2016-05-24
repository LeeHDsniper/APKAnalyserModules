package com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar;

import android.content.res.Resources;
import android.support.v7.app.ActionBar.LayoutParams;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.Spinner;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeEntitlementServices;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;

public class AdobeUxActionBarDropDownController
{
  private static AdobeUxActionBarDropDownController _sInstance;
  private boolean _shouldEnableDropDownSelection;
  private Toolbar mActionBarToolbar;
  private EnumSet<CCSection> mCCSectionsList;
  private ActionBarActivity mContext;
  private CCSection mCurrentSelectedSection;
  private Spinner mSpinner;
  private DataSourceSectionSpinnerAdapter mTopLevelSpinnerAdapter = new DataSourceSectionSpinnerAdapter(null);
  
  public AdobeUxActionBarDropDownController() {}
  
  private void enableDropDownSelection(boolean paramBoolean)
  {
    _shouldEnableDropDownSelection = paramBoolean;
    mSpinner.setEnabled(paramBoolean);
  }
  
  public static EnumSet<CCSection> getCCSectionsListFromDataSource(EnumSet<AdobeAssetDataSourceType> paramEnumSet, boolean paramBoolean)
  {
    int k = 0;
    int j = 0;
    if (paramEnumSet != null)
    {
      if (!paramBoolean) {
        break label87;
      }
      if (!isDataSourcesHasMyAssets(paramEnumSet))
      {
        i = 1;
        if (paramEnumSet.contains(AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary)) {
          break label147;
        }
        j = 1;
        k = i;
      }
    }
    else
    {
      label37:
      paramEnumSet = EnumSet.allOf(CCSection.class);
      i = j;
      if (!paramBoolean) {
        if (j != 0) {
          break label155;
        }
      }
    }
    label87:
    label147:
    label155:
    for (int i = 1;; i = 0)
    {
      if (k != 0) {
        paramEnumSet.remove(CCSection.myAssets);
      }
      if (i != 0) {
        paramEnumSet.remove(CCSection.myLibraries);
      }
      return paramEnumSet;
      i = 0;
      break;
      EnumSet localEnumSet = EnumSet.allOf(AdobeAssetDataSourceType.class);
      Iterator localIterator = paramEnumSet.iterator();
      while (localIterator.hasNext()) {
        localEnumSet.remove((AdobeAssetDataSourceType)localIterator.next());
      }
      if (!isDataSourcesHasMyAssets(localEnumSet)) {}
      for (i = 1;; i = 0) {
        break;
      }
      j = 0;
      k = i;
      break label37;
    }
  }
  
  public static AdobeUxActionBarDropDownController getInstance()
  {
    return _sInstance;
  }
  
  private void handleDataSourceSectionSelection(int paramInt)
  {
    DataSourceSectionSpinnerItem localDataSourceSectionSpinnerItem = (DataSourceSectionSpinnerItem)mTopLevelSpinnerAdapter.getItem(paramInt);
    if ((ccSection != null) && (ccSection != mCurrentSelectedSection)) {
      loadCCSourceSection(ccSection);
    }
  }
  
  private static boolean isDataSourcesHasMyAssets(EnumSet<AdobeAssetDataSourceType> paramEnumSet)
  {
    if (paramEnumSet == null) {}
    do
    {
      return false;
      paramEnumSet = paramEnumSet.clone();
      paramEnumSet.remove(AdobeAssetDataSourceType.AdobeAssetDataSourceLibrary);
    } while (paramEnumSet.size() <= 0);
    return true;
  }
  
  private void loadCCSourceSection(CCSection paramCCSection)
  {
    mCurrentSelectedSection = paramCCSection;
    if (mCurrentSelectedSection == CCSection.myAssets) {
      AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYASSETS);
    }
    while (mCurrentSelectedSection != CCSection.myLibraries) {
      return;
    }
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_SHOW_CC_DATASOURCE_MYLIBRARIES);
  }
  
  private void reset()
  {
    mContext = null;
    mActionBarToolbar = null;
    mSpinner = null;
  }
  
  private void resetDropDownWithDataSourceSections(AdobeCloud paramAdobeCloud)
  {
    mTopLevelSpinnerAdapter.clear();
    boolean bool2 = mCCSectionsList.contains(CCSection.myLibraries);
    boolean bool1 = bool2;
    if (bool2) {
      bool1 = AdobeEntitlementServices.getSharedServices().isEntitledToService("libraries", paramAdobeCloud);
    }
    bool2 = mCCSectionsList.contains(CCSection.myAssets);
    if ((bool2) || ((!bool2) && (!bool1))) {
      mTopLevelSpinnerAdapter.addItem(CCSection.myAssets, mContext.getResources().getString(R.string.adobe_uxassetbrowser_csdk_myassets_main));
    }
    if (bool1) {
      mTopLevelSpinnerAdapter.addItem(CCSection.myLibraries, mContext.getResources().getString(R.string.adobe_uxassetbrowser_csdk_mylibraries));
    }
  }
  
  public static void resetIfSameInstance(AdobeUxActionBarDropDownController paramAdobeUxActionBarDropDownController)
  {
    if (_sInstance != paramAdobeUxActionBarDropDownController) {
      return;
    }
    resetInstance();
  }
  
  private static void resetInstance()
  {
    if (_sInstance != null) {
      _sInstance.reset();
    }
    _sInstance = null;
  }
  
  public static void setInstance(AdobeUxActionBarDropDownController paramAdobeUxActionBarDropDownController)
  {
    if ((_sInstance != null) && (_sInstance != paramAdobeUxActionBarDropDownController)) {
      resetInstance();
    }
    _sInstance = paramAdobeUxActionBarDropDownController;
  }
  
  private boolean shouldEnableDropDownSelection()
  {
    return _shouldEnableDropDownSelection;
  }
  
  public CCSection getCurrentCCSection()
  {
    return mCurrentSelectedSection;
  }
  
  public void setDropDownDetails(boolean paramBoolean, String paramString, AdobeCloud paramAdobeCloud)
  {
    int i = 0;
    if (mContext == null) {}
    label37:
    do
    {
      return;
      if (!paramBoolean) {
        break;
      }
      resetDropDownWithDataSourceSections(paramAdobeCloud);
      if ((!paramBoolean) || (mTopLevelSpinnerAdapter.getCount() <= 1)) {
        break label94;
      }
      paramBoolean = true;
      enableDropDownSelection(paramBoolean);
      mTopLevelSpinnerAdapter.notifyDataSetChanged();
    } while (!paramBoolean);
    paramString = mSpinner;
    if (mCurrentSelectedSection == CCSection.myAssets) {}
    for (;;)
    {
      paramString.setSelection(i);
      return;
      mTopLevelSpinnerAdapter.clear();
      mTopLevelSpinnerAdapter.addItem(null, paramString);
      break;
      label94:
      paramBoolean = false;
      break label37;
      i = 1;
    }
  }
  
  public void setUpActionBar(ActionBarActivity paramActionBarActivity, Toolbar paramToolbar, EnumSet<CCSection> paramEnumSet, CCSection paramCCSection, AdobeCloud paramAdobeCloud)
  {
    mActionBarToolbar = paramToolbar;
    mContext = paramActionBarActivity;
    mCCSectionsList = paramEnumSet;
    mCurrentSelectedSection = paramCCSection;
    resetDropDownWithDataSourceSections(paramAdobeCloud);
    paramActionBarActivity = LayoutInflater.from(mContext).inflate(R.layout.adobe_ux_actionbar_spinner, paramToolbar, false);
    paramToolbar.addView(paramActionBarActivity, new ActionBar.LayoutParams(-1, -1));
    mSpinner = ((Spinner)paramActionBarActivity.findViewById(R.id.adobe_ux_actionbar_spinner));
    mSpinner.setAdapter(mTopLevelSpinnerAdapter);
    mSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        AdobeUxActionBarDropDownController.this.handleDataSourceSectionSelection(paramAnonymousInt);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    enableDropDownSelection(true);
  }
  
  public static enum CCSection
  {
    myAssets,  myLibraries;
    
    private CCSection() {}
  }
  
  private class DataSourceSectionSpinnerAdapter
    extends BaseAdapter
  {
    private ArrayList<AdobeUxActionBarDropDownController.DataSourceSectionSpinnerItem> mItems = new ArrayList();
    
    private DataSourceSectionSpinnerAdapter() {}
    
    private String getTitle(int paramInt)
    {
      if ((paramInt >= 0) && (paramInt < mItems.size())) {
        return AdobeUxActionBarDropDownController.DataSourceSectionSpinnerItem.access$500((AdobeUxActionBarDropDownController.DataSourceSectionSpinnerItem)mItems.get(paramInt));
      }
      return "";
    }
    
    public void addItem(AdobeUxActionBarDropDownController.CCSection paramCCSection, String paramString)
    {
      mItems.add(new AdobeUxActionBarDropDownController.DataSourceSectionSpinnerItem(AdobeUxActionBarDropDownController.this, paramCCSection, paramString));
    }
    
    public void clear()
    {
      mItems.clear();
    }
    
    public int getCount()
    {
      return mItems.size();
    }
    
    public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (mContext == null) {
        return new FrameLayout(paramViewGroup.getContext());
      }
      View localView;
      if (paramView != null)
      {
        localView = paramView;
        if (paramView.getTag().toString().equals("DROPDOWN")) {}
      }
      else
      {
        localView = mContext.getLayoutInflater().inflate(R.layout.adobe_spinner_item_dropdown, paramViewGroup, false);
        localView.setTag("DROPDOWN");
      }
      ((TextView)localView.findViewById(16908308)).setText(getTitle(paramInt));
      return localView;
    }
    
    public Object getItem(int paramInt)
    {
      return mItems.get(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      int i = 0;
      if (mContext == null) {
        return new FrameLayout(paramViewGroup.getContext());
      }
      View localView;
      if (paramView != null)
      {
        localView = paramView;
        if (paramView.getTag().toString().equals("NON_DROPDOWN")) {}
      }
      else
      {
        localView = mContext.getLayoutInflater().inflate(R.layout.adobe_spinner_item_actionbar, paramViewGroup, false);
        localView.setTag("NON_DROPDOWN");
      }
      ((TextView)localView.findViewById(16908308)).setText(getTitle(paramInt));
      paramView = (RelativeLayout)localView.findViewById(R.id.action_bar_dropdown_arrow);
      if (AdobeUxActionBarDropDownController.this.shouldEnableDropDownSelection()) {}
      for (paramInt = i;; paramInt = 8)
      {
        paramView.setVisibility(paramInt);
        return localView;
      }
    }
  }
  
  private class DataSourceSectionSpinnerItem
  {
    private final AdobeUxActionBarDropDownController.CCSection ccSection;
    private final String title;
    
    DataSourceSectionSpinnerItem(AdobeUxActionBarDropDownController.CCSection paramCCSection, String paramString)
    {
      ccSection = paramCCSection;
      title = paramString;
    }
  }
}
