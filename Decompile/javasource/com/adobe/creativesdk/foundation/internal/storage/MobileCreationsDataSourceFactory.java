package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.notification.AdobeNotification;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewBrowserControllerFactory;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class MobileCreationsDataSourceFactory
{
  private static boolean _allSourcesLoaded = false;
  private static Map<AdobeAssetDataSourceType, AdobeAssetDataSource> _dataSourcesMap;
  private static MobileCreationsDataSourceFactory _instance;
  private static List<AdobeAssetDataSourceType> _loadedSourcesTypes;
  private static int _numDataSourcesPending;
  private AdobeCloud _cloud;
  
  private MobileCreationsDataSourceFactory() {}
  
  public static EnumSet<AdobeAssetDataSourceType> getDataSourceTypes()
  {
    return EnumSet.of(AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions, AdobeAssetDataSourceType.AdobeAssetDataSourceLine, AdobeAssetDataSourceType.AdobeAssetDataSourceDraw, AdobeAssetDataSourceType.AdobeAssetDataSourceSketches);
  }
  
  public static MobileCreationsDataSourceFactory getInstance()
  {
    if (_instance == null) {
      _instance = new MobileCreationsDataSourceFactory();
    }
    return _instance;
  }
  
  private static void initializeDataSources()
  {
    _dataSourcesMap = new HashMap();
    _allSourcesLoaded = false;
    _loadedSourcesTypes = new ArrayList();
    Iterator localIterator = getDataSourceTypes().iterator();
    while (localIterator.hasNext())
    {
      AdobeAssetDataSourceType localAdobeAssetDataSourceType = (AdobeAssetDataSourceType)localIterator.next();
      if (AdobeAssetViewBrowserControllerFactory.shouldShowComponent(localAdobeAssetDataSourceType, getInstance().getCloud()))
      {
        AdobeAssetDataSource localAdobeAssetDataSource = new AdobeAssetDataSource(localAdobeAssetDataSourceType, getInstance().getCloud());
        localAdobeAssetDataSource.setDelegate(new DataSourceDelegate(localAdobeAssetDataSourceType));
        _dataSourcesMap.put(localAdobeAssetDataSourceType, localAdobeAssetDataSource);
      }
    }
    _numDataSourcesPending = _dataSourcesMap.size();
  }
  
  private void loadDataSources()
  {
    if (!_allSourcesLoaded)
    {
      Iterator localIterator = _dataSourcesMap.entrySet().iterator();
      while (localIterator.hasNext()) {
        ((AdobeAssetDataSource)((Map.Entry)localIterator.next()).getValue()).loadItemsFromScratch(true);
      }
    }
  }
  
  public AdobeCloud getCloud()
  {
    return _cloud;
  }
  
  public AdobeAssetDataSource getDataSourceByType(AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    if ((_dataSourcesMap != null) && (_dataSourcesMap.containsKey(paramAdobeAssetDataSourceType))) {
      return (AdobeAssetDataSource)_dataSourcesMap.get(paramAdobeAssetDataSourceType);
    }
    return null;
  }
  
  public List<AdobeAssetDataSourceType> getLoadedDataSourcesTypes()
  {
    return _loadedSourcesTypes;
  }
  
  public void loadDataSources(boolean paramBoolean)
  {
    _dataSourcesMap = null;
    _loadedSourcesTypes = null;
    initializeDataSources();
    loadDataSources();
  }
  
  public void notifyDataSourceIsReady(AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    _numDataSourcesPending -= 1;
    if (getInstance().getDataSourceByType(paramAdobeAssetDataSourceType).getCount() != 0)
    {
      Object localObject = new HashMap();
      ((Map)localObject).put("DataSourceReady", paramAdobeAssetDataSourceType);
      localObject = new AdobeNotification(AdobeInternalNotificationID.AdobeDataSourceReady, (Map)localObject);
      AdobeLocalNotificationCenter.getDefaultNotificationCenter().postNotification((AdobeNotification)localObject);
      _loadedSourcesTypes.add(paramAdobeAssetDataSourceType);
    }
    if (_numDataSourcesPending == 0) {
      _allSourcesLoaded = true;
    }
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    _cloud = paramAdobeCloud;
  }
}
