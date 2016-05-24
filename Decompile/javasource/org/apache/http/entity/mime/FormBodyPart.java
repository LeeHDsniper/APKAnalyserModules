package org.apache.http.entity.mime;

import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.util.Args;

public class FormBodyPart
{
  private final ContentBody body;
  private final Header header;
  private final String name;
  
  public FormBodyPart(String paramString, ContentBody paramContentBody)
  {
    Args.notNull(paramString, "Name");
    Args.notNull(paramContentBody, "Body");
    name = paramString;
    body = paramContentBody;
    header = new Header();
    generateContentDisp(paramContentBody);
    generateContentType(paramContentBody);
    generateTransferEncoding(paramContentBody);
  }
  
  public void addField(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Field name");
    header.addField(new MinimalField(paramString1, paramString2));
  }
  
  protected void generateContentDisp(ContentBody paramContentBody)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("form-data; name=\"");
    localStringBuilder.append(getName());
    localStringBuilder.append("\"");
    if (paramContentBody.getFilename() != null)
    {
      localStringBuilder.append("; filename=\"");
      localStringBuilder.append(paramContentBody.getFilename());
      localStringBuilder.append("\"");
    }
    addField("Content-Disposition", localStringBuilder.toString());
  }
  
  protected void generateContentType(ContentBody paramContentBody)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramContentBody.getMimeType());
    if (paramContentBody.getCharset() != null)
    {
      localStringBuilder.append("; charset=");
      localStringBuilder.append(paramContentBody.getCharset());
    }
    addField("Content-Type", localStringBuilder.toString());
  }
  
  protected void generateTransferEncoding(ContentBody paramContentBody)
  {
    addField("Content-Transfer-Encoding", paramContentBody.getTransferEncoding());
  }
  
  public ContentBody getBody()
  {
    return body;
  }
  
  public Header getHeader()
  {
    return header;
  }
  
  public String getName()
  {
    return name;
  }
}
