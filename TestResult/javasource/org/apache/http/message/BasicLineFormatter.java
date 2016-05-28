package org.apache.http.message;

import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicLineFormatter
  implements LineFormatter
{
  @Deprecated
  public static final BasicLineFormatter DEFAULT = new BasicLineFormatter();
  public static final BasicLineFormatter INSTANCE = new BasicLineFormatter();
  
  public BasicLineFormatter() {}
  
  public static String formatHeader(Header paramHeader, LineFormatter paramLineFormatter)
  {
    if (paramLineFormatter != null) {}
    for (;;)
    {
      return paramLineFormatter.formatHeader(null, paramHeader).toString();
      paramLineFormatter = INSTANCE;
    }
  }
  
  public static String formatProtocolVersion(ProtocolVersion paramProtocolVersion, LineFormatter paramLineFormatter)
  {
    if (paramLineFormatter != null) {}
    for (;;)
    {
      return paramLineFormatter.appendProtocolVersion(null, paramProtocolVersion).toString();
      paramLineFormatter = INSTANCE;
    }
  }
  
  public static String formatRequestLine(RequestLine paramRequestLine, LineFormatter paramLineFormatter)
  {
    if (paramLineFormatter != null) {}
    for (;;)
    {
      return paramLineFormatter.formatRequestLine(null, paramRequestLine).toString();
      paramLineFormatter = INSTANCE;
    }
  }
  
  public static String formatStatusLine(StatusLine paramStatusLine, LineFormatter paramLineFormatter)
  {
    if (paramLineFormatter != null) {}
    for (;;)
    {
      return paramLineFormatter.formatStatusLine(null, paramStatusLine).toString();
      paramLineFormatter = INSTANCE;
    }
  }
  
  public CharArrayBuffer appendProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ProtocolVersion paramProtocolVersion)
  {
    Args.notNull(paramProtocolVersion, "Protocol version");
    int i = estimateProtocolVersionLen(paramProtocolVersion);
    if (paramCharArrayBuffer == null) {
      paramCharArrayBuffer = new CharArrayBuffer(i);
    }
    for (;;)
    {
      paramCharArrayBuffer.append(paramProtocolVersion.getProtocol());
      paramCharArrayBuffer.append('/');
      paramCharArrayBuffer.append(Integer.toString(paramProtocolVersion.getMajor()));
      paramCharArrayBuffer.append('.');
      paramCharArrayBuffer.append(Integer.toString(paramProtocolVersion.getMinor()));
      return paramCharArrayBuffer;
      paramCharArrayBuffer.ensureCapacity(i);
    }
  }
  
  protected void doFormatHeader(CharArrayBuffer paramCharArrayBuffer, Header paramHeader)
  {
    String str = paramHeader.getName();
    paramHeader = paramHeader.getValue();
    int j = str.length() + 2;
    int i = j;
    if (paramHeader != null) {
      i = j + paramHeader.length();
    }
    paramCharArrayBuffer.ensureCapacity(i);
    paramCharArrayBuffer.append(str);
    paramCharArrayBuffer.append(": ");
    if (paramHeader != null) {
      paramCharArrayBuffer.append(paramHeader);
    }
  }
  
  protected void doFormatRequestLine(CharArrayBuffer paramCharArrayBuffer, RequestLine paramRequestLine)
  {
    String str1 = paramRequestLine.getMethod();
    String str2 = paramRequestLine.getUri();
    paramCharArrayBuffer.ensureCapacity(str1.length() + 1 + str2.length() + 1 + estimateProtocolVersionLen(paramRequestLine.getProtocolVersion()));
    paramCharArrayBuffer.append(str1);
    paramCharArrayBuffer.append(' ');
    paramCharArrayBuffer.append(str2);
    paramCharArrayBuffer.append(' ');
    appendProtocolVersion(paramCharArrayBuffer, paramRequestLine.getProtocolVersion());
  }
  
  protected void doFormatStatusLine(CharArrayBuffer paramCharArrayBuffer, StatusLine paramStatusLine)
  {
    int j = estimateProtocolVersionLen(paramStatusLine.getProtocolVersion()) + 1 + 3 + 1;
    String str = paramStatusLine.getReasonPhrase();
    int i = j;
    if (str != null) {
      i = j + str.length();
    }
    paramCharArrayBuffer.ensureCapacity(i);
    appendProtocolVersion(paramCharArrayBuffer, paramStatusLine.getProtocolVersion());
    paramCharArrayBuffer.append(' ');
    paramCharArrayBuffer.append(Integer.toString(paramStatusLine.getStatusCode()));
    paramCharArrayBuffer.append(' ');
    if (str != null) {
      paramCharArrayBuffer.append(str);
    }
  }
  
  protected int estimateProtocolVersionLen(ProtocolVersion paramProtocolVersion)
  {
    return paramProtocolVersion.getProtocol().length() + 4;
  }
  
  public CharArrayBuffer formatHeader(CharArrayBuffer paramCharArrayBuffer, Header paramHeader)
  {
    Args.notNull(paramHeader, "Header");
    if ((paramHeader instanceof FormattedHeader)) {
      return ((FormattedHeader)paramHeader).getBuffer();
    }
    paramCharArrayBuffer = initBuffer(paramCharArrayBuffer);
    doFormatHeader(paramCharArrayBuffer, paramHeader);
    return paramCharArrayBuffer;
  }
  
  public CharArrayBuffer formatRequestLine(CharArrayBuffer paramCharArrayBuffer, RequestLine paramRequestLine)
  {
    Args.notNull(paramRequestLine, "Request line");
    paramCharArrayBuffer = initBuffer(paramCharArrayBuffer);
    doFormatRequestLine(paramCharArrayBuffer, paramRequestLine);
    return paramCharArrayBuffer;
  }
  
  public CharArrayBuffer formatStatusLine(CharArrayBuffer paramCharArrayBuffer, StatusLine paramStatusLine)
  {
    Args.notNull(paramStatusLine, "Status line");
    paramCharArrayBuffer = initBuffer(paramCharArrayBuffer);
    doFormatStatusLine(paramCharArrayBuffer, paramStatusLine);
    return paramCharArrayBuffer;
  }
  
  protected CharArrayBuffer initBuffer(CharArrayBuffer paramCharArrayBuffer)
  {
    if (paramCharArrayBuffer != null)
    {
      paramCharArrayBuffer.clear();
      return paramCharArrayBuffer;
    }
    return new CharArrayBuffer(64);
  }
}
