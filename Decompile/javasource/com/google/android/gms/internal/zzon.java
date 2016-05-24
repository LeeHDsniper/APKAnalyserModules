package com.google.android.gms.internal;

import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class zzon
  extends zzod<zzon>
{
  private ProductAction zzKC;
  private final Map<String, List<Product>> zzKD = new HashMap();
  private final List<Promotion> zzKE = new ArrayList();
  private final List<Product> zzKF = new ArrayList();
  
  public zzon() {}
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    if (!zzKF.isEmpty()) {
      localHashMap.put("products", zzKF);
    }
    if (!zzKE.isEmpty()) {
      localHashMap.put("promotions", zzKE);
    }
    if (!zzKD.isEmpty()) {
      localHashMap.put("impressions", zzKD);
    }
    localHashMap.put("productAction", zzKC);
    return zzA(localHashMap);
  }
  
  public void zza(Product paramProduct, String paramString)
  {
    if (paramProduct == null) {
      return;
    }
    String str = paramString;
    if (paramString == null) {
      str = "";
    }
    if (!zzKD.containsKey(str)) {
      zzKD.put(str, new ArrayList());
    }
    ((List)zzKD.get(str)).add(paramProduct);
  }
  
  public void zza(zzon paramZzon)
  {
    zzKF.addAll(zzKF);
    zzKE.addAll(zzKE);
    Iterator localIterator = zzKD.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject = (Map.Entry)localIterator.next();
      String str = (String)((Map.Entry)localObject).getKey();
      localObject = ((List)((Map.Entry)localObject).getValue()).iterator();
      while (((Iterator)localObject).hasNext()) {
        paramZzon.zza((Product)((Iterator)localObject).next(), str);
      }
    }
    if (zzKC != null) {
      zzKC = zzKC;
    }
  }
  
  public ProductAction zzxM()
  {
    return zzKC;
  }
  
  public List<Product> zzxN()
  {
    return Collections.unmodifiableList(zzKF);
  }
  
  public Map<String, List<Product>> zzxO()
  {
    return zzKD;
  }
  
  public List<Promotion> zzxP()
  {
    return Collections.unmodifiableList(zzKE);
  }
}
