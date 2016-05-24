package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;

public class AdobeCCFilesUploadMgr
{
  public static String UPLOAD_SESSION_KEY = "uploadsessionkey";
  private static AdobeCCFilesUploadMgr _sInstance;
  private ArrayList<AdobeCCFilesUploadSession> _activeSessionsList = new ArrayList();
  
  public AdobeCCFilesUploadMgr() {}
  
  public static AdobeCCFilesUploadMgr getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeCCFilesUploadMgr();
    }
    return _sInstance;
  }
  
  public static boolean isUploadSessionDestinationFolderEqual(AdobeCCFilesUploadSession paramAdobeCCFilesUploadSession, AdobeAssetFolder paramAdobeAssetFolder)
  {
    paramAdobeCCFilesUploadSession = paramAdobeCCFilesUploadSession.getDestinationFolder();
    return paramAdobeAssetFolder.getHref().toString().equalsIgnoreCase(paramAdobeCCFilesUploadSession.getHref().toString());
  }
  
  public AdobeCCFilesUploadSession getUploadSessionOfFolder(AdobeAssetFolder paramAdobeAssetFolder)
  {
    Object localObject2 = null;
    if (_activeSessionsList.size() == 0) {
      return null;
    }
    Iterator localIterator = _activeSessionsList.iterator();
    Object localObject1;
    do
    {
      localObject1 = localObject2;
      if (!localIterator.hasNext()) {
        break;
      }
      localObject1 = (AdobeCCFilesUploadSession)localIterator.next();
    } while (!isUploadSessionDestinationFolderEqual((AdobeCCFilesUploadSession)localObject1, paramAdobeAssetFolder));
    return localObject1;
  }
}
