.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
.source "AdobeAssetPackage.java"


# instance fields
.field private asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

.field private manifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

.field private metadataLoaded:Z


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->metadataLoaded:Z

    .line 70
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V
    .registers 6
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "field"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;
    .param p3, "direction"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .param p4, "parentHref"    # Ljava/net/URI;

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;-><init>()V

    .line 218
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 219
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->internalID:Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->GUID:Ljava/lang/String;

    .line 220
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->href:Ljava/net/URI;

    .line 221
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->etag:Ljava/lang/String;

    .line 222
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->name:Ljava/lang/String;

    .line 224
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->parentHref:Ljava/net/URI;

    .line 226
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->created:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->creationDate:Ljava/util/Date;

    .line 227
    iget-object v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->modified:Ljava/lang/String;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->modificationDate:Ljava/util/Date;

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->creationDate:Ljava/util/Date;

    if-nez v0, :cond_33

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->modificationDate:Ljava/util/Date;

    if-eqz v0, :cond_33

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->modificationDate:Ljava/util/Date;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->creationDate:Ljava/util/Date;

    .line 234
    :cond_33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrderBy(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;)V

    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setOrder(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;)V

    .line 237
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 6
    .param p1, "collection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "parent"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 208
    if-eqz p2, :cond_16

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getOrderBy()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-result-object v0

    move-object v2, v0

    :goto_7
    if-eqz p2, :cond_1a

    .line 209
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->getOrder()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-result-object v0

    move-object v1, v0

    :goto_e
    if-eqz p2, :cond_1e

    iget-object v0, p2, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    .line 208
    :goto_12
    invoke-direct {p0, p1, v2, v1, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;Ljava/net/URI;)V

    .line 211
    return-void

    .line 208
    :cond_16
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;->ADOBE_STORAGE_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderByProperty;

    move-object v2, v0

    goto :goto_7

    .line 209
    :cond_1a
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    move-object v1, v0

    goto :goto_e

    :cond_1e
    const/4 v0, 0x0

    goto :goto_12
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->manifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    return-object p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->metadataLoaded:Z

    return p1
.end method


# virtual methods
.method public getAsrCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    return-object v0
.end method

.method public getManifest()Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->manifest:Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;

    return-object v0
.end method

.method public isMetadataLoaded()Z
    .registers 2

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->metadataLoaded:Z

    return v0
.end method

.method loadDCXManifest(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "successCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;>;"
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 124
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;-><init>()V

    .line 125
    .local v1, "manifestResource":Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;
    const-string v5, "%s%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->href:Ljava/net/URI;

    aput-object v7, v6, v10

    const/4 v7, 0x1

    const-string v8, "manifest"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v5

    iput-object v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;->href:Ljava/net/URI;

    .line 127
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    move-result-object v3

    .line 128
    .local v3, "session":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    if-nez v3, :cond_26

    .line 197
    :goto_25
    return-void

    .line 131
    :cond_26
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    invoke-virtual {v3, v1, v5, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->requestFor(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResource;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    move-result-object v2

    .line 133
    .local v2, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 135
    .local v4, "weakThis":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;

    invoke-direct {v0, p0, v4, p2, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$3;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Ljava/lang/ref/WeakReference;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 194
    .local v0, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;
    invoke-virtual {v3, v2, v9, v9, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getResponseFor(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_25
.end method

.method public loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 7
    .param p1, "successCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->isMetadataLoaded()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 95
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;->onCompletion()V

    .line 120
    :goto_9
    return-void

    .line 99
    :cond_a
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 101
    .local v2, "weakThis":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$1;

    invoke-direct {v1, p0, v2, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Ljava/lang/ref/WeakReference;Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;)V

    .line 110
    .local v1, "manifestSuccessCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifest;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$2;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage$2;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 118
    .local v0, "manifestErrorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->loadDCXManifest(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    goto :goto_9
.end method

.method public reloadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 4
    .param p1, "successCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->metadataLoaded:Z

    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->loadMetadata(Lcom/adobe/creativesdk/foundation/storage/IAdobeRequestCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 83
    return-void
.end method

.method protected resourceCollection()Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .registers 3

    .prologue
    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    if-eqz v0, :cond_2d

    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->href:Ljava/net/URI;

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->collectionFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .line 265
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->name:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->name:Ljava/lang/String;

    .line 266
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->GUID:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->internalID:Ljava/lang/String;

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->href:Ljava/net/URI;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->href:Ljava/net/URI;

    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->etag:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->etag:Ljava/lang/String;

    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 272
    :cond_2d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->asrCollection:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    return-object v0
.end method

.method protected setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 277
    return-void
.end method
