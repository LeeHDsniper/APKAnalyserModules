package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.support.v4.app.FragmentActivity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;

public abstract interface IAdobeAssetContainerListViewDelegate
{
  public abstract FragmentActivity getHostActivity();
  
  public abstract void handleAssetClickAction(Object paramObject);
  
  public abstract void handleLongClickOnAsset(AdobeAsset paramAdobeAsset);
  
  public abstract void loadMoreItemsFromDataSource();
  
  public abstract void navigateToCollection(AdobeAssetViewNavigateCommands.NavBaseCommandData paramNavBaseCommandData);
  
  public abstract void reloadAssetItemsFromDataSourceDueToSwipeRefresh();
}
