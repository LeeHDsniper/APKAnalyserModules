package com.adobe.creativesdk.foundation.adobeinternal.storage.library;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetCompFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetDrawFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetLibraryInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetLineFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetPSMixFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetPackageInternal;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetSketchbookInternal;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderByProperty;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageOrderRelation;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStoragePagingMode;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResource;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageCollectionRequestCompletionHandler;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderBy;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolderOrderDirection;
import com.adobe.creativesdk.foundation.storage.IAdobeAssetFolderNextPageCallback;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AdobeAssetProductFolder
  extends AdobeAssetFolder
{
  protected AdobeAssetProductFolder(AdobeStorageResourceCollection paramAdobeStorageResourceCollection, AdobeStorageOrderByProperty paramAdobeStorageOrderByProperty, AdobeStorageOrderRelation paramAdobeStorageOrderRelation, URI paramURI)
  {
    super(paramAdobeStorageResourceCollection, paramAdobeStorageOrderByProperty, paramAdobeStorageOrderRelation, paramURI);
  }
  
  public static AdobeAssetProductFolder getRootForProduct(AdobeAssetProduct paramAdobeAssetProduct, AdobeCloud paramAdobeCloud)
  {
    return getRootForProduct(paramAdobeAssetProduct, paramAdobeCloud, AdobeAssetFolderOrderBy.ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED, AdobeAssetFolderOrderDirection.ADOBE_ASSET_FOLDER_ORDER_DESCENDING);
  }
  
  public static AdobeAssetProductFolder getRootForProduct(AdobeAssetProduct paramAdobeAssetProduct, AdobeCloud paramAdobeCloud, AdobeAssetFolderOrderBy paramAdobeAssetFolderOrderBy, AdobeAssetFolderOrderDirection paramAdobeAssetFolderOrderDirection)
  {
    if (paramAdobeAssetProduct == null)
    {
      AdobeLogger.log(Level.ERROR, "AdobeAssetProductFolder.getRootForProduct", "AdobeAssetProduct enum is null");
      return null;
    }
    String str = "";
    switch (2.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$storage$library$AdobeAssetProduct[paramAdobeAssetProduct.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, "AdobeAssetProductFolder.getRootForProduct", "Undefined product.");
      paramAdobeAssetProduct = str;
    }
    for (;;)
    {
      paramAdobeAssetProduct = AdobeStorageResourceCollection.collectionFromHref(URI.create(String.format("/assets/%s/", new Object[] { paramAdobeAssetProduct })));
      paramAdobeAssetProduct.setCloud(paramAdobeCloud);
      return new AdobeAssetProductFolder(paramAdobeAssetProduct, AdobeAssetFolder.getStorageOrderByProperty(paramAdobeAssetFolderOrderBy), AdobeAssetFolder.getStorageOrderRelation(paramAdobeAssetFolderOrderDirection), null);
      paramAdobeAssetProduct = "adobedraw";
      continue;
      paramAdobeAssetProduct = "adobe-libraries";
      continue;
      paramAdobeAssetProduct = "adobe-line";
      continue;
      paramAdobeAssetProduct = "adobesketch";
      continue;
      paramAdobeAssetProduct = "adobe-psmix";
      continue;
      paramAdobeAssetProduct = "adobe-layup";
    }
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
          AdobeAssetProductFolder.access$002(AdobeAssetProductFolder.this, paramAnonymousAdobeStorageResourceCollection);
          AdobeAssetProductFolder.access$102(AdobeAssetProductFolder.this, true);
          Pattern localPattern = Pattern.compile("assets/([-_\\w]+)/", 2);
          Object localObject = paramAnonymousAdobeStorageResourceCollection.getChildren();
          ArrayList localArrayList = new ArrayList();
          if (localObject != null)
          {
            Iterator localIterator = ((ArrayList)localObject).iterator();
            while (localIterator.hasNext())
            {
              localObject = (AdobeStorageResource)localIterator.next();
              if ((localObject instanceof AdobeStorageResourceCollection))
              {
                AdobeStorageResourceCollection localAdobeStorageResourceCollection = (AdobeStorageResourceCollection)localObject;
                Matcher localMatcher = localPattern.matcher(href.getPath());
                for (localObject = ""; localMatcher.find(); localObject = localMatcher.group(1)) {}
                localObject = ((String)localObject).toLowerCase();
                if (((String)localObject).equals("adobedraw"))
                {
                  localObject = new AdobeAssetDrawFileInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetDrawFileInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else if (((String)localObject).equals("adobe-libraries"))
                {
                  localObject = new AdobeAssetLibraryInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetLibraryInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else if (((String)localObject).equals("adobe-line"))
                {
                  localObject = new AdobeAssetLineFileInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetLineFileInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else if (((String)localObject).equals("adobesketch"))
                {
                  localObject = new AdobeAssetSketchbookInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetSketchbookInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else if (((String)localObject).equals("adobe-psmix"))
                {
                  localObject = new AdobeAssetPSMixFileInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetPSMixFileInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else if (((String)localObject).equals("adobe-layup"))
                {
                  localObject = new AdobeAssetCompFileInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetCompFileInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
                }
                else
                {
                  localObject = new AdobeAssetPackageInternal(localAdobeStorageResourceCollection, resourceCollection());
                  ((AdobeAssetPackageInternal)localObject).setCloud(jdField_this.getCloud());
                  localArrayList.add(localObject);
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
}
