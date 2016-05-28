package com.behance.sdk.util;

import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class BehanceSDKUrlUtil
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKUrlUtil.class);
  
  public BehanceSDKUrlUtil() {}
  
  public static String appendQueryStringParam(String paramString1, String paramString2, Object paramObject)
  {
    for (;;)
    {
      try
      {
        if (!paramString2.equals("access_token"))
        {
          str = paramString2;
          if (!paramString2.equals("user_token"))
          {
            if (paramString1.contains("?")) {
              return paramString1 + "&" + str + "=" + URLEncoder.encode(String.valueOf(paramObject), "UTF-8");
            }
            paramString2 = paramString1 + "?" + str + "=" + URLEncoder.encode(String.valueOf(paramObject), "UTF-8");
            return paramString2;
          }
        }
      }
      catch (UnsupportedEncodingException paramString2)
      {
        logger.error(paramString2);
        return paramString1;
      }
      String str = "user_token";
    }
  }
  
  public static String getUrlFromTemplate(String paramString, Map<String, String> paramMap)
  {
    paramString = paramString.replace("{server_root_url}", "https://cc-api-behance.adobe.io").replace("{key_client_id_param}", "api_key");
    String str1 = paramString;
    if (paramMap != null)
    {
      Iterator localIterator = paramMap.keySet().iterator();
      for (;;)
      {
        str1 = paramString;
        if (!localIterator.hasNext()) {
          break;
        }
        str1 = (String)localIterator.next();
        String str2 = (String)paramMap.get(str1);
        paramString = paramString.replace("{" + str1 + "}", str2);
      }
    }
    return str1;
  }
}
