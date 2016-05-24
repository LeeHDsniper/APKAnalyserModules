package org.apache.http.message;

import java.util.ArrayList;
import java.util.List;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicHeaderValueParser
  implements HeaderValueParser
{
  private static final char[] ALL_DELIMITERS = { 59, 44 };
  @Deprecated
  public static final BasicHeaderValueParser DEFAULT = new BasicHeaderValueParser();
  private static final char ELEM_DELIMITER = ',';
  public static final BasicHeaderValueParser INSTANCE = new BasicHeaderValueParser();
  private static final char PARAM_DELIMITER = ';';
  
  public BasicHeaderValueParser() {}
  
  private static boolean isOneOf(char paramChar, char[] paramArrayOfChar)
  {
    if (paramArrayOfChar != null)
    {
      int j = paramArrayOfChar.length;
      int i = 0;
      while (i < j)
      {
        if (paramChar == paramArrayOfChar[i]) {
          return true;
        }
        i += 1;
      }
    }
    return false;
  }
  
  public static HeaderElement[] parseElements(String paramString, HeaderValueParser paramHeaderValueParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramHeaderValueParser != null) {}
    for (;;)
    {
      return paramHeaderValueParser.parseElements(localCharArrayBuffer, paramString);
      paramHeaderValueParser = INSTANCE;
    }
  }
  
  public static HeaderElement parseHeaderElement(String paramString, HeaderValueParser paramHeaderValueParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramHeaderValueParser != null) {}
    for (;;)
    {
      return paramHeaderValueParser.parseHeaderElement(localCharArrayBuffer, paramString);
      paramHeaderValueParser = INSTANCE;
    }
  }
  
  public static NameValuePair parseNameValuePair(String paramString, HeaderValueParser paramHeaderValueParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramHeaderValueParser != null) {}
    for (;;)
    {
      return paramHeaderValueParser.parseNameValuePair(localCharArrayBuffer, paramString);
      paramHeaderValueParser = INSTANCE;
    }
  }
  
  public static NameValuePair[] parseParameters(String paramString, HeaderValueParser paramHeaderValueParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramHeaderValueParser != null) {}
    for (;;)
    {
      return paramHeaderValueParser.parseParameters(localCharArrayBuffer, paramString);
      paramHeaderValueParser = INSTANCE;
    }
  }
  
  protected HeaderElement createHeaderElement(String paramString1, String paramString2, NameValuePair[] paramArrayOfNameValuePair)
  {
    return new BasicHeaderElement(paramString1, paramString2, paramArrayOfNameValuePair);
  }
  
  protected NameValuePair createNameValuePair(String paramString1, String paramString2)
  {
    return new BasicNameValuePair(paramString1, paramString2);
  }
  
  public HeaderElement[] parseElements(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    ArrayList localArrayList = new ArrayList();
    while (!paramParserCursor.atEnd())
    {
      HeaderElement localHeaderElement = parseHeaderElement(paramCharArrayBuffer, paramParserCursor);
      if ((localHeaderElement.getName().length() != 0) || (localHeaderElement.getValue() != null)) {
        localArrayList.add(localHeaderElement);
      }
    }
    return (HeaderElement[])localArrayList.toArray(new HeaderElement[localArrayList.size()]);
  }
  
  public HeaderElement parseHeaderElement(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    NameValuePair localNameValuePair = parseNameValuePair(paramCharArrayBuffer, paramParserCursor);
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (!paramParserCursor.atEnd())
    {
      localObject1 = localObject2;
      if (paramCharArrayBuffer.charAt(paramParserCursor.getPos() - 1) != ',') {
        localObject1 = parseParameters(paramCharArrayBuffer, paramParserCursor);
      }
    }
    return createHeaderElement(localNameValuePair.getName(), localNameValuePair.getValue(), (NameValuePair[])localObject1);
  }
  
  public NameValuePair parseNameValuePair(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    return parseNameValuePair(paramCharArrayBuffer, paramParserCursor, ALL_DELIMITERS);
  }
  
  public NameValuePair parseNameValuePair(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor, char[] paramArrayOfChar)
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    int k = 0;
    int i = paramParserCursor.getPos();
    int m = paramParserCursor.getPos();
    int i3 = paramParserCursor.getUpperBound();
    int j = k;
    char c;
    label65:
    String str;
    if (i < i3)
    {
      c = paramCharArrayBuffer.charAt(i);
      if (c == '=') {
        j = k;
      }
    }
    else
    {
      if (i != i3) {
        break label128;
      }
      j = 1;
      str = paramCharArrayBuffer.substringTrimmed(m, i3);
    }
    for (;;)
    {
      if (j == 0) {
        break label147;
      }
      paramParserCursor.updatePos(i);
      return createNameValuePair(str, null);
      if (isOneOf(c, paramArrayOfChar))
      {
        j = 1;
        break label65;
      }
      i += 1;
      break;
      label128:
      str = paramCharArrayBuffer.substringTrimmed(m, i);
      i += 1;
    }
    label147:
    int n = i;
    int i2 = 0;
    int i1 = 0;
    for (;;)
    {
      m = j;
      if (i < i3)
      {
        c = paramCharArrayBuffer.charAt(i);
        k = i2;
        if (c == '"')
        {
          k = i2;
          if (i1 == 0) {
            if (i2 != 0) {
              break label270;
            }
          }
        }
      }
      label270:
      for (k = 1; (k == 0) && (i1 == 0) && (isOneOf(c, paramArrayOfChar)); k = 0)
      {
        m = 1;
        i1 = i;
        j = n;
        for (;;)
        {
          k = i1;
          if (j >= i1) {
            break;
          }
          k = i1;
          if (!HTTP.isWhitespace(paramCharArrayBuffer.charAt(j))) {
            break;
          }
          j += 1;
        }
      }
      if (i1 == 0) {
        break;
      }
      m = 0;
      i += 1;
      i1 = m;
      i2 = k;
    }
    if ((k != 0) && (c == '\\')) {}
    for (m = 1;; m = 0) {
      break;
    }
    while ((k > j) && (HTTP.isWhitespace(paramCharArrayBuffer.charAt(k - 1)))) {
      k -= 1;
    }
    i1 = j;
    n = k;
    if (k - j >= 2)
    {
      i1 = j;
      n = k;
      if (paramCharArrayBuffer.charAt(j) == '"')
      {
        i1 = j;
        n = k;
        if (paramCharArrayBuffer.charAt(k - 1) == '"')
        {
          i1 = j + 1;
          n = k - 1;
        }
      }
    }
    paramCharArrayBuffer = paramCharArrayBuffer.substring(i1, n);
    j = i;
    if (m != 0) {
      j = i + 1;
    }
    paramParserCursor.updatePos(j);
    return createNameValuePair(str, paramCharArrayBuffer);
  }
  
  public NameValuePair[] parseParameters(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    int i = paramParserCursor.getPos();
    int j = paramParserCursor.getUpperBound();
    while ((i < j) && (HTTP.isWhitespace(paramCharArrayBuffer.charAt(i)))) {
      i += 1;
    }
    paramParserCursor.updatePos(i);
    if (paramParserCursor.atEnd()) {
      return new NameValuePair[0];
    }
    ArrayList localArrayList = new ArrayList();
    do
    {
      if (paramParserCursor.atEnd()) {
        break;
      }
      localArrayList.add(parseNameValuePair(paramCharArrayBuffer, paramParserCursor));
    } while (paramCharArrayBuffer.charAt(paramParserCursor.getPos() - 1) != ',');
    return (NameValuePair[])localArrayList.toArray(new NameValuePair[localArrayList.size()]);
  }
}
