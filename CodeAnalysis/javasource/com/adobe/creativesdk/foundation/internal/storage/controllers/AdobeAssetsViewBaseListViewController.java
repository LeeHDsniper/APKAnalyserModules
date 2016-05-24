package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import java.lang.ref.WeakReference;

public abstract class AdobeAssetsViewBaseListViewController
{
  protected WeakReference<IAdobeAssetContainerListViewDelegate> _parentContainer;
  protected final double kAdobeStorageInfiniteScrollPercentThreshold = 0.8D;
  
  public AdobeAssetsViewBaseListViewController(Context paramContext) {}
  
  protected Activity getHostActivity()
  {
    return ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).getHostActivity();
  }
  
  public abstract InstanceState getInstanceState();
  
  public abstract void refreshDueToDataChange();
  
  public abstract void refreshDueToNewItemsInsertion();
  
  public abstract void restoreFromState(InstanceState paramInstanceState);
  
  public void setContainerController(IAdobeAssetContainerListViewDelegate paramIAdobeAssetContainerListViewDelegate)
  {
    _parentContainer = new WeakReference(paramIAdobeAssetContainerListViewDelegate);
  }
  
  public abstract void showLoadingFooter();
  
  public abstract void stopRefreshAnimation();
  
  public class InstanceState
  {
    public InstanceState() {}
  }
}
