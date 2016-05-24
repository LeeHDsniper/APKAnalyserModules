package org.apache.http.message;

import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicHeaderValueFormatter
  implements HeaderValueFormatter
{
  @Deprecated
  public static final BasicHeaderValueFormatter DEFAULT = new BasicHeaderValueFormatter();
  public static final BasicHeaderValueFormatter INSTANCE = new BasicHeaderValueFormatter();
  public static final String SEPARATORS = " ;,:@()<>\\\"/[]?={}\t";
  public static final String UNSAFE_CHARS = "\"\\";
  
  public BasicHeaderValueFormatter() {}
  
  public static String formatElements(HeaderElement[] paramArrayOfHeaderElement, boolean paramBoolean, HeaderValueFormatter paramHeaderValueFormatter)
  {
    if (paramHeaderValueFormatter != null) {}
    for (;;)
    {
      return paramHeaderValueFormatter.formatElements(null, paramArrayOfHeaderElement, paramBoolean).toString();
      paramHeaderValueFormatter = INSTANCE;
    }
  }
  
  public static String formatHeaderElement(HeaderElement paramHeaderElement, boolean paramBoolean, HeaderValueFormatter paramHeaderValueFormatter)
  {
    if (paramHeaderValueFormatter != null) {}
    for (;;)
    {
      return paramHeaderValueFormatter.formatHeaderElement(null, paramHeaderElement, paramBoolean).toString();
      paramHeaderValueFormatter = INSTANCE;
    }
  }
  
  public static String formatNameValuePair(NameValuePair paramNameValuePair, boolean paramBoolean, HeaderValueFormatter paramHeaderValueFormatter)
  {
    if (paramHeaderValueFormatter != null) {}
    for (;;)
    {
      return paramHeaderValueFormatter.formatNameValuePair(null, paramNameValuePair, paramBoolean).toString();
      paramHeaderValueFormatter = INSTANCE;
    }
  }
  
  public static String formatParameters(NameValuePair[] paramArrayOfNameValuePair, boolean paramBoolean, HeaderValueFormatter paramHeaderValueFormatter)
  {
    if (paramHeaderValueFormatter != null) {}
    for (;;)
    {
      return paramHeaderValueFormatter.formatParameters(null, paramArrayOfNameValuePair, paramBoolean).toString();
      paramHeaderValueFormatter = INSTANCE;
    }
  }
  
  protected void doFormatValue(CharArrayBuffer paramCharArrayBuffer, String paramString, boolean paramBoolean)
  {
    boolean bool = paramBoolean;
    if (!paramBoolean)
    {
      i = 0;
      for (;;)
      {
        bool = paramBoolean;
        if (i >= paramString.length()) {
          break;
        }
        bool = paramBoolean;
        if (paramBoolean) {
          break;
        }
        paramBoolean = isSeparator(paramString.charAt(i));
        i += 1;
      }
    }
    if (bool) {
      paramCharArrayBuffer.append('"');
    }
    int i = 0;
    while (i < paramString.length())
    {
      char c = paramString.charAt(i);
      if (isUnsafe(c)) {
        paramCharArrayBuffer.append('\\');
      }
      paramCharArrayBuffer.append(c);
      i += 1;
    }
    if (bool) {
      paramCharArrayBuffer.append('"');
    }
  }
  
  protected int estimateElementsLen(HeaderElement[] paramArrayOfHeaderElement)
  {
    int k;
    if ((paramArrayOfHeaderElement == null) || (paramArrayOfHeaderElement.length < 1))
    {
      k = 0;
      return k;
    }
    int i = (paramArrayOfHeaderElement.length - 1) * 2;
    int m = paramArrayOfHeaderElement.length;
    int j = 0;
    for (;;)
    {
      k = i;
      if (j >= m) {
        break;
      }
      i += estimateHeaderElementLen(paramArrayOfHeaderElement[j]);
      j += 1;
    }
  }
  
  protected int estimateHeaderElementLen(HeaderElement paramHeaderElement)
  {
    int j;
    if (paramHeaderElement == null) {
      j = 0;
    }
    int i;
    int m;
    do
    {
      return j;
      j = paramHeaderElement.getName().length();
      String str = paramHeaderElement.getValue();
      i = j;
      if (str != null) {
        i = j + (str.length() + 3);
      }
      m = paramHeaderElement.getParameterCount();
      j = i;
    } while (m <= 0);
    int k = 0;
    for (;;)
    {
      j = i;
      if (k >= m) {
        break;
      }
      i += estimateNameValuePairLen(paramHeaderElement.getParameter(k)) + 2;
      k += 1;
    }
  }
  
  protected int estimateNameValuePairLen(NameValuePair paramNameValuePair)
  {
    int i;
    if (paramNameValuePair == null) {
      i = 0;
    }
    int j;
    do
    {
      return i;
      j = paramNameValuePair.getName().length();
      paramNameValuePair = paramNameValuePair.getValue();
      i = j;
    } while (paramNameValuePair == null);
    return j + (paramNameValuePair.length() + 3);
  }
  
  protected int estimateParametersLen(NameValuePair[] paramArrayOfNameValuePair)
  {
    int k;
    if ((paramArrayOfNameValuePair == null) || (paramArrayOfNameValuePair.length < 1))
    {
      k = 0;
      return k;
    }
    int i = (paramArrayOfNameValuePair.length - 1) * 2;
    int m = paramArrayOfNameValuePair.length;
    int j = 0;
    for (;;)
    {
      k = i;
      if (j >= m) {
        break;
      }
      i += estimateNameValuePairLen(paramArrayOfNameValuePair[j]);
      j += 1;
    }
  }
  
  public CharArrayBuffer formatElements(CharArrayBuffer paramCharArrayBuffer, HeaderElement[] paramArrayOfHeaderElement, boolean paramBoolean)
  {
    Args.notNull(paramArrayOfHeaderElement, "Header element array");
    int i = estimateElementsLen(paramArrayOfHeaderElement);
    if (paramCharArrayBuffer == null) {
      paramCharArrayBuffer = new CharArrayBuffer(i);
    }
    for (;;)
    {
      i = 0;
      while (i < paramArrayOfHeaderElement.length)
      {
        if (i > 0) {
          paramCharArrayBuffer.append(", ");
        }
        formatHeaderElement(paramCharArrayBuffer, paramArrayOfHeaderElement[i], paramBoolean);
        i += 1;
      }
      paramCharArrayBuffer.ensureCapacity(i);
    }
    return paramCharArrayBuffer;
  }
  
  public CharArrayBuffer formatHeaderElement(CharArrayBuffer paramCharArrayBuffer, HeaderElement paramHeaderElement, boolean paramBoolean)
  {
    Args.notNull(paramHeaderElement, "Header element");
    int i = estimateHeaderElementLen(paramHeaderElement);
    if (paramCharArrayBuffer == null) {
      paramCharArrayBuffer = new CharArrayBuffer(i);
    }
    for (;;)
    {
      paramCharArrayBuffer.append(paramHeaderElement.getName());
      String str = paramHeaderElement.getValue();
      if (str != null)
      {
        paramCharArrayBuffer.append('=');
        doFormatValue(paramCharArrayBuffer, str, paramBoolean);
      }
      int j = paramHeaderElement.getParameterCount();
      if (j <= 0) {
        break;
      }
      i = 0;
      while (i < j)
      {
        paramCharArrayBuffer.append("; ");
        formatNameValuePair(paramCharArrayBuffer, paramHeaderElement.getParameter(i), paramBoolean);
        i += 1;
      }
      paramCharArrayBuffer.ensureCapacity(i);
    }
    return paramCharArrayBuffer;
  }
  
  public CharArrayBuffer formatNameValuePair(CharArrayBuffer paramCharArrayBuffer, NameValuePair paramNameValuePair, boolean paramBoolean)
  {
    Args.notNull(paramNameValuePair, "Name / value pair");
    int i = estimateNameValuePairLen(paramNameValuePair);
    if (paramCharArrayBuffer == null) {
      paramCharArrayBuffer = new CharArrayBuffer(i);
    }
    for (;;)
    {
      paramCharArrayBuffer.append(paramNameValuePair.getName());
      paramNameValuePair = paramNameValuePair.getValue();
      if (paramNameValuePair != null)
      {
        paramCharArrayBuffer.append('=');
        doFormatValue(paramCharArrayBuffer, paramNameValuePair, paramBoolean);
      }
      return paramCharArrayBuffer;
      paramCharArrayBuffer.ensureCapacity(i);
    }
  }
  
  public CharArrayBuffer formatParameters(CharArrayBuffer paramCharArrayBuffer, NameValuePair[] paramArrayOfNameValuePair, boolean paramBoolean)
  {
    Args.notNull(paramArrayOfNameValuePair, "Header parameter array");
    int i = estimateParametersLen(paramArrayOfNameValuePair);
    if (paramCharArrayBuffer == null) {
      paramCharArrayBuffer = new CharArrayBuffer(i);
    }
    for (;;)
    {
      i = 0;
      while (i < paramArrayOfNameValuePair.length)
      {
        if (i > 0) {
          paramCharArrayBuffer.append("; ");
        }
        formatNameValuePair(paramCharArrayBuffer, paramArrayOfNameValuePair[i], paramBoolean);
        i += 1;
      }
      paramCharArrayBuffer.ensureCapacity(i);
    }
    return paramCharArrayBuffer;
  }
  
  protected boolean isSeparator(char paramChar)
  {
    return " ;,:@()<>\\\"/[]?={}\t".indexOf(paramChar) >= 0;
  }
  
  protected boolean isUnsafe(char paramChar)
  {
    return "\"\\".indexOf(paramChar) >= 0;
  }
}
