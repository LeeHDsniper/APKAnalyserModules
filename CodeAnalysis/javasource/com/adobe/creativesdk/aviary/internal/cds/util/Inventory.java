package com.adobe.creativesdk.aviary.internal.cds.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Inventory
{
  Map<String, Purchase> mPurchaseMap = new HashMap();
  Map<String, SkuDetails> mSkuMap = new HashMap();
  
  public Inventory() {}
  
  public void addAll(Inventory paramInventory)
  {
    if (paramInventory != null)
    {
      mSkuMap.putAll(mSkuMap);
      mPurchaseMap.putAll(mPurchaseMap);
    }
  }
  
  public void addPurchase(Purchase paramPurchase)
  {
    mPurchaseMap.put(paramPurchase.getSku(), paramPurchase);
  }
  
  public void addSkuDetails(SkuDetails paramSkuDetails)
  {
    mSkuMap.put(paramSkuDetails.getSku(), paramSkuDetails);
  }
  
  public List<String> getAllOwnedSkus()
  {
    return new ArrayList(mPurchaseMap.keySet());
  }
  
  public SkuDetails getSkuDetails(String paramString)
  {
    return (SkuDetails)mSkuMap.get(paramString);
  }
  
  public boolean hasDetails(String paramString)
  {
    return mSkuMap.containsKey(paramString);
  }
  
  public boolean hasPurchase(String paramString)
  {
    return mPurchaseMap.containsKey(paramString);
  }
}
