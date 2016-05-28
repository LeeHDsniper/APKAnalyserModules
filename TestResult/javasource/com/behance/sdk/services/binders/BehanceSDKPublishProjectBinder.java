package com.behance.sdk.services.binders;

import android.os.Binder;
import java.util.List;

public class BehanceSDKPublishProjectBinder
  extends Binder
{
  private List<String> cancelledRequestIdsList;
  
  public BehanceSDKPublishProjectBinder() {}
  
  public boolean isUploadCancelled(String paramString)
  {
    return (cancelledRequestIdsList != null) && (paramString != null) && (cancelledRequestIdsList.contains(paramString));
  }
}
