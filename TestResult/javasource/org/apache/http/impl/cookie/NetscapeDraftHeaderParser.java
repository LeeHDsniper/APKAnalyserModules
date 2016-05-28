package org.apache.http.impl.cookie;

import java.util.ArrayList;
import java.util.List;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicHeaderElement;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.ParserCursor;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class NetscapeDraftHeaderParser
{
  public static final NetscapeDraftHeaderParser DEFAULT = new NetscapeDraftHeaderParser();
  
  public NetscapeDraftHeaderParser() {}
  
  private NameValuePair parseNameValuePair(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    int k = 0;
    int i = paramParserCursor.getPos();
    int m = paramParserCursor.getPos();
    int n = paramParserCursor.getUpperBound();
    int j = k;
    label48:
    String str;
    if (i < n)
    {
      j = paramCharArrayBuffer.charAt(i);
      if (j == 61) {
        j = k;
      }
    }
    else
    {
      if (i != n) {
        break label108;
      }
      j = 1;
      str = paramCharArrayBuffer.substringTrimmed(m, n);
    }
    for (;;)
    {
      if (j == 0) {
        break label124;
      }
      paramParserCursor.updatePos(i);
      return new BasicNameValuePair(str, null);
      if (j == 59)
      {
        j = 1;
        break label48;
      }
      i += 1;
      break;
      label108:
      str = paramCharArrayBuffer.substringTrimmed(m, i);
      i += 1;
    }
    label124:
    m = i;
    for (;;)
    {
      k = j;
      if (i < n)
      {
        if (paramCharArrayBuffer.charAt(i) == ';') {
          k = 1;
        }
      }
      else
      {
        j = i;
        for (;;)
        {
          n = j;
          if (m >= j) {
            break;
          }
          n = j;
          if (!HTTP.isWhitespace(paramCharArrayBuffer.charAt(m))) {
            break;
          }
          m += 1;
        }
      }
      i += 1;
    }
    while ((n > m) && (HTTP.isWhitespace(paramCharArrayBuffer.charAt(n - 1)))) {
      n -= 1;
    }
    paramCharArrayBuffer = paramCharArrayBuffer.substring(m, n);
    j = i;
    if (k != 0) {
      j = i + 1;
    }
    paramParserCursor.updatePos(j);
    return new BasicNameValuePair(str, paramCharArrayBuffer);
  }
  
  public HeaderElement parseHeader(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    NameValuePair localNameValuePair = parseNameValuePair(paramCharArrayBuffer, paramParserCursor);
    ArrayList localArrayList = new ArrayList();
    while (!paramParserCursor.atEnd()) {
      localArrayList.add(parseNameValuePair(paramCharArrayBuffer, paramParserCursor));
    }
    return new BasicHeaderElement(localNameValuePair.getName(), localNameValuePair.getValue(), (NameValuePair[])localArrayList.toArray(new NameValuePair[localArrayList.size()]));
  }
}
