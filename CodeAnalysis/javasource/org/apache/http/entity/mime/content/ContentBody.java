package org.apache.http.entity.mime.content;

import java.io.IOException;
import java.io.OutputStream;

public abstract interface ContentBody
  extends ContentDescriptor
{
  public abstract String getFilename();
  
  public abstract void writeTo(OutputStream paramOutputStream)
    throws IOException;
}
