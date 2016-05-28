package com.facebook.ads;

import android.graphics.Color;
import android.graphics.Typeface;
import com.facebook.ads.internal.util.b;
import com.facebook.ads.internal.util.c;
import org.json.JSONObject;

public class NativeAdViewAttributes
{
  private Typeface a = Typeface.DEFAULT;
  private int b = -1;
  private int c = -16777216;
  private int d = -11643291;
  private int e = 0;
  private int f = -12420889;
  private int g = -12420889;
  private boolean h = true;
  
  public NativeAdViewAttributes() {}
  
  public NativeAdViewAttributes(JSONObject paramJSONObject)
  {
    try
    {
      int i;
      int m;
      int n;
      int j;
      if (paramJSONObject.getBoolean("background_transparent"))
      {
        i = 0;
        m = Color.parseColor(paramJSONObject.getString("title_text_color"));
        n = Color.parseColor(paramJSONObject.getString("description_text_color"));
        if (!paramJSONObject.getBoolean("button_transparent")) {
          break label181;
        }
        j = 0;
        label97:
        if (!paramJSONObject.getBoolean("button_border_transparent")) {
          break label194;
        }
      }
      for (;;)
      {
        int i1 = Color.parseColor(paramJSONObject.getString("button_text_color"));
        paramJSONObject = Typeface.create(paramJSONObject.getString("android_typeface"), 0);
        b = i;
        c = m;
        d = n;
        e = j;
        g = k;
        f = i1;
        a = paramJSONObject;
        return;
        i = Color.parseColor(paramJSONObject.getString("background_color"));
        break;
        label181:
        j = Color.parseColor(paramJSONObject.getString("button_color"));
        break label97;
        label194:
        k = Color.parseColor(paramJSONObject.getString("button_border_color"));
      }
      return;
    }
    catch (Exception paramJSONObject)
    {
      c.a(b.a(paramJSONObject, "Error retrieving native ui configuration data"));
    }
  }
}
