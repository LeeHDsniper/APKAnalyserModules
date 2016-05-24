package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.util.ArrayList;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

public class AdobeCCFilesUploadSession
{
  private static int _sUploadAssetUniqueIdCount = 1234561;
  private Map<String, ObservableWrapper> _allAssetsUploadObservers;
  private ArrayList<AdobeCCFilesUploadAssetData> _assetsList;
  private AdobeAssetFolder _destinationFolder;
  private UploadSummary _uploadSummary;
  
  public void addObserverForAssetUpload(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, Observer paramObserver)
  {
    ObservableWrapper localObservableWrapper2 = (ObservableWrapper)_allAssetsUploadObservers.get(guid);
    ObservableWrapper localObservableWrapper1 = localObservableWrapper2;
    if (localObservableWrapper2 == null)
    {
      localObservableWrapper1 = new ObservableWrapper(null);
      _allAssetsUploadObservers.put(guid, localObservableWrapper1);
    }
    localObservableWrapper1.addObserver(paramObserver);
  }
  
  public ArrayList<AdobeCCFilesUploadAssetData> getAssetsList()
  {
    return _assetsList;
  }
  
  public AdobeAssetFolder getDestinationFolder()
  {
    return _destinationFolder;
  }
  
  public UploadSummary getUploadSummary()
  {
    return _uploadSummary;
  }
  
  public void removeObserverForAssetUpload(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, Observer paramObserver)
  {
    paramAdobeCCFilesUploadAssetData = (Observable)_allAssetsUploadObservers.get(guid);
    if (paramAdobeCCFilesUploadAssetData == null) {
      return;
    }
    paramAdobeCCFilesUploadAssetData.deleteObserver(paramObserver);
  }
  
  private class ObservableWrapper
    extends Observable
  {
    private ObservableWrapper() {}
  }
  
  public static class UploadSummary
  {
    public ArrayList<AdobeCCFilesUploadAssetData> _cancelledAssets = new ArrayList();
    public ArrayList<AdobeCCFilesUploadAssetData> _errorAssets = new ArrayList();
    public ArrayList<AdobeCCFilesUploadAssetData> _successAssets = new ArrayList();
    
    public UploadSummary() {}
    
    public int getErrorCount()
    {
      return _errorAssets.size();
    }
    
    public int getSuccessCount()
    {
      return _successAssets.size();
    }
  }
}
