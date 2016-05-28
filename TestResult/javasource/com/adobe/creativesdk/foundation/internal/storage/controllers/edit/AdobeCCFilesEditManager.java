package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.support.v4.app.FragmentManager;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;

public class AdobeCCFilesEditManager
{
  public static AdobeCCFilesEditSession _session;
  public static boolean editCompletionHandled = true;
  public static boolean editStarted = false;
  public static boolean isEditInProgress;
  public static double progressValue;
  
  public static AdobeCCFilesEditSession createSession(FragmentManager paramFragmentManager, AdobeCCFilesEditOperation paramAdobeCCFilesEditOperation, IAdobeEditAssetCallback paramIAdobeEditAssetCallback, AdobeCloud paramAdobeCloud)
  {
    _session = new AdobeCCFilesEditSession(paramFragmentManager, paramAdobeCCFilesEditOperation, paramIAdobeEditAssetCallback, paramAdobeCloud);
    return _session;
  }
  
  public static AdobeCCFilesEditSession createSession(String paramString, FragmentManager paramFragmentManager, AdobeCCFilesEditOperation paramAdobeCCFilesEditOperation, IAdobeEditAssetCallback paramIAdobeEditAssetCallback, AdobeCloud paramAdobeCloud)
  {
    _session = new AdobeCCFilesEditSession(paramString, paramFragmentManager, paramAdobeCCFilesEditOperation, paramIAdobeEditAssetCallback, paramAdobeCloud);
    return _session;
  }
  
  public static AdobeCCFilesEditSession getLastSession()
  {
    return _session;
  }
  
  public static double getProgressValue()
  {
    return progressValue;
  }
  
  public static boolean hasEditCompletionHandled()
  {
    return editCompletionHandled;
  }
  
  public static boolean hasEditStarted()
  {
    return editStarted;
  }
  
  public static boolean isEditInProgress()
  {
    return isEditInProgress;
  }
  
  public static void setEditCompletionHandled(boolean paramBoolean)
  {
    editCompletionHandled = paramBoolean;
  }
  
  public static void setEditInProgress(boolean paramBoolean)
  {
    isEditInProgress = paramBoolean;
  }
  
  public static void setEditStarted(boolean paramBoolean)
  {
    editStarted = paramBoolean;
  }
  
  public static void setProgressValue(double paramDouble)
  {
    progressValue = paramDouble;
  }
}
