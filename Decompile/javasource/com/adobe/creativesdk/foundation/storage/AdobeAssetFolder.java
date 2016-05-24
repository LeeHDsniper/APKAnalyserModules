package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeCollaborationType;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderByProperty;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderRelation;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStoragePagingMode;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResource;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageCollectionRequestCompletionHandler;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageLastPathComponentUtil;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeAssetFolder
  extends AdobeAsset
{
  protected AdobeStorageResourceCollection asrCollection;
  protected boolean firstPageLoaded;
  protected boolean shared;
  
  protected AdobeAssetFolder() {}
  
  protected AdobeAssetFolder(AdobeStorageResourceCollection paramAdobeStorageResourceCollection, AdobeStorageOrderByProperty paramAdobeStorageOrderByProperty, AdobeStorageOrderRelation paramAdobeStorageOrderRelation, URI paramURI)
  {
    asrCollection = paramAdobeStorageResourceCollection;
    GUID = internalID;
    href = href;
    etag = etag;
    name = name;
    mCloud = paramAdobeStorageResourceCollection.getCloud();
    parentHref = paramURI;
    creationDate = AdobeStorageUtils.convertStringToDate(created);
    modificationDate = AdobeStorageUtils.convertStringToDate(modified);
    asrCollection.setOrderBy(paramAdobeStorageOrderByProperty);
    asrCollection.setOrder(paramAdobeStorageOrderRelation);
    firstPageLoaded = false;
    if (collaboration != AdobeCollaborationType.ADOBE_COLLABORATION_TYPE_PRIVATE) {
      bool = true;
    }
    shared = bool;
  }
  
  protected AdobeAssetFolder(AdobeStorageResourceCollection paramAdobeStorageResourceCollection1, AdobeStorageResourceCollection paramAdobeStorageResourceCollection2)
  {
    this(paramAdobeStorageResourceCollection1, paramAdobeStorageResourceCollection2.getOrderBy(), paramAdobeStorageResourceCollection2.getOrder(), href);
  }
  
  public static void create(String paramString, AdobeAssetFolder paramAdobeAssetFolder, IAdobeGenericCompletionCallback<AdobeAssetFolder> paramIAdobeGenericCompletionCallback, IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    create(paramString, paramAdobeAssetFolder, AdobeCloudManager.getSharedCloudManager().getDefaultCloud(), paramIAdobeGenericCompletionCallback, paramIAdobeGenericErrorCallback);
  }
  
  /* Error */
  protected static void create(String paramString, AdobeAssetFolder paramAdobeAssetFolder, AdobeCloud paramAdobeCloud, final IAdobeGenericCompletionCallback<AdobeAssetFolder> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    // Byte code:
    //   0: invokestatic 133	com/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted:getSharedAuthManagerRestricted	()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    //   3: new 8	com/adobe/creativesdk/foundation/storage/AdobeAssetFolder$3
    //   6: dup
    //   7: aload 4
    //   9: invokespecial 136	com/adobe/creativesdk/foundation/storage/AdobeAssetFolder$3:<init>	(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    //   12: ldc -118
    //   14: invokevirtual 142	com/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted:checkAndCallErrorIfNotAuthenticated	(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Ljava/lang/String;)Z
    //   17: ifeq +4 -> 21
    //   20: return
    //   21: aload_1
    //   22: ifnull -2 -> 20
    //   25: aload_0
    //   26: invokestatic 146	com/adobe/creativesdk/foundation/storage/AdobeAsset:getValidatedAssetName	(Ljava/lang/String;)Ljava/lang/String;
    //   29: astore_0
    //   30: aload_0
    //   31: ifnonnull +52 -> 83
    //   34: new 148	java/util/HashMap
    //   37: dup
    //   38: invokespecial 149	java/util/HashMap:<init>	()V
    //   41: astore_0
    //   42: aload_0
    //   43: ldc -105
    //   45: ldc -103
    //   47: invokevirtual 157	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   50: pop
    //   51: aload_0
    //   52: ldc -97
    //   54: sipush 400
    //   57: invokestatic 165	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   60: invokevirtual 157	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   63: pop
    //   64: aload 4
    //   66: new 167	com/adobe/creativesdk/foundation/storage/AdobeAssetException
    //   69: dup
    //   70: getstatic 173	com/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode:AdobeAssetErrorFileReadFailure	Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    //   73: aload_0
    //   74: invokespecial 176	com/adobe/creativesdk/foundation/storage/AdobeAssetException:<init>	(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;)V
    //   77: invokeinterface 182 2 0
    //   82: return
    //   83: aload_1
    //   84: getfield 39	com/adobe/creativesdk/foundation/storage/AdobeAssetFolder:href	Ljava/net/URI;
    //   87: invokevirtual 188	java/net/URI:getRawPath	()Ljava/lang/String;
    //   90: astore 5
    //   92: aload 5
    //   94: ldc -66
    //   96: invokevirtual 196	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   99: ifeq +66 -> 165
    //   102: aload 5
    //   104: aload_0
    //   105: invokevirtual 199	java/lang/String:concat	(Ljava/lang/String;)Ljava/lang/String;
    //   108: astore_0
    //   109: aload_0
    //   110: ldc -66
    //   112: invokevirtual 199	java/lang/String:concat	(Ljava/lang/String;)Ljava/lang/String;
    //   115: astore_0
    //   116: new 184	java/net/URI
    //   119: dup
    //   120: aload_0
    //   121: invokespecial 202	java/net/URI:<init>	(Ljava/lang/String;)V
    //   124: astore_0
    //   125: aload_0
    //   126: invokestatic 206	com/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection:collectionFromHref	(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    //   129: astore_0
    //   130: new 10	com/adobe/creativesdk/foundation/storage/AdobeAssetFolder$4
    //   133: dup
    //   134: aload_1
    //   135: aload_3
    //   136: aload 4
    //   138: invokespecial 209	com/adobe/creativesdk/foundation/storage/AdobeAssetFolder$4:<init>	(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    //   141: astore_1
    //   142: aload_2
    //   143: getstatic 215	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType:AdobeCloudServiceTypeStorage	Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;
    //   146: invokevirtual 221	com/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud:getSessionForService	(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    //   149: checkcast 223	com/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession
    //   152: astore_2
    //   153: aload_2
    //   154: ifnull -134 -> 20
    //   157: aload_2
    //   158: aload_0
    //   159: aload_1
    //   160: invokevirtual 227	com/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession:createDirectory	(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   163: pop
    //   164: return
    //   165: aload 5
    //   167: ldc -66
    //   169: invokevirtual 199	java/lang/String:concat	(Ljava/lang/String;)Ljava/lang/String;
    //   172: aload_0
    //   173: invokevirtual 199	java/lang/String:concat	(Ljava/lang/String;)Ljava/lang/String;
    //   176: astore_0
    //   177: goto -68 -> 109
    //   180: astore_0
    //   181: aload_0
    //   182: invokevirtual 230	java/net/URISyntaxException:printStackTrace	()V
    //   185: return
    //   186: astore_0
    //   187: goto -6 -> 181
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	190	0	paramString	String
    //   0	190	1	paramAdobeAssetFolder	AdobeAssetFolder
    //   0	190	2	paramAdobeCloud	AdobeCloud
    //   0	190	3	paramIAdobeGenericCompletionCallback	IAdobeGenericCompletionCallback<AdobeAssetFolder>
    //   0	190	4	paramIAdobeGenericErrorCallback	IAdobeGenericErrorCallback<AdobeCSDKException>
    //   90	76	5	str	String
    // Exception table:
    //   from	to	target	type
    //   116	125	180	java/net/URISyntaxException
    //   125	153	186	java/net/URISyntaxException
    //   157	164	186	java/net/URISyntaxException
  }
  
  public static AdobeAssetFolder getFolderFromDirectHref(URI paramURI, AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy, AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    Object localObject = null;
    if (paramURI == null) {
      return null;
    }
    for (;;)
    {
      try
      {
        AdobeStorageResourceCollection localAdobeStorageResourceCollection = AdobeStorageResourceCollection.collectionFromHref(paramURI);
        paramURI = new URI(AdobeStorageLastPathComponentUtil.stringByDeletingLastPathComponent(paramURI.getRawPath()));
        paramURI = new AdobeAssetFolder(localAdobeStorageResourceCollection, getStorageOrderByProperty(paramAdobeAssetFolderOrderBy), getStorageOrderRelation(paramAdobeAssetFolderOrderDirection), paramURI);
        paramAdobeAssetFolderOrderBy.printStackTrace();
      }
      catch (Exception paramAdobeAssetFolderOrderBy)
      {
        try
        {
          paramURI.setCloud(AdobeCloudManager.getSharedCloudManager().getDefaultCloud());
          return paramURI;
        }
        catch (Exception paramAdobeAssetFolderOrderBy)
        {
          for (;;) {}
        }
        paramAdobeAssetFolderOrderBy = paramAdobeAssetFolderOrderBy;
        paramURI = localObject;
      }
    }
  }
  
  public static AdobeAssetFolder getFolderFromHref(URI paramURI)
  {
    return getFolderFromHref(paramURI, AdobeCloudManager.getSharedCloudManager().getDefaultCloud());
  }
  
  protected static AdobeAssetFolder getFolderFromHref(URI paramURI, AdobeCloud paramAdobeCloud)
  {
    return getFolderFromHref(paramURI, paramAdobeCloud, AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_NAME, AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_ASCENDING);
  }
  
  protected static AdobeAssetFolder getFolderFromHref(URI paramURI, AdobeCloud paramAdobeCloud, AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy, AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    Object localObject2 = null;
    if (paramURI == null) {
      return null;
    }
    Object localObject1 = paramURI.getRawPath();
    paramURI = (URI)localObject1;
    if (((String)localObject1).startsWith("/")) {
      paramURI = ((String)localObject1).substring(1);
    }
    localObject1 = paramURI;
    if (paramURI.endsWith("/")) {
      localObject1 = paramURI.substring(0, paramURI.length() - 1);
    }
    for (;;)
    {
      try
      {
        localObject1 = new URI(String.format("/files/%s/", new Object[] { localObject1 }));
        paramURI = AdobeStorageResourceCollection.collectionFromHref((URI)localObject1);
        localObject1 = new URI(AdobeStorageLastPathComponentUtil.stringByDeletingLastPathComponent(((URI)localObject1).getRawPath()));
        paramURI = new AdobeAssetFolder(paramURI, getStorageOrderByProperty(paramAdobeAssetFolderOrderBy), getStorageOrderRelation(paramAdobeAssetFolderOrderDirection), (URI)localObject1);
        paramAdobeCloud.printStackTrace();
      }
      catch (Exception paramAdobeCloud)
      {
        try
        {
          paramURI.setCloud(paramAdobeCloud);
          return paramURI;
        }
        catch (Exception paramAdobeCloud)
        {
          for (;;) {}
        }
        paramAdobeCloud = paramAdobeCloud;
        paramURI = localObject2;
      }
    }
  }
  
  public static AdobeAssetFolder getRootOrderedByField(AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy, AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    return rootInCloud(AdobeCloudManager.getSharedCloudManager().getDefaultCloud(), getStorageOrderByProperty(paramAdobeAssetFolderOrderBy), getStorageOrderRelation(paramAdobeAssetFolderOrderDirection));
  }
  
  protected static AdobeStorageOrderByProperty getStorageOrderByProperty(AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy)
  {
    switch (5.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy[paramAdobeAssetFolderOrderBy.ordinal()])
    {
    default: 
      return AdobeStorageOrderByProperty.ADOBE_STORAGE_ORDER_BY_NAME;
    case 1: 
      return AdobeStorageOrderByProperty.ADOBE_STORAGE_ORDER_BY_NAME;
    }
    return AdobeStorageOrderByProperty.ADOBE_STORAGE_ORDER_BY_MODIFIED;
  }
  
  protected static AdobeStorageOrderRelation getStorageOrderRelation(AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    switch (5.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection[paramAdobeAssetFolderOrderDirection.ordinal()])
    {
    default: 
      return AdobeStorageOrderRelation.ADOBE_STORAGE_ORDER_ASCENDING;
    case 1: 
      return AdobeStorageOrderRelation.ADOBE_STORAGE_ORDER_ASCENDING;
    }
    return AdobeStorageOrderRelation.ADOBE_STORAGE_ORDER_DESCENDING;
  }
  
  protected static AdobeAssetFolder rootInCloud(AdobeCloud paramAdobeCloud, AdobeStorageOrderByProperty paramAdobeStorageOrderByProperty, AdobeStorageOrderRelation paramAdobeStorageOrderRelation)
  {
    try
    {
      AdobeStorageResourceCollection localAdobeStorageResourceCollection = AdobeStorageResourceCollection.collectionFromHref(new URI("/files/"));
      localAdobeStorageResourceCollection.setCloud(paramAdobeCloud);
      paramAdobeCloud = new AdobeAssetFolder(localAdobeStorageResourceCollection, paramAdobeStorageOrderByProperty, paramAdobeStorageOrderRelation, null);
      return paramAdobeCloud;
    }
    catch (Exception paramAdobeCloud)
    {
      paramAdobeCloud.printStackTrace();
    }
    return null;
  }
  
  public String getDescription()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      if (GUID != null) {
        localJSONObject.put("guid", GUID);
      }
      if (etag != null) {
        localJSONObject.put("etag", etag);
      }
      if (href != null) {
        localJSONObject.put("href", href);
      }
      if (parentHref != null) {
        localJSONObject.put("parent-href", parentHref);
      }
      if (name != null) {
        localJSONObject.put("name", name);
      }
      if (creationDate != null) {
        localJSONObject.put("created", creationDate.toString());
      }
      if (modificationDate != null) {
        localJSONObject.put("modified", modificationDate.toString());
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        localJSONException.printStackTrace();
      }
    }
    return localJSONObject.toString();
  }
  
  public void getNextPage(int paramInt, final IAdobeAssetFolderNextPageCallback paramIAdobeAssetFolderNextPageCallback)
  {
    resourceCollection().setLimit(paramInt);
    resourceCollectionetag = null;
    IAdobeStorageCollectionRequestCompletionHandler local1 = new IAdobeStorageCollectionRequestCompletionHandler()
    {
      public void onComplete(AdobeStorageResourceCollection paramAnonymousAdobeStorageResourceCollection)
      {
        if (paramAnonymousAdobeStorageResourceCollection != null)
        {
          asrCollection = paramAnonymousAdobeStorageResourceCollection;
          firstPageLoaded = true;
          ArrayList localArrayList = new ArrayList();
          Object localObject = paramAnonymousAdobeStorageResourceCollection.getChildren();
          if (localObject != null)
          {
            localObject = ((ArrayList)localObject).iterator();
            while (((Iterator)localObject).hasNext())
            {
              AdobeStorageResource localAdobeStorageResource = (AdobeStorageResource)((Iterator)localObject).next();
              if ((localAdobeStorageResource instanceof AdobeStorageResourceCollection)) {
                localArrayList.add(new AdobeAssetFolder((AdobeStorageResourceCollection)localAdobeStorageResource, asrCollection));
              } else if ((localAdobeStorageResource instanceof AdobeStorageResourceItem)) {
                if (type.equals(AdobeAssetMimeTypes.MIMETYPE_PHOTOSHOP.getMimeType())) {
                  localArrayList.add(new AdobeAssetPSDFile((AdobeStorageResourceItem)localAdobeStorageResource, asrCollection));
                } else {
                  localArrayList.add(new AdobeAssetFileInternal((AdobeStorageResourceItem)localAdobeStorageResource, asrCollection));
                }
              }
            }
          }
          paramIAdobeAssetFolderNextPageCallback.onCompletion(localArrayList, paramAnonymousAdobeStorageResourceCollection.getNumChildren());
        }
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        if (paramAnonymousAdobeAssetException != null) {
          paramIAdobeAssetFolderNextPageCallback.onError(paramAnonymousAdobeAssetException);
        }
      }
    };
    AdobeStorageSession localAdobeStorageSession = getSession();
    if (localAdobeStorageSession == null) {
      return;
    }
    AdobeStorageResourceCollection localAdobeStorageResourceCollection = resourceCollection();
    if (firstPageLoaded) {}
    for (paramIAdobeAssetFolderNextPageCallback = AdobeStoragePagingMode.AdobeStorageNextPageReplace;; paramIAdobeAssetFolderNextPageCallback = AdobeStoragePagingMode.AdobeStorageFirstPage)
    {
      localAdobeStorageSession.getDirectory(localAdobeStorageResourceCollection, paramIAdobeAssetFolderNextPageCallback, local1);
      return;
    }
  }
  
  public boolean hasNextPage()
  {
    return (!firstPageLoaded) || (!asrCollection.isComplete());
  }
  
  public boolean isShared()
  {
    return shared;
  }
  
  public void resetPaging()
  {
    firstPageLoaded = false;
  }
  
  public void resetPagingOrderedByField(AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy, AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    firstPageLoaded = false;
    resourceCollection().setOrderBy(getStorageOrderByProperty(paramAdobeAssetFolderOrderBy));
    resourceCollection().setOrder(getStorageOrderRelation(paramAdobeAssetFolderOrderDirection));
  }
  
  protected AdobeStorageResourceCollection resourceCollection()
  {
    if (asrCollection == null)
    {
      asrCollection = AdobeStorageResourceCollection.collectionFromHref(href);
      asrCollection.name = name;
      asrCollection.etag = etag;
      asrCollection.internalID = GUID;
      asrCollection.setCloud(getCloud());
    }
    return asrCollection;
  }
}
