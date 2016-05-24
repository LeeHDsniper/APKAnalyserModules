.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
.super Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
.source "AdobePhotoCatalog.java"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;
    }
.end annotation


# instance fields
.field private _inSync:Z

.field private _name:Ljava/lang/String;

.field private _shared:Z

.field private _type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 374
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    const/4 v2, 0x0

    .line 376
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 377
    if-nez p2, :cond_a

    .line 378
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->generateGUID()Ljava/lang/String;

    move-result-object p2

    .line 380
    :cond_a
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    .line 381
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    .line 382
    const-string v0, "/v1.0/catalogs/%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_href:Ljava/lang/String;

    .line 383
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_inSync:Z

    .line 384
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 385
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .param p4, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    .prologue
    .line 388
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 389
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    .line 390
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public static listCatalogOfType(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 7
    .param p0, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 527
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;>;>;"
    .local p3, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    .line 528
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    if-nez v0, :cond_b

    .line 549
    :goto_a
    return-void

    .line 532
    :cond_b
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$15;

    invoke-direct {v1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$15;-><init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$16;

    invoke-direct {v2, p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$16;-><init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    invoke-virtual {v0, p0, p1, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listCatalogsOfType(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_a
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    return-object v0
.end method

.method public isEqualToCatalog(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
    .registers 4
    .param p1, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    const/4 v0, 0x0

    .line 339
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    if-eqz v1, :cond_c

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_c

    .line 346
    :cond_b
    :goto_b
    return v0

    .line 341
    :cond_c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    if-nez v1, :cond_16

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_b

    .line 343
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    if-nez v0, :cond_22

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_22

    .line 344
    const/4 v0, 0x1

    goto :goto_b

    .line 346
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_b
.end method

.method public isInSync()Z
    .registers 2

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_inSync:Z

    return v0
.end method

.method public listCollectionsAfterName(Ljava/lang/String;IZLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "withLimit"    # I
    .param p3, "includeDeletedCollections"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IZ",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;",
            ">;>;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 252
    .local p4, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;>;>;"
    .local p5, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object v6, p0

    .line 254
    .local v6, "self":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    if-nez v0, :cond_8

    .line 274
    :goto_7
    return-void

    .line 257
    :cond_8
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    new-instance v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$7;

    invoke-direct {v4, p0, p4}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$7;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$8;

    invoke-direct {v5, p0, p5, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$8;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listCollectionsInCatalog(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;Ljava/lang/String;ILcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_7
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 3
    .param p1, "objectInput"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 358
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->readExternal(Ljava/io/ObjectInput;)V

    .line 359
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    .line 360
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_inSync:Z

    .line 361
    return-void
.end method

.method public updateFromDictionary(Lorg/json/JSONObject;)Z
    .registers 11
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 393
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_inSync:Z

    .line 395
    const-string v3, "id"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_14

    .line 396
    const-string v3, "id"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_internalID:Ljava/lang/String;

    .line 398
    :cond_14
    const-string v3, "_id"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_24

    .line 399
    const-string v3, "_id"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_GUID:Ljava/lang/String;

    .line 401
    :cond_24
    const-string v3, "name"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_34

    .line 402
    const-string v3, "name"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    .line 404
    :cond_34
    const-string v3, "created"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_48

    .line 405
    const-string v3, "created"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_creationDate:Ljava/util/Date;

    .line 407
    :cond_48
    const-string v3, "updated"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5c

    .line 408
    const-string v3, "updated"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_modificationDate:Ljava/util/Date;

    .line 410
    :cond_5c
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_modificationDate:Ljava/util/Date;

    if-nez v3, :cond_68

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_creationDate:Ljava/util/Date;

    if-eqz v3, :cond_68

    .line 411
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_creationDate:Ljava/util/Date;

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_modificationDate:Ljava/util/Date;

    .line 413
    :cond_68
    const-string v3, "subtype"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_82

    .line 415
    const-string v3, "subtype"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "lightroom"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_82

    .line 417
    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;->AdobePhotoCatalogTypeLightroom:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog$AdobePhotoCatalogType;

    .line 421
    :cond_82
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    if-nez v3, :cond_90

    .line 422
    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v5, "Catalog doesn\'t have a name"

    invoke-direct {v3, v4, v7, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    throw v3

    .line 423
    :cond_90
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_creationDate:Ljava/util/Date;

    if-nez v3, :cond_ba

    .line 424
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Catalog "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " doesn\'t have a creation time."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    :cond_ba
    const-string v3, "sharing"

    invoke-virtual {p1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 428
    .local v2, "sharing":Ljava/lang/String;
    if-nez v2, :cond_de

    .line 430
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_shared:Z

    .line 437
    :goto_c5
    const-string v3, "links"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 438
    .local v0, "links":Lorg/json/JSONObject;
    if-eqz v0, :cond_e1

    .line 440
    const-string v3, "self"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 442
    .local v1, "selfLinks":Lorg/json/JSONObject;
    if-eqz v1, :cond_dd

    .line 444
    const-string v3, "href"

    invoke-virtual {v1, v3, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_href:Ljava/lang/String;

    .line 453
    .end local v1    # "selfLinks":Lorg/json/JSONObject;
    :cond_dd
    :goto_dd
    return v8

    .line 434
    .end local v0    # "links":Lorg/json/JSONObject;
    :cond_de
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_shared:Z

    goto :goto_c5

    .line 449
    .restart local v0    # "links":Lorg/json/JSONObject;
    :cond_e1
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Catalog doesn\'t have an href."

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    iput-object v7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_href:Ljava/lang/String;

    goto :goto_dd
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 3
    .param p1, "objectOutput"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->writeExternal(Ljava/io/ObjectOutput;)V

    .line 366
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_name:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 367
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->_inSync:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 368
    return-void
.end method
