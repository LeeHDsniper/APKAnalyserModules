package com.adobe.creativesdk.foundation.internal.storage;

public abstract interface IAdobeAssetDataSource
{
  public abstract int getCount();
  
  public abstract boolean loadItemsFromScratch();
  
  public abstract void loadNextPageOfData();
  
  public abstract void resetDelegate();
}
