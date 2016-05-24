package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.internal.net.AdobeNetworkHttpTaskHandle;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import java.util.LinkedHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class AdobeAssetPSDFile
  extends AdobeAssetFileInternal
{
  private AdobeNetworkHttpTaskHandle _layerRenditionRequest = null;
  private LinkedHashMap<String, AdobeNetworkHttpTaskHandle> _layerRenditionRequests = null;
  private AdobeNetworkHttpTaskHandle _previewPSDCompositeRequest = null;
  private AdobeNetworkHttpTaskHandle _pullPSDCompositeRequestHandle = null;
  private AdobeNetworkHttpTaskHandle _pushPSDCompositeRequestHandle = null;
  private final Lock lock = new ReentrantLock();
  
  public AdobeAssetPSDFile(AdobeStorageResourceItem paramAdobeStorageResourceItem, AdobeStorageResourceCollection paramAdobeStorageResourceCollection)
  {
    super(paramAdobeStorageResourceItem, paramAdobeStorageResourceCollection);
  }
}
