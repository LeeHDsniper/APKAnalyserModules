package com.google.android.gms.internal;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@zzgk
class zzgq
{
  private final String zzBm;
  private int zzCI;
  private String zzF;
  private final boolean zzFA;
  private final List<String> zzFu;
  private final List<String> zzFv;
  private final String zzFw;
  private final String zzFx;
  private final String zzFy;
  private final String zzFz;
  
  public zzgq(int paramInt, Map<String, String> paramMap)
  {
    zzF = ((String)paramMap.get("url"));
    zzFx = ((String)paramMap.get("base_uri"));
    zzFy = ((String)paramMap.get("post_parameters"));
    zzFA = parseBoolean((String)paramMap.get("drt_include"));
    zzFw = ((String)paramMap.get("activation_overlay_url"));
    zzFv = zzaq((String)paramMap.get("check_packages"));
    zzBm = ((String)paramMap.get("request_id"));
    zzFz = ((String)paramMap.get("type"));
    zzFu = zzaq((String)paramMap.get("errors"));
    zzCI = paramInt;
  }
  
  private static boolean parseBoolean(String paramString)
  {
    return (paramString != null) && ((paramString.equals("1")) || (paramString.equals("true")));
  }
  
  private List<String> zzaq(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return Arrays.asList(paramString.split(","));
  }
  
  public int getErrorCode()
  {
    return zzCI;
  }
  
  public String getRequestId()
  {
    return zzBm;
  }
  
  public String getType()
  {
    return zzFz;
  }
  
  public String getUrl()
  {
    return zzF;
  }
  
  public void setUrl(String paramString)
  {
    zzF = paramString;
  }
  
  public List<String> zzfK()
  {
    return zzFu;
  }
  
  public String zzfL()
  {
    return zzFy;
  }
  
  public boolean zzfM()
  {
    return zzFA;
  }
}
