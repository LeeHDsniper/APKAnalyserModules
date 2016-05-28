package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import java.text.SimpleDateFormat;

class AdobeDCXLocalStorageCopyOnWrite
{
  private static final SimpleDateFormat ft;
  
  static
  {
    if (!AdobeDCXLocalStorageCopyOnWrite.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      ft = new SimpleDateFormat("yyyy-MM-dd");
      return;
    }
  }
  
  AdobeDCXLocalStorageCopyOnWrite() {}
}
