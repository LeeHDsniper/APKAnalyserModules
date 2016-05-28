package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.HitBuilders.ScreenViewBuilder;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class zzdg
  extends zzdd
{
  private static final String ID = zzad.zzcE.toString();
  private static final String zzaSW = zzae.zzdl.toString();
  private static final String zzaSX = zzae.zzdv.toString();
  private static final String zzaSY = zzae.zzeQ.toString();
  private static final String zzaSZ = zzae.zzeK.toString();
  private static final String zzaTa = zzae.zzeJ.toString();
  private static final String zzaTb = zzae.zzdu.toString();
  private static final String zzaTc = zzae.zzhn.toString();
  private static final String zzaTd = zzae.zzhq.toString();
  private static final String zzaTe = zzae.zzhs.toString();
  private static final List<String> zzaTf = Arrays.asList(new String[] { "detail", "checkout", "checkout_option", "click", "add", "remove", "purchase", "refund" });
  private static final Pattern zzaTg = Pattern.compile("dimension(\\d+)");
  private static final Pattern zzaTh = Pattern.compile("metric(\\d+)");
  private static Map<String, String> zzaTi;
  private static Map<String, String> zzaTj;
  private final DataLayer zzaOT;
  private final Set<String> zzaTk;
  private final zzdc zzaTl;
  
  public zzdg(Context paramContext, DataLayer paramDataLayer)
  {
    this(paramContext, paramDataLayer, new zzdc(paramContext));
  }
  
  zzdg(Context paramContext, DataLayer paramDataLayer, zzdc paramZzdc)
  {
    super(ID, new String[0]);
    zzaOT = paramDataLayer;
    zzaTl = paramZzdc;
    zzaTk = new HashSet();
    zzaTk.add("");
    zzaTk.add("0");
    zzaTk.add("false");
  }
  
  private Double zzO(Object paramObject)
  {
    if ((paramObject instanceof String)) {
      try
      {
        paramObject = Double.valueOf((String)paramObject);
        return paramObject;
      }
      catch (NumberFormatException paramObject)
      {
        throw new RuntimeException("Cannot convert the object to Double: " + paramObject.getMessage());
      }
    }
    if ((paramObject instanceof Integer)) {
      return Double.valueOf(((Integer)paramObject).doubleValue());
    }
    if ((paramObject instanceof Double)) {
      return (Double)paramObject;
    }
    throw new RuntimeException("Cannot convert the object to Double: " + paramObject.toString());
  }
  
  private Integer zzP(Object paramObject)
  {
    if ((paramObject instanceof String)) {
      try
      {
        paramObject = Integer.valueOf((String)paramObject);
        return paramObject;
      }
      catch (NumberFormatException paramObject)
      {
        throw new RuntimeException("Cannot convert the object to Integer: " + paramObject.getMessage());
      }
    }
    if ((paramObject instanceof Double)) {
      return Integer.valueOf(((Double)paramObject).intValue());
    }
    if ((paramObject instanceof Integer)) {
      return (Integer)paramObject;
    }
    throw new RuntimeException("Cannot convert the object to Integer: " + paramObject.toString());
  }
  
  private Promotion zzQ(Map<String, String> paramMap)
  {
    Promotion localPromotion = new Promotion();
    String str = (String)paramMap.get("id");
    if (str != null) {
      localPromotion.setId(String.valueOf(str));
    }
    str = (String)paramMap.get("name");
    if (str != null) {
      localPromotion.setName(String.valueOf(str));
    }
    str = (String)paramMap.get("creative");
    if (str != null) {
      localPromotion.setCreative(String.valueOf(str));
    }
    paramMap = (String)paramMap.get("position");
    if (paramMap != null) {
      localPromotion.setPosition(String.valueOf(paramMap));
    }
    return localPromotion;
  }
  
  private Product zzR(Map<String, Object> paramMap)
  {
    Product localProduct = new Product();
    Object localObject = paramMap.get("id");
    if (localObject != null) {
      localProduct.setId(String.valueOf(localObject));
    }
    localObject = paramMap.get("name");
    if (localObject != null) {
      localProduct.setName(String.valueOf(localObject));
    }
    localObject = paramMap.get("brand");
    if (localObject != null) {
      localProduct.setBrand(String.valueOf(localObject));
    }
    localObject = paramMap.get("category");
    if (localObject != null) {
      localProduct.setCategory(String.valueOf(localObject));
    }
    localObject = paramMap.get("variant");
    if (localObject != null) {
      localProduct.setVariant(String.valueOf(localObject));
    }
    localObject = paramMap.get("coupon");
    if (localObject != null) {
      localProduct.setCouponCode(String.valueOf(localObject));
    }
    localObject = paramMap.get("position");
    if (localObject != null) {
      localProduct.setPosition(zzP(localObject).intValue());
    }
    localObject = paramMap.get("price");
    if (localObject != null) {
      localProduct.setPrice(zzO(localObject).doubleValue());
    }
    localObject = paramMap.get("quantity");
    if (localObject != null) {
      localProduct.setQuantity(zzP(localObject).intValue());
    }
    localObject = paramMap.keySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      String str = (String)((Iterator)localObject).next();
      Matcher localMatcher1 = zzaTg.matcher(str);
      int i;
      if (localMatcher1.matches())
      {
        try
        {
          i = Integer.parseInt(localMatcher1.group(1));
          localProduct.setCustomDimension(i, String.valueOf(paramMap.get(str)));
        }
        catch (NumberFormatException localNumberFormatException1)
        {
          zzbg.zzaE("illegal number in custom dimension value: " + str);
        }
      }
      else
      {
        Matcher localMatcher2 = zzaTh.matcher(str);
        if (localMatcher2.matches()) {
          try
          {
            i = Integer.parseInt(localMatcher2.group(1));
            localProduct.setCustomMetric(i, zzP(paramMap.get(str)).intValue());
          }
          catch (NumberFormatException localNumberFormatException2)
          {
            zzbg.zzaE("illegal number in custom metric value: " + str);
          }
        }
      }
    }
    return localProduct;
  }
  
  private Map<String, String> zzS(Map<String, zzag.zza> paramMap)
  {
    paramMap = (zzag.zza)paramMap.get(zzaTd);
    if (paramMap != null) {
      return zzc(paramMap);
    }
    if (zzaTi == null)
    {
      paramMap = new HashMap();
      paramMap.put("transactionId", "&ti");
      paramMap.put("transactionAffiliation", "&ta");
      paramMap.put("transactionTax", "&tt");
      paramMap.put("transactionShipping", "&ts");
      paramMap.put("transactionTotal", "&tr");
      paramMap.put("transactionCurrency", "&cu");
      zzaTi = paramMap;
    }
    return zzaTi;
  }
  
  private Map<String, String> zzT(Map<String, zzag.zza> paramMap)
  {
    paramMap = (zzag.zza)paramMap.get(zzaTe);
    if (paramMap != null) {
      return zzc(paramMap);
    }
    if (zzaTj == null)
    {
      paramMap = new HashMap();
      paramMap.put("name", "&in");
      paramMap.put("sku", "&ic");
      paramMap.put("category", "&iv");
      paramMap.put("price", "&ip");
      paramMap.put("quantity", "&iq");
      paramMap.put("currency", "&cu");
      zzaTj = paramMap;
    }
    return zzaTj;
  }
  
  private void zza(Tracker paramTracker, Map<String, zzag.zza> paramMap)
  {
    String str = zzfd("transactionId");
    if (str == null) {
      zzbg.e("Cannot find transactionId in data layer.");
    }
    for (;;)
    {
      return;
      LinkedList localLinkedList = new LinkedList();
      Object localObject2;
      Object localObject3;
      try
      {
        localObject1 = zzm((zzag.zza)paramMap.get(zzaTb));
        ((Map)localObject1).put("&t", "transaction");
        localObject2 = zzS(paramMap).entrySet().iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localObject3 = (Map.Entry)((Iterator)localObject2).next();
          zzd((Map)localObject1, (String)((Map.Entry)localObject3).getValue(), zzfd((String)((Map.Entry)localObject3).getKey()));
        }
        localLinkedList.add(localObject1);
      }
      catch (IllegalArgumentException paramTracker)
      {
        zzbg.zzb("Unable to send transaction", paramTracker);
        return;
      }
      Object localObject1 = zzfe("transactionProducts");
      if (localObject1 != null)
      {
        localObject1 = ((List)localObject1).iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localObject2 = (Map)((Iterator)localObject1).next();
          if (((Map)localObject2).get("name") == null)
          {
            zzbg.e("Unable to send transaction item hit due to missing 'name' field.");
            return;
          }
          localObject3 = zzm((zzag.zza)paramMap.get(zzaTb));
          ((Map)localObject3).put("&t", "item");
          ((Map)localObject3).put("&ti", str);
          Iterator localIterator = zzT(paramMap).entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            zzd((Map)localObject3, (String)localEntry.getValue(), (String)((Map)localObject2).get(localEntry.getKey()));
          }
          localLinkedList.add(localObject3);
        }
      }
      paramMap = localLinkedList.iterator();
      while (paramMap.hasNext()) {
        paramTracker.send((Map)paramMap.next());
      }
    }
  }
  
  private void zzb(Tracker paramTracker, Map<String, zzag.zza> paramMap)
  {
    HitBuilders.ScreenViewBuilder localScreenViewBuilder = new HitBuilders.ScreenViewBuilder();
    Object localObject1 = zzm((zzag.zza)paramMap.get(zzaTb));
    localScreenViewBuilder.setAll((Map)localObject1);
    if (zzj(paramMap, zzaSZ))
    {
      paramMap = zzaOT.get("ecommerce");
      if (!(paramMap instanceof Map)) {
        break label731;
      }
      paramMap = (Map)paramMap;
    }
    for (;;)
    {
      if (paramMap != null)
      {
        Object localObject2 = (String)((Map)localObject1).get("&cu");
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = (String)paramMap.get("currencyCode");
        }
        if (localObject1 != null) {
          localScreenViewBuilder.set("&cu", (String)localObject1);
        }
        localObject1 = paramMap.get("impressions");
        if ((localObject1 instanceof List))
        {
          localObject1 = ((List)localObject1).iterator();
          for (;;)
          {
            if (((Iterator)localObject1).hasNext())
            {
              localObject2 = (Map)((Iterator)localObject1).next();
              try
              {
                localScreenViewBuilder.addImpression(zzR((Map)localObject2), (String)((Map)localObject2).get("list"));
              }
              catch (RuntimeException localRuntimeException1)
              {
                zzbg.e("Failed to extract a product from DataLayer. " + localRuntimeException1.getMessage());
              }
              continue;
              paramMap = zzdf.zzl((zzag.zza)paramMap.get(zzaTa));
              if (!(paramMap instanceof Map)) {
                break label726;
              }
              paramMap = (Map)paramMap;
              break;
            }
          }
        }
        if (paramMap.containsKey("promoClick")) {
          localObject1 = (List)((Map)paramMap.get("promoClick")).get("promotions");
        }
      }
      for (;;)
      {
        if (localObject1 != null)
        {
          localObject1 = ((List)localObject1).iterator();
          for (;;)
          {
            if (((Iterator)localObject1).hasNext())
            {
              Map localMap1 = (Map)((Iterator)localObject1).next();
              try
              {
                localScreenViewBuilder.addPromotion(zzQ(localMap1));
              }
              catch (RuntimeException localRuntimeException2)
              {
                zzbg.e("Failed to extract a promotion from DataLayer. " + localRuntimeException2.getMessage());
              }
              continue;
              if (!paramMap.containsKey("promoView")) {
                break label720;
              }
              localObject1 = (List)((Map)paramMap.get("promoView")).get("promotions");
              break;
            }
          }
          if (paramMap.containsKey("promoClick")) {
            localScreenViewBuilder.set("&promoa", "click");
          }
        }
        for (int i = 0;; i = 1)
        {
          if (i == 0) {
            break label667;
          }
          Object localObject3 = zzaTf.iterator();
          do
          {
            if (!((Iterator)localObject3).hasNext()) {
              break;
            }
            localObject1 = (String)((Iterator)localObject3).next();
          } while (!paramMap.containsKey(localObject1));
          paramMap = (Map)paramMap.get(localObject1);
          localObject3 = (List)paramMap.get("products");
          if (localObject3 == null) {
            break;
          }
          localObject3 = ((List)localObject3).iterator();
          while (((Iterator)localObject3).hasNext())
          {
            Map localMap2 = (Map)((Iterator)localObject3).next();
            try
            {
              localScreenViewBuilder.addProduct(zzR(localMap2));
            }
            catch (RuntimeException localRuntimeException3)
            {
              zzbg.e("Failed to extract a product from DataLayer. " + localRuntimeException3.getMessage());
            }
          }
          localScreenViewBuilder.set("&promoa", "view");
        }
        for (;;)
        {
          try
          {
            if (!paramMap.containsKey("actionField")) {
              continue;
            }
            paramMap = zze((String)localObject1, (Map)paramMap.get("actionField"));
            localScreenViewBuilder.setProductAction(paramMap);
          }
          catch (RuntimeException paramMap)
          {
            label667:
            zzbg.e("Failed to extract a product action from DataLayer. " + paramMap.getMessage());
            continue;
          }
          paramTracker.send(localScreenViewBuilder.build());
          return;
          paramMap = new ProductAction((String)localObject1);
        }
        label720:
        localObject1 = null;
      }
      label726:
      paramMap = null;
      continue;
      label731:
      paramMap = null;
    }
  }
  
  private Map<String, String> zzc(zzag.zza paramZza)
  {
    paramZza = zzdf.zzl(paramZza);
    if (!(paramZza instanceof Map)) {
      return null;
    }
    Object localObject = (Map)paramZza;
    paramZza = new LinkedHashMap();
    localObject = ((Map)localObject).entrySet().iterator();
    while (((Iterator)localObject).hasNext())
    {
      Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
      paramZza.put(localEntry.getKey().toString(), localEntry.getValue().toString());
    }
    return paramZza;
  }
  
  private void zzd(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if (paramString2 != null) {
      paramMap.put(paramString1, paramString2);
    }
  }
  
  private ProductAction zze(String paramString, Map<String, Object> paramMap)
  {
    paramString = new ProductAction(paramString);
    Object localObject = paramMap.get("id");
    if (localObject != null) {
      paramString.setTransactionId(String.valueOf(localObject));
    }
    localObject = paramMap.get("affiliation");
    if (localObject != null) {
      paramString.setTransactionAffiliation(String.valueOf(localObject));
    }
    localObject = paramMap.get("coupon");
    if (localObject != null) {
      paramString.setTransactionCouponCode(String.valueOf(localObject));
    }
    localObject = paramMap.get("list");
    if (localObject != null) {
      paramString.setProductActionList(String.valueOf(localObject));
    }
    localObject = paramMap.get("option");
    if (localObject != null) {
      paramString.setCheckoutOptions(String.valueOf(localObject));
    }
    localObject = paramMap.get("revenue");
    if (localObject != null) {
      paramString.setTransactionRevenue(zzO(localObject).doubleValue());
    }
    localObject = paramMap.get("tax");
    if (localObject != null) {
      paramString.setTransactionTax(zzO(localObject).doubleValue());
    }
    localObject = paramMap.get("shipping");
    if (localObject != null) {
      paramString.setTransactionShipping(zzO(localObject).doubleValue());
    }
    paramMap = paramMap.get("step");
    if (paramMap != null) {
      paramString.setCheckoutStep(zzP(paramMap).intValue());
    }
    return paramString;
  }
  
  private String zzfd(String paramString)
  {
    paramString = zzaOT.get(paramString);
    if (paramString == null) {
      return null;
    }
    return paramString.toString();
  }
  
  private List<Map<String, String>> zzfe(String paramString)
  {
    paramString = zzaOT.get(paramString);
    if (paramString == null) {
      return null;
    }
    if (!(paramString instanceof List)) {
      throw new IllegalArgumentException("transactionProducts should be of type List.");
    }
    Iterator localIterator = ((List)paramString).iterator();
    while (localIterator.hasNext()) {
      if (!(localIterator.next() instanceof Map)) {
        throw new IllegalArgumentException("Each element of transactionProducts should be of type Map.");
      }
    }
    return (List)paramString;
  }
  
  private boolean zzj(Map<String, zzag.zza> paramMap, String paramString)
  {
    paramMap = (zzag.zza)paramMap.get(paramString);
    if (paramMap == null) {
      return false;
    }
    return zzdf.zzk(paramMap).booleanValue();
  }
  
  private Map<String, String> zzm(zzag.zza paramZza)
  {
    if (paramZza == null) {
      return new HashMap();
    }
    paramZza = zzc(paramZza);
    if (paramZza == null) {
      return new HashMap();
    }
    String str = (String)paramZza.get("&aip");
    if ((str != null) && (zzaTk.contains(str.toLowerCase()))) {
      paramZza.remove("&aip");
    }
    return paramZza;
  }
  
  public void zzI(Map<String, zzag.zza> paramMap)
  {
    Tracker localTracker = zzaTl.zzeV("_GTM_DEFAULT_TRACKER_");
    localTracker.enableAdvertisingIdCollection(zzj(paramMap, "collect_adid"));
    if (zzj(paramMap, zzaSY))
    {
      zzb(localTracker, paramMap);
      return;
    }
    if (zzj(paramMap, zzaSX))
    {
      localTracker.send(zzm((zzag.zza)paramMap.get(zzaTb)));
      return;
    }
    if (zzj(paramMap, zzaTc))
    {
      zza(localTracker, paramMap);
      return;
    }
    zzbg.zzaE("Ignoring unknown tag.");
  }
}
