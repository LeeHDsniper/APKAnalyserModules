package com.google.android.gms.analytics.ecommerce;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzod;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class ProductAction
{
  Map<String, String> zzLj = new HashMap();
  
  public ProductAction(String paramString)
  {
    put("&pa", paramString);
  }
  
  public Map<String, String> build()
  {
    return new HashMap(zzLj);
  }
  
  void put(String paramString1, String paramString2)
  {
    zzx.zzb(paramString1, "Name should be non-null");
    zzLj.put(paramString1, paramString2);
  }
  
  public ProductAction setCheckoutOptions(String paramString)
  {
    put("&col", paramString);
    return this;
  }
  
  public ProductAction setCheckoutStep(int paramInt)
  {
    put("&cos", Integer.toString(paramInt));
    return this;
  }
  
  public ProductAction setProductActionList(String paramString)
  {
    put("&pal", paramString);
    return this;
  }
  
  public ProductAction setTransactionAffiliation(String paramString)
  {
    put("&ta", paramString);
    return this;
  }
  
  public ProductAction setTransactionCouponCode(String paramString)
  {
    put("&tcc", paramString);
    return this;
  }
  
  public ProductAction setTransactionId(String paramString)
  {
    put("&ti", paramString);
    return this;
  }
  
  public ProductAction setTransactionRevenue(double paramDouble)
  {
    put("&tr", Double.toString(paramDouble));
    return this;
  }
  
  public ProductAction setTransactionShipping(double paramDouble)
  {
    put("&ts", Double.toString(paramDouble));
    return this;
  }
  
  public ProductAction setTransactionTax(double paramDouble)
  {
    put("&tt", Double.toString(paramDouble));
    return this;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = zzLj.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((String)localEntry.getKey()).startsWith("&")) {
        localHashMap.put(((String)localEntry.getKey()).substring(1), localEntry.getValue());
      } else {
        localHashMap.put(localEntry.getKey(), localEntry.getValue());
      }
    }
    return zzod.zzF(localHashMap);
  }
}
