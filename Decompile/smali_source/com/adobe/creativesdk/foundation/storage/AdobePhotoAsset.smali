.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
.source "AdobePhotoAsset.java"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;
    }
.end annotation


# instance fields
.field private _catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

.field private _contentType:Ljava/lang/String;

.field private _downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

.field private _downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field private _latestRevision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

.field private _metadata:Lorg/json/JSONObject;

.field private _name:Ljava/lang/String;

.field private _order:Ljava/lang/String;

.field private _progressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

.field private _renditions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;",
            ">;"
        }
    .end annotation
.end field

.field private _revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

.field private _size:J

.field private _type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

.field private _uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 1072
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 135
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 136
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_progressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 137
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 138
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 1074
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    const/4 v2, 0x0

    .line 1077
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 135
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 136
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_progressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 137
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 138
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 1078
    if-nez p2, :cond_12

    .line 1080
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->generateGUID()Ljava/lang/String;

    move-result-object p2

    .line 1083
    :cond_12
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_GUID:Ljava/lang/String;

    .line 1084
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/v1.0/catalogs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/assets/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_href:Ljava/lang/String;

    .line 1085
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 1086
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 1087
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    .line 1088
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_order:Ljava/lang/String;

    .line 1089
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_renditions:Ljava/util/Map;

    .line 1090
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    .line 1091
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    .line 1092
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    return-object p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    return-object p1
.end method


# virtual methods
.method addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V
    .registers 9
    .param p1, "link"    # Lorg/json/JSONObject;
    .param p2, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;
    .param p4, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1265
    .local p3, "dictionary":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    if-eqz p1, :cond_15

    .line 1267
    const-string v2, "href"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1268
    .local v0, "href":Ljava/lang/String;
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    invoke-direct {v1, v2, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;-><init>(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;)V

    .line 1269
    .local v1, "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    invoke-interface {p3, p4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1272
    .end local v0    # "href":Ljava/lang/String;
    .end local v1    # "rendition":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    :cond_15
    return-void
.end method

.method public cancelDownloadRequest()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1045
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    if-eqz v0, :cond_19

    .line 1047
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    if-eqz v0, :cond_12

    .line 1049
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->unregisterListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V

    .line 1050
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 1053
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->cancel()V

    .line 1054
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1056
    :cond_19
    return-void
.end method

.method public downloadRendition(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
    .registers 13
    .param p1, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback",
            "<[B",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 939
    .local p2, "downloadRenditionCallback":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobePhotoException;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    if-nez v0, :cond_62

    const-string v9, "(null)"

    .line 940
    .local v9, "uuid":Ljava/lang/String;
    :goto_6
    const-string v0, "%s_%s_%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->getGUID()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    const/4 v3, 0x1

    aput-object v9, v1, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->getType()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->getValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 941
    .local v2, "cacheKey":Ljava/lang/String;
    const-string v7, "com.adobe.cc.photo"

    .line 943
    .local v7, "cacheName":Ljava/lang/String;
    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;

    invoke-direct {v5, p0, p2, v2, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$22;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;)V

    .line 1021
    .local v5, "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    const/4 v6, 0x0

    .line 1024
    .local v6, "handler":Landroid/os/Handler;
    :try_start_30
    new-instance v8, Landroid/os/Handler;

    invoke-direct {v8}, Landroid/os/Handler;-><init>()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_35} :catch_69

    .end local v6    # "handler":Landroid/os/Handler;
    .local v8, "handler":Landroid/os/Handler;
    move-object v6, v8

    .line 1031
    .end local v8    # "handler":Landroid/os/Handler;
    .restart local v6    # "handler":Landroid/os/Handler;
    :goto_36
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_GUID:Ljava/lang/String;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 1032
    invoke-static {v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v3

    const-string v4, "com.adobe.cc.photo"

    .line 1031
    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->getDataFromGUID(Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumSet;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)Z

    move-result v0

    if-nez v0, :cond_61

    .line 1035
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "Request for cache com.adobe.cc.photoended in Error"

    invoke-static {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1036
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_FILE_READ_FAILURE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;)V

    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;->onError(Ljava/lang/Object;)V

    .line 1038
    :cond_61
    return-void

    .line 939
    .end local v2    # "cacheKey":Ljava/lang/String;
    .end local v5    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    .end local v6    # "handler":Landroid/os/Handler;
    .end local v7    # "cacheName":Ljava/lang/String;
    .end local v9    # "uuid":Ljava/lang/String;
    :cond_62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->getGUID()Ljava/lang/String;

    move-result-object v9

    goto :goto_6

    .line 1026
    .restart local v2    # "cacheKey":Ljava/lang/String;
    .restart local v5    # "byteHandler":Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;, "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler<[B>;"
    .restart local v6    # "handler":Landroid/os/Handler;
    .restart local v7    # "cacheName":Ljava/lang/String;
    .restart local v9    # "uuid":Ljava/lang/String;
    :catch_69
    move-exception v0

    goto :goto_36
.end method

.method public getMetadata()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getRenditions()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_renditions:Ljava/util/Map;

    return-object v0
.end method

.method handleCommonDownloadCompletionBookKeeping()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1104
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    if-eqz v0, :cond_c

    .line 1105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->unregisterListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V

    .line 1106
    :cond_c
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1107
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_downloadProgressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 1108
    return-void
.end method

.method handleCommonUploadCompletionBookKeeping()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 1096
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    if-eqz v0, :cond_c

    .line 1097
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_progressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->unregisterListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V

    .line 1098
    :cond_c
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_uploadRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 1099
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_progressListener:Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .line 1100
    return-void
.end method

.method public isEqualToAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z
    .registers 4
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 1066
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_GUID:Ljava/lang/String;

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_GUID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    iget-object v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->isEqualToCatalog(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 6
    .param p1, "objectInput"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->readExternal(Ljava/io/ObjectInput;)V

    .line 176
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    .line 177
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 178
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_contentType:Ljava/lang/String;

    .line 180
    :try_start_1b
    new-instance v2, Lorg/json/JSONObject;

    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_28} :catch_5b

    .line 184
    :goto_28
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_latestRevision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    .line 185
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    .line 186
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_renditions:Ljava/util/Map;

    .line 187
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_order:Ljava/lang/String;

    .line 188
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_size:J

    .line 189
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    move-result-object v1

    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v2

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    .line 190
    return-void

    .line 181
    :catch_5b
    move-exception v0

    .line 182
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobePhotoAsset.readExternal"

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_28
.end method

.method public updateFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
    .registers 14
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 1111
    const-string v7, "id"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_11

    .line 1113
    const-string v7, "id"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_internalID:Ljava/lang/String;

    .line 1116
    :cond_11
    const-string v7, "_id"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_21

    .line 1118
    const-string v7, "_id"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_GUID:Ljava/lang/String;

    .line 1121
    :cond_21
    const-string v7, "created"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_35

    .line 1123
    const-string v7, "created"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_creationDate:Ljava/util/Date;

    .line 1126
    :cond_35
    const-string v7, "updated"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_49

    .line 1128
    const-string v7, "updated"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_modificationDate:Ljava/util/Date;

    .line 1131
    :cond_49
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_modificationDate:Ljava/util/Date;

    if-nez v7, :cond_55

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_creationDate:Ljava/util/Date;

    if-eqz v7, :cond_55

    .line 1133
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_creationDate:Ljava/util/Date;

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_modificationDate:Ljava/util/Date;

    .line 1136
    :cond_55
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 1137
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 1139
    const-string v7, "subtype"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1140
    .local v6, "subtype":Ljava/lang/String;
    if-eqz v6, :cond_71

    const-string v7, "jpeg"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_71

    .line 1142
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;->AdobePhotoAssetTypeImage:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    .line 1152
    :cond_71
    const-string v7, "order"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_81

    .line 1154
    const-string v7, "order"

    invoke-virtual {p1, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_order:Ljava/lang/String;

    .line 1157
    :cond_81
    const-string v7, "payload"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    .line 1158
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    if-eqz v7, :cond_159

    .line 1160
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    const-string v8, "importSource"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1161
    .local v0, "importSource":Lorg/json/JSONObject;
    if-eqz v0, :cond_af

    .line 1163
    const-string v7, "fileName"

    invoke-virtual {v0, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    .line 1164
    const-string v7, "fileSize"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_size:J

    .line 1165
    const-string v7, "contentType"

    invoke-virtual {v0, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_contentType:Ljava/lang/String;

    .line 1173
    .end local v0    # "importSource":Lorg/json/JSONObject;
    :cond_af
    :goto_af
    const-string v7, "links"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 1174
    .local v2, "links":Lorg/json/JSONObject;
    if-eqz v2, :cond_162

    .line 1176
    const-string v7, "self"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 1178
    .local v5, "selfLinks":Lorg/json/JSONObject;
    if-eqz v5, :cond_c7

    .line 1180
    const-string v7, "href"

    invoke-virtual {v5, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_href:Ljava/lang/String;

    .line 1184
    :cond_c7
    const-string v7, "/rels/latest_revision"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1185
    .local v1, "latestRevisionLink":Lorg/json/JSONObject;
    if-eqz v1, :cond_e1

    .line 1187
    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    const-string v8, "href"

    invoke-virtual {v1, v8, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;-><init>(Ljava/lang/String;Z)V

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_latestRevision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    .line 1190
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_latestRevision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    .line 1194
    :cond_e1
    const-string v7, "/rels/master"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 1195
    .local v3, "masterLink":Lorg/json/JSONObject;
    if-eqz v3, :cond_f5

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_contentType:Ljava/lang/String;

    if-nez v7, :cond_f5

    .line 1197
    const-string v7, "content_type"

    invoke-virtual {v3, v7, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_contentType:Ljava/lang/String;

    .line 1201
    :cond_f5
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1203
    .local v4, "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    const-string v7, "/rels/rendition_type/144h"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_THUMBNAIL:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "144h"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1207
    const-string v7, "/rels/rendition_type/thumbnail2x"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_THUMBNAIL_2X:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "thumbnail2x"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1211
    const-string v7, "/rels/rendition_type/2048"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_2048:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "2048"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1215
    const-string v7, "/rels/rendition_type/1024"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_1024:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "1024"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1219
    const-string v7, "/rels/rendition_type/fullsize"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_FULL_SIZE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "fullsize"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1223
    const-string v7, "/rels/rendition_type/favorite"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_FAVORITE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "favorite"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1227
    const-string v7, "/rels/rendition_type/preview"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->ADOBE_PHOTO_ASSET_RENDITION_TYPE_IMAGE_PREVIEW:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    const-string v9, "preview"

    invoke-virtual {p0, v7, v8, v4, v9}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->addRenditionLink(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;Ljava/util/Map;Ljava/lang/String;)V

    .line 1253
    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_renditions:Ljava/util/Map;

    .line 1259
    .end local v1    # "latestRevisionLink":Lorg/json/JSONObject;
    .end local v3    # "masterLink":Lorg/json/JSONObject;
    .end local v4    # "renditions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;>;"
    .end local v5    # "selfLinks":Lorg/json/JSONObject;
    :goto_157
    const/4 v7, 0x1

    return v7

    .line 1170
    .end local v2    # "links":Lorg/json/JSONObject;
    :cond_159
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    goto/16 :goto_af

    .line 1256
    .restart local v2    # "links":Lorg/json/JSONObject;
    :cond_162
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v8, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Asset doesn\'t have any links."

    invoke-static {v7, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 1257
    iput-object v10, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_href:Ljava/lang/String;

    goto :goto_157
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 4
    .param p1, "objectOutput"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 194
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->writeExternal(Ljava/io/ObjectOutput;)V

    .line 195
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_name:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 197
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_contentType:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 198
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_metadata:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_latestRevision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_revision:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_renditions:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_order:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 203
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_size:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset$AdobePhotoAssetType;->getValue()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 205
    return-void
.end method
