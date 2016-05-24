.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
.super Ljava/lang/Object;
.source "AdobeAsset.java"


# instance fields
.field protected GUID:Ljava/lang/String;

.field protected creationDate:Ljava/util/Date;

.field protected etag:Ljava/lang/String;

.field protected href:Ljava/net/URI;

.field protected mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field protected modificationDate:Ljava/util/Date;

.field protected name:Ljava/lang/String;

.field protected parentHref:Ljava/net/URI;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 228
    return-void
.end method

.method public static getValidatedAssetName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 213
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->validAssetName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 214
    const/4 v0, 0x0

    .line 216
    :goto_7
    return-object v0

    :cond_8
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;->escapeAssetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 188
    if-nez p1, :cond_4

    .line 200
    :cond_3
    :goto_3
    return v1

    .line 190
    :cond_4
    if-ne p1, p0, :cond_8

    .line 191
    const/4 v1, 0x1

    goto :goto_3

    .line 192
    :cond_8
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    if-eqz v2, :cond_3

    move-object v0, p1

    .line 195
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 197
    .local v0, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->GUID:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 198
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->GUID:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getCreationDate()Ljava/util/Date;
    .registers 3

    .prologue
    .line 157
    const/4 v0, 0x0

    .line 158
    .local v0, "creationDate":Ljava/util/Date;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->creationDate:Ljava/util/Date;

    if-eqz v1, :cond_d

    .line 159
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->creationDate:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->clone()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "creationDate":Ljava/util/Date;
    check-cast v0, Ljava/util/Date;

    .line 160
    .restart local v0    # "creationDate":Ljava/util/Date;
    :cond_d
    return-object v0
.end method

.method public getEtag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->etag:Ljava/lang/String;

    return-object v0
.end method

.method public getGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->GUID:Ljava/lang/String;

    return-object v0
.end method

.method public getHref()Ljava/net/URI;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->href:Ljava/net/URI;

    return-object v0
.end method

.method public getModificationDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->modificationDate:Ljava/util/Date;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParentHref()Ljava/net/URI;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->parentHref:Ljava/net/URI;

    return-object v0
.end method

.method protected getSession()Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;
    .registers 3

    .prologue
    .line 235
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->mCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 232
    return-void
.end method
