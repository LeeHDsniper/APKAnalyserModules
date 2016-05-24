package com.adobe.creativesdk.foundation.storage;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class AdobePhotoPage
  implements Externalizable
{
  private String _key;
  
  public AdobePhotoPage(String paramString)
  {
    _key = paramString;
  }
  
  public String getKey()
  {
    return _key;
  }
  
  public boolean isEqualToPage(AdobePhotoPage paramAdobePhotoPage)
  {
    return paramAdobePhotoPage.getKey().equals(_key);
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    _key = ((String)paramObjectInput.readObject());
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(_key);
  }
}
