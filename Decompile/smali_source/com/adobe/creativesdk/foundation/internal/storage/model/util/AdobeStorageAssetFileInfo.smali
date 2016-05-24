.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;
.super Ljava/lang/Object;
.source "AdobeStorageAssetFileInfo.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public GUID:Ljava/lang/String;

.field public cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field public creationDate:Ljava/util/Date;

.field public currentVersion:I

.field public etag:Ljava/lang/String;

.field public fileSize:J

.field public hlsHref:Ljava/lang/String;

.field public href:Ljava/net/URI;

.field public md5Hash:Ljava/lang/String;

.field public modificationDate:Ljava/util/Date;

.field public name:Ljava/lang/String;

.field private optionalMetadata:Ljava/lang/String;

.field public parentHref:Ljava/net/URI;

.field public type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 6
    .param p1, "assetFile"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->GUID:Ljava/lang/String;

    .line 40
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getHref()Ljava/net/URI;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->href:Ljava/net/URI;

    .line 41
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getParentHref()Ljava/net/URI;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->parentHref:Ljava/net/URI;

    .line 42
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getEtag()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->etag:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->name:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getCreationDate()Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->creationDate:Ljava/util/Date;

    .line 45
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getModificationDate()Ljava/util/Date;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->modificationDate:Ljava/util/Date;

    .line 46
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->type:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getMd5Hash()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->md5Hash:Ljava/lang/String;

    .line 48
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getFileSize()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->fileSize:J

    .line 49
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getCurrentVersion()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->currentVersion:I

    .line 50
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    if-eqz v1, :cond_65

    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->getHlsHref()Ljava/lang/String;

    move-result-object v1

    :goto_50
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->hlsHref:Ljava/lang/String;

    .line 51
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v0

    .line 52
    .local v0, "optionalData":Lorg/json/JSONObject;
    if-eqz v0, :cond_5e

    .line 54
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->optionalMetadata:Ljava/lang/String;

    .line 56
    :cond_5e
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 57
    return-void

    .line 50
    .end local v0    # "optionalData":Lorg/json/JSONObject;
    :cond_65
    const/4 v1, 0x0

    goto :goto_50
.end method


# virtual methods
.method public getOptionalMetadata()Lorg/json/JSONObject;
    .registers 4

    .prologue
    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "result":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->optionalMetadata:Ljava/lang/String;

    if-nez v2, :cond_7

    move-object v1, v0

    .line 136
    .end local v0    # "result":Lorg/json/JSONObject;
    .local v1, "result":Lorg/json/JSONObject;
    :goto_6
    return-object v1

    .line 130
    .end local v1    # "result":Lorg/json/JSONObject;
    .restart local v0    # "result":Lorg/json/JSONObject;
    :cond_7
    :try_start_7
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;->optionalMetadata:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_e} :catch_11

    .end local v0    # "result":Lorg/json/JSONObject;
    .restart local v1    # "result":Lorg/json/JSONObject;
    move-object v0, v1

    .end local v1    # "result":Lorg/json/JSONObject;
    .restart local v0    # "result":Lorg/json/JSONObject;
    :goto_f
    move-object v1, v0

    .line 136
    .end local v0    # "result":Lorg/json/JSONObject;
    .restart local v1    # "result":Lorg/json/JSONObject;
    goto :goto_6

    .line 132
    .end local v1    # "result":Lorg/json/JSONObject;
    .restart local v0    # "result":Lorg/json/JSONObject;
    :catch_11
    move-exception v2

    goto :goto_f
.end method
