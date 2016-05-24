package com.behance.sdk.services.binders;

import android.os.Binder;
import java.util.List;

public class BehanceSDKPublishWIPBinder
  extends Binder
{
  private List<String> cancelledRequestIdsList;
  
  public BehanceSDKPublishWIPBinder() {}
  
  public boolean isUploadCancelled(String paramString)
  {
    return (cancelledRequestIdsList != null) && (paramString != null) && (cancelledRequestIdsList.contains(paramString));
  }
}
