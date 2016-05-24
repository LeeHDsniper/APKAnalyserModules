package org.apache.http.entity;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.Serializable;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class SerializableEntity
  extends AbstractHttpEntity
{
  private Serializable objRef;
  private byte[] objSer;
  
  public SerializableEntity(Serializable paramSerializable)
  {
    Args.notNull(paramSerializable, "Source object");
    objRef = paramSerializable;
  }
  
  public SerializableEntity(Serializable paramSerializable, boolean paramBoolean)
    throws IOException
  {
    Args.notNull(paramSerializable, "Source object");
    if (paramBoolean)
    {
      createBytes(paramSerializable);
      return;
    }
    objRef = paramSerializable;
  }
  
  private void createBytes(Serializable paramSerializable)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(localByteArrayOutputStream);
    localObjectOutputStream.writeObject(paramSerializable);
    localObjectOutputStream.flush();
    objSer = localByteArrayOutputStream.toByteArray();
  }
  
  public InputStream getContent()
    throws IOException, IllegalStateException
  {
    if (objSer == null) {
      createBytes(objRef);
    }
    return new ByteArrayInputStream(objSer);
  }
  
  public long getContentLength()
  {
    if (objSer == null) {
      return -1L;
    }
    return objSer.length;
  }
  
  public boolean isRepeatable()
  {
    return true;
  }
  
  public boolean isStreaming()
  {
    return objSer == null;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    if (objSer == null)
    {
      paramOutputStream = new ObjectOutputStream(paramOutputStream);
      paramOutputStream.writeObject(objRef);
      paramOutputStream.flush();
      return;
    }
    paramOutputStream.write(objSer);
    paramOutputStream.flush();
  }
}
