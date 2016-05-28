package com.google.android.gms.analytics;

import android.text.TextUtils;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.analytics.internal.zzae;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class HitBuilders
{
  protected static class HitBuilder<T extends HitBuilder>
  {
    private Map<String, String> zzKB = new HashMap();
    ProductAction zzKC;
    Map<String, List<Product>> zzKD = new HashMap();
    List<Promotion> zzKE = new ArrayList();
    List<Product> zzKF = new ArrayList();
    
    protected HitBuilder() {}
    
    public T addImpression(Product paramProduct, String paramString)
    {
      if (paramProduct == null)
      {
        zzae.zzaE("product should be non-null");
        return this;
      }
      String str = paramString;
      if (paramString == null) {
        str = "";
      }
      if (!zzKD.containsKey(str)) {
        zzKD.put(str, new ArrayList());
      }
      ((List)zzKD.get(str)).add(paramProduct);
      return this;
    }
    
    public T addProduct(Product paramProduct)
    {
      if (paramProduct == null)
      {
        zzae.zzaE("product should be non-null");
        return this;
      }
      zzKF.add(paramProduct);
      return this;
    }
    
    public T addPromotion(Promotion paramPromotion)
    {
      if (paramPromotion == null)
      {
        zzae.zzaE("promotion should be non-null");
        return this;
      }
      zzKE.add(paramPromotion);
      return this;
    }
    
    public Map<String, String> build()
    {
      HashMap localHashMap = new HashMap(zzKB);
      if (zzKC != null) {
        localHashMap.putAll(zzKC.build());
      }
      Iterator localIterator = zzKE.iterator();
      int i = 1;
      while (localIterator.hasNext())
      {
        localHashMap.putAll(((Promotion)localIterator.next()).zzaV(zzc.zzU(i)));
        i += 1;
      }
      localIterator = zzKF.iterator();
      i = 1;
      while (localIterator.hasNext())
      {
        localHashMap.putAll(((Product)localIterator.next()).zzaV(zzc.zzS(i)));
        i += 1;
      }
      localIterator = zzKD.entrySet().iterator();
      i = 1;
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        Object localObject = (List)localEntry.getValue();
        String str = zzc.zzX(i);
        localObject = ((List)localObject).iterator();
        int j = 1;
        while (((Iterator)localObject).hasNext())
        {
          localHashMap.putAll(((Product)((Iterator)localObject).next()).zzaV(str + zzc.zzW(j)));
          j += 1;
        }
        if (!TextUtils.isEmpty((CharSequence)localEntry.getKey())) {
          localHashMap.put(str + "nm", localEntry.getKey());
        }
        i += 1;
      }
      return localHashMap;
    }
    
    public final T set(String paramString1, String paramString2)
    {
      if (paramString1 != null)
      {
        zzKB.put(paramString1, paramString2);
        return this;
      }
      zzae.zzaE(" HitBuilder.set() called with a null paramName.");
      return this;
    }
    
    public final T setAll(Map<String, String> paramMap)
    {
      if (paramMap == null) {
        return this;
      }
      zzKB.putAll(new HashMap(paramMap));
      return this;
    }
    
    public T setProductAction(ProductAction paramProductAction)
    {
      zzKC = paramProductAction;
      return this;
    }
  }
  
  public static class ScreenViewBuilder
    extends HitBuilders.HitBuilder<ScreenViewBuilder>
  {
    public ScreenViewBuilder()
    {
      set("&t", "screenview");
    }
  }
}
