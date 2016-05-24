package com.adobe.creativesdk.foundation.internal.photo.util;

import com.adobe.creativesdk.foundation.storage.AdobePhotoErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobePhotoException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

public class AdobePhotoUtils
{
  public static JSONObject JSONObjectWithData(String paramString)
    throws AdobePhotoException
  {
    try
    {
      Matcher localMatcher = Pattern.compile("while \\(1\\) \\{\\}").matcher(paramString);
      if (localMatcher.find()) {
        paramString = localMatcher.replaceAll("").trim();
      }
      paramString = new JSONObject(paramString);
      return paramString;
    }
    catch (Exception paramString)
    {
      throw new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, null, "Parsed collection data is not of type dictionary.");
    }
  }
  
  public static String generateGUID()
  {
    return UUID.randomUUID().toString().replace("-", "").toLowerCase();
  }
}
