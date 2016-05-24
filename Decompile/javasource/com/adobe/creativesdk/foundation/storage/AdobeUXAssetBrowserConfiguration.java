package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import java.util.EnumSet;

public class AdobeUXAssetBrowserConfiguration
{
  public AdobeCloud cloud;
  public AdobeAssetDataSourceFilter dataSourceFilter;
  public AdobeAssetDesignLibraryItemFilter designLibraryItemFilter;
  public AdobeAssetMIMETypeFilter mimeTypeFilter;
  public EnumSet<AdobeUXAssetBrowserOption> options;
  
  public AdobeUXAssetBrowserConfiguration() {}
}
