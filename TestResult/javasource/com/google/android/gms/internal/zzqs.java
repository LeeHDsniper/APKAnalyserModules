package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbg;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

public class zzqs
{
  private String zzaPw = "https://www.google-analytics.com";
  
  public zzqs() {}
  
  private String zzff(String paramString)
  {
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8").replaceAll("\\+", "%20");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbg.e("Cannot encode the string: " + paramString);
    }
    return "";
  }
  
  public void zzfj(String paramString)
  {
    zzaPw = paramString;
    zzbg.zzaD("The Ctfe server endpoint was changed to: " + paramString);
  }
  
  public String zzt(List<zzqi> paramList)
  {
    return zzaPw + "/gtm/android?" + zzu(paramList);
  }
  
  String zzu(List<zzqi> paramList)
  {
    boolean bool = true;
    if (paramList.size() <= 1) {}
    for (;;)
    {
      zzx.zzZ(bool);
      if (!paramList.isEmpty()) {
        break;
      }
      return "";
      bool = false;
    }
    zzqi localZzqi = (zzqi)paramList.get(0);
    StringBuilder localStringBuilder;
    if (!localZzqi.zzBt().trim().equals(""))
    {
      paramList = localZzqi.zzBt().trim();
      localStringBuilder = new StringBuilder();
      if (localZzqi.zzBq() == null) {
        break label162;
      }
      localStringBuilder.append(localZzqi.zzBq());
    }
    for (;;)
    {
      localStringBuilder.append("=").append(zzff(localZzqi.getContainerId())).append("&").append("pv").append("=").append(zzff(paramList));
      if (localZzqi.zzBs()) {
        localStringBuilder.append("&gtm_debug=x");
      }
      return localStringBuilder.toString();
      paramList = "-1";
      break;
      label162:
      localStringBuilder.append("id");
    }
  }
}
