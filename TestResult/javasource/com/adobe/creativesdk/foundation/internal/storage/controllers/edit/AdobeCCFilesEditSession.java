package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.support.v4.app.FragmentManager;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageSessionEditCallback;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.net.URI;
import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

public class AdobeCCFilesEditSession
{
  public static int count = 0;
  private AdobeCloud _cloud;
  private String _newLocation;
  private EditSummary _summary;
  IAdobeEditAssetCallback editResponseCallback;
  FragmentManager fm;
  AdobeCCFilesEditOperation operation;
  
  public AdobeCCFilesEditSession(FragmentManager paramFragmentManager, AdobeCCFilesEditOperation paramAdobeCCFilesEditOperation, IAdobeEditAssetCallback paramIAdobeEditAssetCallback, AdobeCloud paramAdobeCloud)
  {
    operation = paramAdobeCCFilesEditOperation;
    editResponseCallback = paramIAdobeEditAssetCallback;
    fm = paramFragmentManager;
    _cloud = paramAdobeCloud;
  }
  
  public AdobeCCFilesEditSession(String paramString, FragmentManager paramFragmentManager, AdobeCCFilesEditOperation paramAdobeCCFilesEditOperation, IAdobeEditAssetCallback paramIAdobeEditAssetCallback, AdobeCloud paramAdobeCloud)
  {
    operation = paramAdobeCCFilesEditOperation;
    editResponseCallback = paramIAdobeEditAssetCallback;
    fm = paramFragmentManager;
    _newLocation = paramString;
    _cloud = paramAdobeCloud;
  }
  
  /* Error */
  private void addAssetToSummary(AdobeCCFilesEditAssetData paramAdobeCCFilesEditAssetData)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: getfield 66	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData:status	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;
    //   6: getstatic 71	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus:Completed	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;
    //   9: if_acmpne +25 -> 34
    //   12: aload_0
    //   13: getfield 73	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession:_summary	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;
    //   16: ifnull +18 -> 34
    //   19: aload_0
    //   20: getfield 73	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession:_summary	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;
    //   23: getfield 77	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary:_successAssets	Ljava/util/ArrayList;
    //   26: aload_1
    //   27: invokevirtual 83	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   30: pop
    //   31: aload_0
    //   32: monitorexit
    //   33: return
    //   34: aload_1
    //   35: getfield 66	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData:status	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;
    //   38: getstatic 86	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus:Error	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditAssetData$EditStatus;
    //   41: if_acmpne -10 -> 31
    //   44: aload_0
    //   45: getfield 73	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession:_summary	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;
    //   48: ifnull -17 -> 31
    //   51: aload_0
    //   52: getfield 73	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession:_summary	Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;
    //   55: getfield 89	com/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary:_errorAssets	Ljava/util/ArrayList;
    //   58: aload_1
    //   59: invokevirtual 83	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   62: pop
    //   63: goto -32 -> 31
    //   66: astore_1
    //   67: aload_0
    //   68: monitorexit
    //   69: aload_1
    //   70: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	71	0	this	AdobeCCFilesEditSession
    //   0	71	1	paramAdobeCCFilesEditAssetData	AdobeCCFilesEditAssetData
    // Exception table:
    //   from	to	target	type
    //   2	31	66	finally
    //   34	63	66	finally
  }
  
  private void clearSummary()
  {
    if (_summary != null)
    {
      if (_summary._successAssets != null) {
        _summary._successAssets.clear();
      }
      if (_summary._errorAssets != null) {
        _summary._errorAssets.clear();
      }
    }
  }
  
  private void handleEraseOperation()
  {
    count = 0;
    _summary = new EditSummary();
    _summary.operation = AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_ERASE;
    AdobeStorageSession localAdobeStorageSession = (AdobeStorageSession)_cloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    int i;
    if (AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets() != null)
    {
      notifiyEditStarted();
      i = 0;
    }
    for (;;)
    {
      if (i < AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size())
      {
        final int j = AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size();
        final AdobeAsset localAdobeAsset = (AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(i);
        localAdobeStorageSession.eraseAsset(localAdobeAsset, new IAdobeStorageSessionEditCallback()
        {
          public void onComplete()
          {
            AdobeCCFilesEditSession.count += 1;
            if ((localAdobeAsset instanceof AdobeAssetFile)) {}
            for (AdobeCCFilesEditAssetData localAdobeCCFilesEditAssetData = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), (AdobeAssetFile)localAdobeAsset, AdobeCCFilesEditAssetData.EditStatus.Completed);; localAdobeCCFilesEditAssetData = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Completed))
            {
              AdobeCCFilesEditSession.this.addAssetToSummary(localAdobeCCFilesEditAssetData);
              if (AdobeCCFilesEditSession.count != j) {
                break;
              }
              AdobeCCFilesEditManager.setEditCompletionHandled(false);
              editResponseCallback.onComplete();
              return;
            }
            double d = AdobeCCFilesEditSession.count / j;
            editResponseCallback.onProgress(d);
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            AdobeCCFilesEditSession.count += 1;
            if ((localAdobeAsset instanceof AdobeAssetFile)) {}
            for (paramAnonymousAdobeAssetException = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), (AdobeAssetFile)localAdobeAsset, AdobeCCFilesEditAssetData.EditStatus.Error);; paramAnonymousAdobeAssetException = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Error))
            {
              AdobeCCFilesEditSession.this.addAssetToSummary(paramAnonymousAdobeAssetException);
              if (AdobeCCFilesEditSession.count == j)
              {
                AdobeCCFilesEditManager.setEditCompletionHandled(false);
                editResponseCallback.onComplete();
              }
              return;
            }
          }
        });
        if (AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets() != null) {}
      }
      else
      {
        return;
      }
      i += 1;
    }
  }
  
  private void handleMoveOperation()
  {
    count = 0;
    _summary = new EditSummary();
    _summary.operation = AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_MOVE;
    AdobeStorageSession localAdobeStorageSession = (AdobeStorageSession)_cloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    Object localObject;
    if (AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets() != null)
    {
      notifiyEditStarted();
      String str = ((AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(0)).getHref().toString();
      localObject = str;
      if (str.endsWith("/")) {
        localObject = str.substring(0, str.length() - 1);
      }
      str = ((String)localObject).substring(0, ((String)localObject).lastIndexOf("/"));
      localObject = str;
      if (!str.endsWith("/")) {
        localObject = str + "/";
      }
      if (!((String)localObject).equals(_newLocation)) {
        break label164;
      }
      handleSameLocationMoveError();
    }
    label164:
    label238:
    for (;;)
    {
      return;
      final int j = AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size();
      int i = 0;
      for (;;)
      {
        if (i >= AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size()) {
          break label238;
        }
        localObject = (AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(i);
        localAdobeStorageSession.moveAsset(_newLocation, (AdobeAsset)localObject, new IAdobeStorageSessionEditCallback()
        {
          public void onComplete()
          {
            AdobeCCFilesEditSession.count += 1;
            if ((val$targetAsset instanceof AdobeAssetFile)) {}
            for (AdobeCCFilesEditAssetData localAdobeCCFilesEditAssetData = new AdobeCCFilesEditAssetData(val$targetAsset.getName(), (AdobeAssetFile)val$targetAsset, AdobeCCFilesEditAssetData.EditStatus.Completed);; localAdobeCCFilesEditAssetData = new AdobeCCFilesEditAssetData(val$targetAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Completed))
            {
              AdobeCCFilesEditSession.this.addAssetToSummary(localAdobeCCFilesEditAssetData);
              if (AdobeCCFilesEditSession.count != j) {
                break;
              }
              AdobeCCFilesEditManager.setEditCompletionHandled(false);
              editResponseCallback.onComplete();
              return;
            }
            double d = AdobeCCFilesEditSession.count / j;
            editResponseCallback.onProgress(d);
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            if ((val$targetAsset instanceof AdobeAssetFile)) {}
            for (paramAnonymousAdobeAssetException = new AdobeCCFilesEditAssetData(val$targetAsset.getName(), (AdobeAssetFile)val$targetAsset, AdobeCCFilesEditAssetData.EditStatus.Error);; paramAnonymousAdobeAssetException = new AdobeCCFilesEditAssetData(val$targetAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Error))
            {
              AdobeCCFilesEditSession.this.addAssetToSummary(paramAnonymousAdobeAssetException);
              AdobeCCFilesEditSession.count += 1;
              if (AdobeCCFilesEditSession.count == j)
              {
                AdobeCCFilesEditManager.setEditCompletionHandled(false);
                editResponseCallback.onComplete();
              }
              return;
            }
          }
        });
        if (AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets() == null) {
          break;
        }
        i += 1;
      }
    }
  }
  
  private void handleRenameOperation(IAdobeCCFilesRenameDialogDismissController paramIAdobeCCFilesRenameDialogDismissController)
  {
    _summary = new EditSummary();
    _summary.operation = AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME;
    AdobeAssetViewEditRenameDialogFragment localAdobeAssetViewEditRenameDialogFragment = new AdobeAssetViewEditRenameDialogFragment();
    if (AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets() != null)
    {
      final AdobeAsset localAdobeAsset = (AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(0);
      localAdobeAssetViewEditRenameDialogFragment.setParameters(localAdobeAsset, new Observer()
      {
        public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
        {
          paramAnonymousObservable = (AdobeCCFilesEditRenameOperationStatus)paramAnonymousObject;
          if (paramAnonymousObservable == AdobeCCFilesEditRenameOperationStatus.ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_COMPLETED)
          {
            if ((localAdobeAsset instanceof AdobeAssetFile)) {}
            for (paramAnonymousObservable = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), (AdobeAssetFile)localAdobeAsset, AdobeCCFilesEditAssetData.EditStatus.Completed);; paramAnonymousObservable = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Completed))
            {
              AdobeCCFilesEditSession.this.clearSummary();
              AdobeCCFilesEditSession.this.addAssetToSummary(paramAnonymousObservable);
              AdobeCCFilesEditManager.setEditCompletionHandled(false);
              editResponseCallback.onComplete();
              return;
            }
          }
          if (paramAnonymousObservable == AdobeCCFilesEditRenameOperationStatus.ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_FAILED)
          {
            if ((localAdobeAsset instanceof AdobeAssetFile)) {}
            for (paramAnonymousObservable = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), (AdobeAssetFile)localAdobeAsset, AdobeCCFilesEditAssetData.EditStatus.Error);; paramAnonymousObservable = new AdobeCCFilesEditAssetData(localAdobeAsset.getName(), AdobeCCFilesEditAssetData.EditStatus.Error))
            {
              AdobeCCFilesEditSession.this.clearSummary();
              AdobeCCFilesEditSession.this.addAssetToSummary(paramAnonymousObservable);
              AdobeCCFilesEditManager.setEditCompletionHandled(false);
              editResponseCallback.onComplete();
              return;
            }
          }
          editResponseCallback.onAbort();
        }
      }, _cloud);
      localAdobeAssetViewEditRenameDialogFragment.setDismissController(paramIAdobeCCFilesRenameDialogDismissController);
      localAdobeAssetViewEditRenameDialogFragment.show(fm, "AssetRename");
    }
  }
  
  private void handleSameLocationMoveError()
  {
    int j = AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size();
    int i = 0;
    if (i < AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().size())
    {
      Object localObject = (AdobeAsset)AdobeAssetViewEditSelectedAssetsController.sharedController().getTargetAssets().get(i);
      if ((localObject instanceof AdobeAssetFile)) {}
      for (localObject = new AdobeCCFilesEditAssetData(((AdobeAsset)localObject).getName(), (AdobeAssetFile)localObject, AdobeCCFilesEditAssetData.EditStatus.Error);; localObject = new AdobeCCFilesEditAssetData(((AdobeAsset)localObject).getName(), AdobeCCFilesEditAssetData.EditStatus.Error))
      {
        addAssetToSummary((AdobeCCFilesEditAssetData)localObject);
        count += 1;
        if (count == j)
        {
          AdobeCCFilesEditManager.setEditCompletionHandled(false);
          if (_summary != null) {
            _summary.setMoveOperationInSameLocation(true);
          }
          editResponseCallback.onComplete();
        }
        i += 1;
        break;
      }
    }
  }
  
  private void notifiyEditStarted()
  {
    AdobeCCFilesEditManager.setEditInProgress(true);
    AdobeCCFilesEditManager.setEditStarted(true);
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_STARTED);
  }
  
  public EditSummary getEditSummary()
  {
    return _summary;
  }
  
  public void startEditSession()
  {
    switch (4.$SwitchMap$com$adobe$creativesdk$foundation$internal$storage$controllers$edit$AdobeCCFilesEditOperation[operation.ordinal()])
    {
    default: 
      return;
    case 1: 
      handleEraseOperation();
      return;
    }
    handleMoveOperation();
  }
  
  public void startEditSession(IAdobeCCFilesRenameDialogDismissController paramIAdobeCCFilesRenameDialogDismissController)
  {
    if (operation == AdobeCCFilesEditOperation.ADOBE_CC_FILE_EDIT_OPERATION_RENAME) {
      handleRenameOperation(paramIAdobeCCFilesRenameDialogDismissController);
    }
  }
  
  public static class EditSummary
  {
    public ArrayList<AdobeCCFilesEditAssetData> _errorAssets = new ArrayList();
    private boolean _moveOperationInSameLocation = false;
    public ArrayList<AdobeCCFilesEditAssetData> _successAssets = new ArrayList();
    public AdobeCCFilesEditOperation operation;
    
    public EditSummary() {}
    
    public int getErrorCount()
    {
      return _errorAssets.size();
    }
    
    public int getSuccessCount()
    {
      return _successAssets.size();
    }
    
    public boolean hasMoveOperationInSameLocation()
    {
      if (_moveOperationInSameLocation == true)
      {
        _moveOperationInSameLocation = false;
        return true;
      }
      return false;
    }
    
    public void setMoveOperationInSameLocation(boolean paramBoolean)
    {
      _moveOperationInSameLocation = true;
    }
  }
}
