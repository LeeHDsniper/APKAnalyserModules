.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
.source "AdobeAssetFolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;
    }
.end annotation


# instance fields
.field protected asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

.field protected firstPageLoaded:Z

.field protected shared:Z


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 431
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;-><init>()V

    .line 433
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    .registers 8
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "field"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .param p3, "direction"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .param p4, "parentHref"    # Ljava/net/URI;

    .prologue
    const/4 v0, 0x0

    .line 406
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;-><init>()V

    .line 407
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 408
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->internalID:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->GUID:Ljava/lang/String;

    .line 409
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->href:Ljava/net/URI;

    .line 410
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->etag:Ljava/lang/String;

    .line 411
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->name:Ljava/lang/String;

    .line 412
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 413
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->parentHref:Ljava/net/URI;

    .line 414
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->created:Ljava/lang/String;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->creationDate:Ljava/util/Date;

    .line 415
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->modified:Ljava/lang/String;

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->modificationDate:Ljava/util/Date;

    .line 417
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {v1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrderBy(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;)V

    .line 418
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {v1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrder(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)V

    .line 419
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    .line 421
    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collaboration:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;->ADOBE_COLLABORATION_TYPE_PRIVATE:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeCollaborationType;

    if-eq v1, v2, :cond_41

    const/4 v0, 0x1

    :cond_41
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->shared:Z

    .line 423
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 6
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "parent"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 427
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getOrderBy()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v0

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getOrder()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v1

    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V

    .line 428
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 5
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "parentFolder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 360
    .local p2, "completionDelegate":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;>;"
    .local p3, "errorDelegate":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    invoke-static {p0, p1, v0, p2, p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->create(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 361
    return-void
.end method

.method protected static create(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 21
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "parentFolder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 541
    .local p3, "completionDelegate":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;>;"
    .local p4, "errorDelegate":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v13

    new-instance v14, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$3;

    move-object/from16 v0, p4

    invoke-direct {v14, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$3;-><init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    const-string v15, "Update requires an authenticated user."

    invoke-virtual {v13, v14, v15}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->checkAndCallErrorIfNotAuthenticated(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_14

    .line 618
    :cond_13
    :goto_13
    return-void

    .line 552
    :cond_14
    if-eqz p1, :cond_13

    .line 554
    invoke-static/range {p0 .. p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getValidatedAssetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 555
    .local v12, "validName":Ljava/lang/String;
    if-nez v12, :cond_40

    .line 557
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 558
    .local v5, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "ADOBE_ASSET_DETAILS_STRING_KEY"

    const-string v14, "Illegal Characters in name"

    invoke-virtual {v5, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    const-string v13, "AdobeNetworkHTTPStatus"

    const/16 v14, 0x190

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v5, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    sget-object v13, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;->AdobeAssetErrorFileReadFailure:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    invoke-direct {v7, v13, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;)V

    .line 561
    .local v7, "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    move-object/from16 v0, p4

    invoke-interface {v0, v7}, Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;->onError(Ljava/lang/Object;)V

    goto :goto_13

    .line 565
    .end local v5    # "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "error":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    :cond_40
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->href:Ljava/net/URI;

    invoke-virtual {v13}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v10

    .line 566
    .local v10, "path":Ljava/lang/String;
    const-string v13, "/"

    invoke-virtual {v10, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_80

    .line 567
    invoke-virtual {v10, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 571
    :goto_54
    const-string v13, "/"

    invoke-virtual {v10, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 573
    const/4 v8, 0x0

    .line 576
    .local v8, "newHref":Ljava/net/URI;
    :try_start_5b
    new-instance v9, Ljava/net/URI;

    invoke-direct {v9, v10}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_60
    .catch Ljava/net/URISyntaxException; {:try_start_5b .. :try_end_60} :catch_8b

    .line 578
    .end local v8    # "newHref":Ljava/net/URI;
    .local v9, "newHref":Ljava/net/URI;
    :try_start_60
    invoke-static {v9}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    .line 580
    .local v3, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$4;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-direct {v4, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$4;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 607
    .local v4, "comHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    sget-object v13, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v11

    check-cast v11, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    .line 608
    .local v11, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-eqz v11, :cond_13

    .line 611
    invoke-virtual {v11, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->createDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    :try_end_7e
    .catch Ljava/net/URISyntaxException; {:try_start_60 .. :try_end_7e} :catch_90

    move-object v8, v9

    .line 616
    .end local v9    # "newHref":Ljava/net/URI;
    .restart local v8    # "newHref":Ljava/net/URI;
    goto :goto_13

    .line 569
    .end local v3    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v4    # "comHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    .end local v8    # "newHref":Ljava/net/URI;
    .end local v11    # "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    :cond_80
    const-string v13, "/"

    invoke-virtual {v10, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_54

    .line 613
    .restart local v8    # "newHref":Ljava/net/URI;
    :catch_8b
    move-exception v6

    .line 615
    .local v6, "e":Ljava/net/URISyntaxException;
    :goto_8c
    invoke-virtual {v6}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_13

    .line 613
    .end local v6    # "e":Ljava/net/URISyntaxException;
    .end local v8    # "newHref":Ljava/net/URI;
    .restart local v9    # "newHref":Ljava/net/URI;
    :catch_90
    move-exception v6

    move-object v8, v9

    .end local v9    # "newHref":Ljava/net/URI;
    .restart local v8    # "newHref":Ljava/net/URI;
    goto :goto_8c
.end method

.method public static getFolderFromDirectHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 10
    .param p0, "href"    # Ljava/net/URI;
    .param p1, "field"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .param p2, "direction"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    .line 331
    const/4 v3, 0x0

    .line 332
    .local v3, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    if-nez p0, :cond_5

    .line 333
    const/4 v5, 0x0

    .line 347
    :goto_4
    return-object v5

    .line 336
    :cond_5
    :try_start_5
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 338
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    new-instance v2, Ljava/net/URI;

    invoke-virtual {p0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->stringByDeletingLastPathComponent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 340
    .local v2, "parentHref":Ljava/net/URI;
    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v5

    .line 341
    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v6

    invoke-direct {v4, v0, v5, v6, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_23} :catch_31

    .line 342
    .end local v3    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .local v4, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :try_start_23
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_2e} :catch_36

    move-object v3, v4

    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v2    # "parentHref":Ljava/net/URI;
    .end local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v3    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :goto_2f
    move-object v5, v3

    .line 347
    goto :goto_4

    .line 343
    :catch_31
    move-exception v1

    .line 345
    .local v1, "e":Ljava/lang/Exception;
    :goto_32
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2f

    .line 343
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .restart local v2    # "parentHref":Ljava/net/URI;
    .restart local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :catch_36
    move-exception v1

    move-object v3, v4

    .end local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v3    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    goto :goto_32
.end method

.method public static getFolderFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2
    .param p0, "href"    # Ljava/net/URI;

    .prologue
    .line 285
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getFolderFromHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    return-object v0
.end method

.method protected static getFolderFromHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 4
    .param p0, "href"    # Ljava/net/URI;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 506
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    invoke-static {p0, p1, v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getFolderFromHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    return-object v0
.end method

.method protected static getFolderFromHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 14
    .param p0, "href"    # Ljava/net/URI;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .param p2, "field"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .param p3, "direction"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 511
    const/4 v4, 0x0

    .line 512
    .local v4, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    if-nez p0, :cond_7

    .line 513
    const/4 v7, 0x0

    .line 536
    :goto_6
    return-object v7

    .line 515
    :cond_7
    invoke-virtual {p0}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v3

    .line 516
    .local v3, "path":Ljava/lang/String;
    const-string v7, "/"

    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 517
    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 518
    :cond_17
    const-string v7, "/"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_29

    .line 519
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 523
    :cond_29
    :try_start_29
    new-instance v6, Ljava/net/URI;

    const-string v7, "/files/%s/"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 524
    .local v6, "uri":Ljava/net/URI;
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 526
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    new-instance v2, Ljava/net/URI;

    invoke-virtual {v6}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageLastPathComponentUtil;->stringByDeletingLastPathComponent(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 528
    .local v2, "parentHref":Ljava/net/URI;
    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v7

    .line 529
    invoke-static {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v8

    invoke-direct {v5, v0, v7, v8, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_58} :catch_5e

    .line 531
    .end local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .local v5, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :try_start_58
    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_63

    move-object v4, v5

    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v2    # "parentHref":Ljava/net/URI;
    .end local v5    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .end local v6    # "uri":Ljava/net/URI;
    .restart local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :goto_5c
    move-object v7, v4

    .line 536
    goto :goto_6

    .line 532
    :catch_5e
    move-exception v1

    .line 534
    .local v1, "e":Ljava/lang/Exception;
    :goto_5f
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5c

    .line 532
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .restart local v2    # "parentHref":Ljava/net/URI;
    .restart local v5    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v6    # "uri":Ljava/net/URI;
    :catch_63
    move-exception v1

    move-object v4, v5

    .end local v5    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .restart local v4    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    goto :goto_5f
.end method

.method public static getRootOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 5
    .param p0, "field"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .param p1, "direction"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    .line 273
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v1

    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->rootInCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    return-object v0
.end method

.method protected static getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .registers 3
    .param p0, "orderBy"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .prologue
    .line 451
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 458
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;->ADOBE_STORAGE_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    :goto_d
    return-object v0

    .line 454
    :pswitch_e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;->ADOBE_STORAGE_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    goto :goto_d

    .line 456
    :pswitch_11
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;->ADOBE_STORAGE_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    goto :goto_d

    .line 451
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method protected static getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .registers 3
    .param p0, "orderDirection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    .line 464
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 471
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    :goto_d
    return-object v0

    .line 467
    :pswitch_e
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    goto :goto_d

    .line 469
    :pswitch_11
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    goto :goto_d

    .line 464
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method protected static rootInCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 9
    .param p0, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .param p1, "orderedByField"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .param p2, "orderDirection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    .prologue
    .line 487
    const/4 v2, 0x0

    .line 490
    .local v2, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :try_start_1
    new-instance v4, Ljava/net/URI;

    const-string v5, "/files/"

    invoke-direct {v4, v5}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 492
    .local v4, "rootURI":Ljava/net/URI;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    .line 493
    .local v0, "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 494
    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    const/4 v5, 0x0

    invoke-direct {v3, v0, p1, p2, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_15} :catch_17

    .end local v2    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .local v3, "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    move-object v2, v3

    .line 501
    .end local v0    # "collection":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .end local v3    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .end local v4    # "rootURI":Ljava/net/URI;
    .restart local v2    # "result":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :goto_16
    return-object v2

    .line 496
    :catch_17
    move-exception v1

    .line 498
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_16
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 5

    .prologue
    .line 226
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 229
    .local v1, "jsonDescription":Lorg/json/JSONObject;
    :try_start_5
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->GUID:Ljava/lang/String;

    if-eqz v2, :cond_10

    .line 230
    const-string v2, "guid"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->GUID:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    :cond_10
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->etag:Ljava/lang/String;

    if-eqz v2, :cond_1b

    .line 233
    const-string v2, "etag"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->etag:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 234
    :cond_1b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->href:Ljava/net/URI;

    if-eqz v2, :cond_26

    .line 235
    const-string v2, "href"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->href:Ljava/net/URI;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    :cond_26
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->parentHref:Ljava/net/URI;

    if-eqz v2, :cond_31

    .line 237
    const-string v2, "parent-href"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->parentHref:Ljava/net/URI;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 238
    :cond_31
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->name:Ljava/lang/String;

    if-eqz v2, :cond_3c

    .line 239
    const-string v2, "name"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    :cond_3c
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->creationDate:Ljava/util/Date;

    if-eqz v2, :cond_4b

    .line 241
    const-string v2, "created"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->creationDate:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    :cond_4b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->modificationDate:Ljava/util/Date;

    if-eqz v2, :cond_5a

    .line 243
    const-string v2, "modified"

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->modificationDate:Ljava/util/Date;

    invoke-virtual {v3}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5a
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5a} :catch_5f

    .line 249
    :cond_5a
    :goto_5a
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 245
    :catch_5f
    move-exception v0

    .line 246
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_5a
.end method

.method public getNextPage(ILcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V
    .registers 7
    .param p1, "pageSize"    # I
    .param p2, "nextPageDelegate"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setLimit(I)V

    .line 130
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v2

    const/4 v3, 0x0

    iput-object v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    .line 132
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;)V

    .line 184
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v1

    .line 185
    .local v1, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v1, :cond_1a

    .line 192
    :goto_19
    return-void

    .line 188
    :cond_1a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v3

    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    if-eqz v2, :cond_28

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    :goto_24
    invoke-virtual {v1, v3, v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getDirectory(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageCollectionRequestCompletionHandler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_19

    :cond_28
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    goto :goto_24
.end method

.method public hasNextPage()Z
    .registers 2

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->isComplete()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isShared()Z
    .registers 2

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->shared:Z

    return v0
.end method

.method public resetPaging()V
    .registers 2

    .prologue
    .line 200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    .line 202
    return-void
.end method

.method public resetPagingOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)V
    .registers 5
    .param p1, "field"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .param p2, "direction"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .prologue
    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->firstPageLoaded:Z

    .line 215
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderByProperty(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrderBy(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;)V

    .line 216
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getStorageOrderRelation(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrder(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)V

    .line 218
    return-void
.end method

.method protected resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 3

    .prologue
    .line 437
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    if-nez v0, :cond_27

    .line 439
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->href:Ljava/net/URI;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 440
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    .line 441
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->etag:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    .line 442
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->GUID:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->internalID:Ljava/lang/String;

    .line 443
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 446
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    return-object v0
.end method
