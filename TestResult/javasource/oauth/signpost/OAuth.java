package oauth.signpost;

import com.google.gdata.util.common.base.PercentEscaper;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import oauth.signpost.http.HttpParameters;

public class OAuth
{
  private static final PercentEscaper percentEncoder = new PercentEscaper("-._~", false);
  
  public static String addQueryParameters(String paramString, String... paramVarArgs)
  {
    if (paramString.contains("?")) {}
    for (String str = "&";; str = "?")
    {
      paramString = new StringBuilder(paramString + str);
      int i = 0;
      while (i < paramVarArgs.length)
      {
        if (i > 0) {
          paramString.append("&");
        }
        paramString.append(percentEncode(paramVarArgs[i]) + "=" + percentEncode(paramVarArgs[(i + 1)]));
        i += 2;
      }
    }
    return paramString.toString();
  }
  
  public static void debugOut(String paramString1, String paramString2)
  {
    if (System.getProperty("debug") != null) {
      System.out.println("[SIGNPOST] " + paramString1 + ": " + paramString2);
    }
  }
  
  public static HttpParameters decodeForm(InputStream paramInputStream)
    throws IOException
  {
    BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(paramInputStream));
    StringBuilder localStringBuilder = new StringBuilder();
    for (paramInputStream = localBufferedReader.readLine(); paramInputStream != null; paramInputStream = localBufferedReader.readLine()) {
      localStringBuilder.append(paramInputStream);
    }
    return decodeForm(localStringBuilder.toString());
  }
  
  public static HttpParameters decodeForm(String paramString)
  {
    HttpParameters localHttpParameters = new HttpParameters();
    if (isEmpty(paramString)) {
      return localHttpParameters;
    }
    String[] arrayOfString = paramString.split("\\&");
    int j = arrayOfString.length;
    int i = 0;
    label33:
    int k;
    if (i < j)
    {
      str = arrayOfString[i];
      k = str.indexOf('=');
      if (k >= 0) {
        break label81;
      }
      paramString = percentDecode(str);
    }
    for (String str = null;; str = percentDecode(str.substring(k + 1)))
    {
      localHttpParameters.put(paramString, str);
      i += 1;
      break label33;
      break;
      label81:
      paramString = percentDecode(str.substring(0, k));
    }
  }
  
  public static boolean isEmpty(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }
  
  public static HttpParameters oauthHeaderToParamsMap(String paramString)
  {
    HttpParameters localHttpParameters = new HttpParameters();
    if ((paramString == null) || (!paramString.startsWith("OAuth "))) {}
    for (;;)
    {
      return localHttpParameters;
      paramString = paramString.substring("OAuth ".length()).split(",");
      int j = paramString.length;
      int i = 0;
      while (i < j)
      {
        String[] arrayOfString = paramString[i].split("=");
        localHttpParameters.put(arrayOfString[0].trim(), arrayOfString[1].replace("\"", "").trim());
        i += 1;
      }
    }
  }
  
  public static String percentDecode(String paramString)
  {
    if (paramString == null) {
      return "";
    }
    try
    {
      paramString = URLDecoder.decode(paramString, "UTF-8");
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      throw new RuntimeException(paramString.getMessage(), paramString);
    }
  }
  
  public static String percentEncode(String paramString)
  {
    if (paramString == null) {
      return "";
    }
    return percentEncoder.escape(paramString);
  }
}
