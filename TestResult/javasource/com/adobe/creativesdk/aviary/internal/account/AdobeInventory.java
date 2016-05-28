package com.adobe.creativesdk.aviary.internal.account;

import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class AdobeInventory
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger(AdobeInventory.class.getSimpleName());
  String[] mPurchaseArray = new String[0];
  
  AdobeInventory() {}
  
  void addAll(HashMap<String, String[]> paramHashMap)
  {
    logger.info("addAll");
    HashSet localHashSet = new HashSet(Arrays.asList(mPurchaseArray));
    Iterator localIterator = paramHashMap.keySet().iterator();
    while (localIterator.hasNext()) {
      localHashSet.addAll(Arrays.asList((Object[])paramHashMap.get((String)localIterator.next())));
    }
    paramHashMap = new ArrayList(localHashSet);
    Collections.sort(paramHashMap);
    mPurchaseArray = ((String[])paramHashMap.toArray(new String[paramHashMap.size()]));
  }
  
  void clear()
  {
    logger.log("clear");
    mPurchaseArray = new String[0];
  }
  
  public List<String> getAllOwnedSkus()
  {
    return Collections.unmodifiableList(Arrays.asList(mPurchaseArray));
  }
  
  public boolean hasPurchase(String paramString)
  {
    return Arrays.binarySearch(mPurchaseArray, paramString) > -1;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("AdobeInventory{size:");
    localStringBuilder.append(mPurchaseArray.length);
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
}
