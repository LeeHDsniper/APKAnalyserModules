package com.tencent.mobileqq.msf.core.net;

import com.tencent.qphone.base.util.MsfSocketInputBuffer;
import java.io.InputStream;
import org.apache.http.Header;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;

public class MsfHttpResp
{
  private String connDirective;
  private InputStream content;
  private String contentEncoding;
  private int contentLen = -1;
  private String contentType;
  private Header[] headers;
  private final MsfSocketInputBuffer sessionBuffer;
  private StatusLine statusline;
  private String transferEncoding;
  
  public MsfHttpResp(MsfSocketInputBuffer paramMsfSocketInputBuffer)
  {
    sessionBuffer = paramMsfSocketInputBuffer;
  }
  
  public String getConnDirective()
  {
    return connDirective;
  }
  
  public InputStream getContent()
  {
    return content;
  }
  
  public String getContentEncoding()
  {
    return contentEncoding;
  }
  
  public int getContentLen()
  {
    return contentLen;
  }
  
  public String getContentType()
  {
    return contentType;
  }
  
  public Header[] getHeaders()
  {
    return headers;
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    return statusline.getProtocolVersion();
  }
  
  public MsfSocketInputBuffer getSessionBuffer()
  {
    return sessionBuffer;
  }
  
  public StatusLine getStatusLine()
  {
    return statusline;
  }
  
  public StatusLine getStatusline()
  {
    return statusline;
  }
  
  public String getTransferEncoding()
  {
    return transferEncoding;
  }
  
  public void setContent(InputStream paramInputStream)
  {
    content = paramInputStream;
  }
  
  public void setHeaders(Header[] paramArrayOfHeader)
  {
    headers = paramArrayOfHeader;
    int i = paramArrayOfHeader.length - 1;
    if (i >= 0)
    {
      Header localHeader = paramArrayOfHeader[i];
      if (localHeader.getName().equalsIgnoreCase("Transfer-Encoding")) {
        transferEncoding = localHeader.getValue();
      }
      for (;;)
      {
        i -= 1;
        break;
        if (localHeader.getName().equalsIgnoreCase("Content-Length")) {
          contentLen = Integer.parseInt(localHeader.getValue());
        } else if (localHeader.getName().equalsIgnoreCase("Connection")) {
          connDirective = localHeader.getValue();
        } else if (localHeader.getName().equalsIgnoreCase("Content-Encoding")) {
          contentEncoding = localHeader.getValue();
        } else if (localHeader.getName().equalsIgnoreCase("Content-Type")) {
          contentType = localHeader.getValue();
        }
      }
    }
  }
  
  public void setStatusline(StatusLine paramStatusLine)
  {
    statusline = paramStatusLine;
  }
  
  public String toString()
  {
    return getStatusLine() + " contentLen:" + getContentLen() + " transfer:" + transferEncoding;
  }
}
