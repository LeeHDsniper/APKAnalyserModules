.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
.super Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
.source "AdobePhotoCollection.java"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;,
        Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    }
.end annotation


# instance fields
.field private _catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

.field private _coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

.field private _name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 575
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 577
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "guid"    # Ljava/lang/String;
    .param p3, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .prologue
    .line 579
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;-><init>()V

    .line 580
    if-nez p2, :cond_9

    .line 581
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->generateGUID()Ljava/lang/String;

    move-result-object p2

    .line 584
    :cond_9
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_GUID:Ljava/lang/String;

    .line 585
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    .line 586
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/v1.0/catalogs/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/albums/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_href:Ljava/lang/String;

    .line 587
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 588
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 589
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public assetCount(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 512
    .local p1, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Ljava/lang/Integer;>;"
    .local p2, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    if-nez v0, :cond_7

    .line 530
    :goto_6
    return-void

    .line 515
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;

    invoke-direct {v1, p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$21;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$22;

    invoke-direct {v2, p0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$22;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    invoke-virtual {v0, p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getAssetCountInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    goto :goto_6
.end method

.method public getCatalog()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    return-object v0
.end method

.method public getCoverAsset()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public listAssetsOnPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;ILcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    .registers 16
    .param p1, "page"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
    .param p2, "sortType"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;
    .param p3, "limit"    # I
    .param p4, "flag"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;
    .param p5, "completionCallback"    # Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;",
            "I",
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;",
            "Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 478
    .local p6, "errorCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback<Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;>;"
    move-object v8, p0

    .line 479
    .local v8, "self":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    if-nez v0, :cond_8

    .line 500
    :goto_7
    return-void

    .line 482
    :cond_8
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    move-result-object v0

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;

    invoke-direct {v6, p0, p5}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$19;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;)V

    new-instance v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$20;

    invoke-direct {v7, p0, p6, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$20;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;)V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p4

    move v5, p3

    invoke-virtual/range {v0 .. v7}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->listAssetsInCollection(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionSort;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection$AdobePhotoCollectionFlag;ILcom/adobe/creativesdk/foundation/storage/IAdobePhotoAssetsListRequestCompletionHandler;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

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
    .line 547
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->readExternal(Ljava/io/ObjectInput;)V

    .line 548
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    .line 549
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 550
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 551
    return-void
.end method

.method public setCoverAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 2
    .param p1, "coverAsset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 125
    return-void
.end method

.method public updateFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
    .registers 13
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "catalog"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 592
    const-string v5, "id"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_11

    .line 593
    const-string v5, "id"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_internalID:Ljava/lang/String;

    .line 596
    :cond_11
    const-string v5, "_id"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_21

    .line 597
    const-string v5, "_id"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_GUID:Ljava/lang/String;

    .line 600
    :cond_21
    const-string v5, "name"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_31

    .line 601
    const-string v5, "name"

    invoke-virtual {p1, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    .line 604
    :cond_31
    const-string v5, "created"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_45

    .line 605
    const-string v5, "created"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_creationDate:Ljava/util/Date;

    .line 608
    :cond_45
    const-string v5, "update"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_59

    .line 609
    const-string v5, "updated"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertStringToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_modificationDate:Ljava/util/Date;

    .line 612
    :cond_59
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_modificationDate:Ljava/util/Date;

    if-nez v5, :cond_65

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_creationDate:Ljava/util/Date;

    if-eqz v5, :cond_65

    .line 613
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_creationDate:Ljava/util/Date;

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_modificationDate:Ljava/util/Date;

    .line 616
    :cond_65
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    .line 617
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 619
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    if-nez v5, :cond_7b

    .line 620
    new-instance v5, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;->ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;

    const-string v7, "Collection doesn\'t have a name"

    invoke-direct {v5, v6, v9, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    throw v5

    .line 621
    :cond_7b
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_creationDate:Ljava/util/Date;

    if-nez v5, :cond_a5

    .line 622
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Collection "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " doesn\'t have a creation time."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    :cond_a5
    const-string v5, "cover"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 626
    .local v0, "cover":Lorg/json/JSONObject;
    if-eqz v0, :cond_bf

    .line 627
    const-string v5, "_id"

    invoke-virtual {v0, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 629
    .local v2, "coverGUID":Ljava/lang/String;
    if-eqz v2, :cond_bf

    .line 630
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-direct {v1, v9, v2, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)V

    .line 633
    .local v1, "coverAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    :try_start_ba
    invoke-virtual {v1, v0, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->updateFromDictionary(Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;)Z
    :try_end_bd
    .catch Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException; {:try_start_ba .. :try_end_bd} :catch_e9

    .line 637
    :goto_bd
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 641
    .end local v1    # "coverAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .end local v2    # "coverGUID":Ljava/lang/String;
    :cond_bf
    const-string v5, "links"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 642
    .local v3, "links":Lorg/json/JSONObject;
    if-eqz v3, :cond_d9

    .line 644
    const-string v5, "self"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 646
    .local v4, "selfLinks":Lorg/json/JSONObject;
    if-eqz v4, :cond_d7

    .line 648
    const-string v5, "href"

    invoke-virtual {v4, v5, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_href:Ljava/lang/String;

    .line 656
    .end local v4    # "selfLinks":Lorg/json/JSONObject;
    :cond_d7
    :goto_d7
    const/4 v5, 0x1

    return v5

    .line 653
    :cond_d9
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->WARN:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Collection doesn\'t have an href."

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    iput-object v9, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_href:Ljava/lang/String;

    goto :goto_d7

    .line 634
    .end local v3    # "links":Lorg/json/JSONObject;
    .restart local v1    # "coverAsset":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .restart local v2    # "coverGUID":Ljava/lang/String;
    :catch_e9
    move-exception v5

    goto :goto_bd
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
    .line 555
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->writeExternal(Ljava/io/ObjectOutput;)V

    .line 556
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_name:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 557
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_catalog:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCatalog;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 558
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoCollection;->_coverAsset:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 559
    return-void
.end method
