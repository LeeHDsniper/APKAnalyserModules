package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.internal.photo.util.AdobePhotoUtils;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AdobePhotoAssetRevision
  implements Externalizable
{
  private String _GUID = null;
  
  public AdobePhotoAssetRevision()
  {
    _GUID = AdobePhotoUtils.generateGUID();
  }
  
  AdobePhotoAssetRevision(String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {
      _GUID = paramString;
    }
    do
    {
      return;
      paramString = Pattern.compile("/revisions/([a-zA-Z0-9]+)", 2).matcher(paramString);
    } while (!paramString.find());
    _GUID = paramString.group(1);
  }
  
  public String getGUID()
  {
    return _GUID;
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    _GUID = ((String)paramObjectInput.readObject());
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(_GUID);
  }
}
