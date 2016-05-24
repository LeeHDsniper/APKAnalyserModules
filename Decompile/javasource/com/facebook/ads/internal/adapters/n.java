package com.facebook.ads.internal.adapters;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.util.Log;
import com.facebook.ads.NativeAd.Image;
import com.facebook.ads.NativeAd.Rating;
import com.facebook.ads.NativeAdViewAttributes;
import com.facebook.ads.internal.action.b;
import com.facebook.ads.internal.util.b.a;
import com.facebook.ads.internal.util.e;
import com.facebook.ads.internal.util.f;
import com.facebook.ads.internal.util.g;
import com.facebook.ads.internal.util.o;
import com.facebook.ads.internal.util.s;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class n
  implements a
{
  private static final String a = n.class.getSimpleName();
  private final String A;
  private final NativeAd.Image B;
  private final String C;
  private final String D;
  private final a E;
  private final NativeAdViewAttributes F;
  private final String G;
  private boolean H;
  private boolean I;
  private long K = 0L;
  private b.a L = null;
  private final Uri b;
  private final String c;
  private final String d;
  private final String e;
  private final String f;
  private final String g;
  private final NativeAd.Image h;
  private final NativeAd.Image i;
  private final NativeAd.Rating j;
  private final String k;
  private final String l;
  private final String m;
  private final String n;
  private final e o;
  private final String p;
  private final Collection<String> q;
  private final boolean r;
  private final boolean s;
  private final boolean t;
  private final int u;
  private final int v;
  private final int w;
  private final int x;
  private final String y;
  private final String z;
  
  private n(Uri paramUri, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, NativeAd.Image paramImage1, NativeAd.Image paramImage2, NativeAd.Rating paramRating, String paramString6, String paramString7, String paramString8, e paramE, String paramString9, Collection<String> paramCollection, boolean paramBoolean1, NativeAd.Image paramImage3, String paramString10, String paramString11, a paramA, String paramString12, boolean paramBoolean2, boolean paramBoolean3, int paramInt1, int paramInt2, String paramString13, String paramString14, String paramString15, int paramInt3, int paramInt4, NativeAdViewAttributes paramNativeAdViewAttributes)
  {
    b = paramUri;
    c = paramString1;
    d = paramString2;
    e = paramString3;
    f = paramString4;
    g = paramString5;
    h = paramImage1;
    i = paramImage2;
    j = paramRating;
    k = paramString6;
    m = paramString7;
    n = paramString8;
    o = paramE;
    p = paramString9;
    q = paramCollection;
    r = paramBoolean1;
    s = paramBoolean2;
    t = paramBoolean3;
    B = paramImage3;
    C = paramString10;
    D = paramString11;
    E = paramA;
    l = paramString12;
    u = paramInt1;
    v = paramInt2;
    w = paramInt3;
    x = paramInt4;
    y = paramString13;
    z = paramString14;
    A = paramString15;
    F = paramNativeAdViewAttributes;
    G = UUID.randomUUID().toString();
  }
  
  private boolean B()
  {
    return (c != null) && (c.length() > 0) && (f != null) && (f.length() > 0) && (h != null) && (i != null);
  }
  
  public static n a(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {
      paramJSONObject = null;
    }
    for (;;)
    {
      return paramJSONObject;
      Uri localUri = Uri.parse(paramJSONObject.optString("fbad_command"));
      String str1 = paramJSONObject.optString("title");
      String str2 = paramJSONObject.optString("subtitle");
      String str3 = paramJSONObject.optString("body");
      String str4 = paramJSONObject.optString("call_to_action");
      String str5 = paramJSONObject.optString("social_context");
      NativeAd.Image localImage2 = NativeAd.Image.fromJSONObject(paramJSONObject.optJSONObject("icon"));
      NativeAd.Image localImage3 = NativeAd.Image.fromJSONObject(paramJSONObject.optJSONObject("image"));
      NativeAd.Rating localRating = NativeAd.Rating.fromJSONObject(paramJSONObject.optJSONObject("star_rating"));
      String str6 = paramJSONObject.optString("impression_report_url");
      String str7 = paramJSONObject.optString("native_view_report_url");
      String str8 = paramJSONObject.optString("click_report_url");
      String str9 = paramJSONObject.optString("used_report_url");
      boolean bool1 = paramJSONObject.optBoolean("manual_imp");
      boolean bool2 = paramJSONObject.optBoolean("enable_view_log");
      boolean bool3 = paramJSONObject.optBoolean("enable_snapshot_log");
      int i1 = paramJSONObject.optInt("snapshot_log_delay_second", 4);
      int i2 = paramJSONObject.optInt("snapshot_compress_quality", 0);
      int i3 = paramJSONObject.optInt("viewability_check_initial_delay", 0);
      int i4 = paramJSONObject.optInt("viewability_check_interval", 1000);
      NativeAd.Image localImage1 = null;
      Object localObject2 = paramJSONObject.optJSONObject("ad_choices_icon");
      Object localObject1 = paramJSONObject.optJSONObject("native_ui_config");
      String str10;
      String str11;
      e localE;
      String str12;
      if (localObject1 == null)
      {
        localObject1 = null;
        if (localObject2 != null) {
          localImage1 = NativeAd.Image.fromJSONObject((JSONObject)localObject2);
        }
        str10 = paramJSONObject.optString("ad_choices_link_url");
        str11 = paramJSONObject.optString("request_id");
        localE = e.a(paramJSONObject.optString("invalidation_behavior"));
        str12 = paramJSONObject.optString("invalidation_report_url");
      }
      try
      {
        localObject2 = new JSONArray(paramJSONObject.optString("detection_strings"));
        localObject1 = new n(localUri, str1, str2, str3, str4, str5, localImage2, localImage3, localRating, str6, str8, str9, localE, str12, f.a((JSONArray)localObject2), bool1, localImage1, str10, str11, new a(paramJSONObject.optJSONArray("trackers")), str7, bool2, bool3, i1, i2, paramJSONObject.optString("video_url"), paramJSONObject.optString("video_play_report_url"), paramJSONObject.optString("video_time_report_url"), i3, i4, (NativeAdViewAttributes)localObject1);
        paramJSONObject = (JSONObject)localObject1;
        if (((n)localObject1).B()) {
          continue;
        }
        return null;
        localObject1 = new NativeAdViewAttributes((JSONObject)localObject1);
      }
      catch (JSONException localJSONException)
      {
        for (;;)
        {
          localJSONException.printStackTrace();
          Object localObject3 = null;
        }
      }
    }
  }
  
  private void a(String paramString, Map<String, String> paramMap, Map<String, Object> paramMap1)
  {
    if (paramMap1.containsKey(paramString)) {
      paramMap.put(paramString, String.valueOf(paramMap1.get(paramString)));
    }
  }
  
  private void a(Map<String, String> paramMap, Map<String, Object> paramMap1)
  {
    if (paramMap1.containsKey("mil"))
    {
      boolean bool = ((Boolean)paramMap1.get("mil")).booleanValue();
      paramMap1.remove("mil");
      if (!bool) {
        return;
      }
    }
    paramMap.put("mil", String.valueOf(true));
  }
  
  private Map<String, String> b(Map<String, Object> paramMap)
  {
    HashMap localHashMap = new HashMap();
    if (paramMap.containsKey("view")) {
      localHashMap.put("view", String.valueOf(paramMap.get("view")));
    }
    if (paramMap.containsKey("snapshot")) {
      localHashMap.put("snapshot", String.valueOf(paramMap.get("snapshot")));
    }
    return localHashMap;
  }
  
  private void b(Map<String, String> paramMap, Map<String, Object> paramMap1)
  {
    a("nti", paramMap, paramMap1);
    a("nhs", paramMap, paramMap1);
    a("nmv", paramMap, paramMap1);
  }
  
  public e a()
  {
    return o;
  }
  
  public void a(Context paramContext, Map<String, Object> paramMap)
  {
    if (!I)
    {
      HashMap localHashMap = new HashMap();
      if (paramMap != null)
      {
        a(localHashMap, paramMap);
        b(localHashMap, paramMap);
        localHashMap.put("touch", g.a(paramMap));
      }
      new o(localHashMap).execute(new String[] { m });
      E.a("click");
      I = true;
      g.a(paramContext, "Click logged");
    }
    paramContext = b.a(paramContext, b);
    if (paramContext != null) {}
    try
    {
      K = System.currentTimeMillis();
      L = paramContext.a();
      paramContext.b();
      return;
    }
    catch (Exception paramContext)
    {
      Log.e(a, "Error executing action", paramContext);
    }
  }
  
  public void a(final Map<String, Object> paramMap)
  {
    final HashMap localHashMap;
    if (!H)
    {
      localHashMap = new HashMap();
      if (paramMap != null)
      {
        a(localHashMap, paramMap);
        b(localHashMap, paramMap);
      }
      new o(localHashMap).execute(new String[] { k });
      if ((!p()) && (!q())) {}
    }
    try
    {
      paramMap = b(paramMap);
      new Handler().postDelayed(new Runnable()
      {
        public void run()
        {
          new o(localHashMap, paramMap).execute(new String[] { n.a(n.this) });
        }
      }, u * 1000);
      E.a("impression");
      H = true;
      return;
    }
    catch (Exception paramMap)
    {
      for (;;) {}
    }
  }
  
  public String b()
  {
    return p;
  }
  
  public Collection<String> c()
  {
    return q;
  }
  
  public NativeAd.Image e()
  {
    return i;
  }
  
  public String l()
  {
    return y;
  }
  
  public String m()
  {
    return z;
  }
  
  public String n()
  {
    return A;
  }
  
  public boolean p()
  {
    return s;
  }
  
  public boolean q()
  {
    return t;
  }
  
  public int r()
  {
    if ((v < 0) || (v > 100)) {
      return 0;
    }
    return v;
  }
  
  public String v()
  {
    return D;
  }
  
  private static class a
  {
    Map<String, List<String>> a = new HashMap();
    
    a(JSONArray paramJSONArray)
    {
      if (paramJSONArray == null) {
        return;
      }
      int i = 0;
      label22:
      Object localObject;
      String str;
      if (i < paramJSONArray.length())
      {
        localObject = paramJSONArray.optJSONObject(i);
        str = ((JSONObject)localObject).optString("type");
        if (!s.a(str)) {
          break label61;
        }
      }
      for (;;)
      {
        i += 1;
        break label22;
        break;
        label61:
        localObject = ((JSONObject)localObject).optJSONArray("urls");
        if (localObject != null)
        {
          ArrayList localArrayList = new ArrayList(((JSONArray)localObject).length());
          int j = 0;
          while (j < ((JSONArray)localObject).length())
          {
            localArrayList.add(((JSONArray)localObject).optString(j));
            j += 1;
          }
          a.put(str, localArrayList);
        }
      }
    }
    
    void a(String paramString)
    {
      paramString = (List)a.get(paramString);
      if ((paramString == null) || (paramString.isEmpty())) {}
      for (;;)
      {
        return;
        paramString = paramString.iterator();
        while (paramString.hasNext())
        {
          String str = (String)paramString.next();
          new o().execute(new String[] { str });
        }
      }
    }
  }
}
