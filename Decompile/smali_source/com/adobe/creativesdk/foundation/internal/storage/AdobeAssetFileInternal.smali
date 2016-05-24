.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
.source "AdobeAssetFileInternal.java"


# instance fields
.field public _videDuration:I

.field public hlsHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 3
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "parentCollection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 43
    return-void
.end method


# virtual methods
.method public canStreamVideo()Z
    .registers 4

    .prologue
    .line 63
    const/4 v0, 0x0

    .line 64
    .local v0, "result":Z
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    if-eqz v2, :cond_f

    .line 68
    :try_start_5
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_c} :catch_12

    .line 69
    .local v1, "url":Ljava/net/URL;
    if-eqz v1, :cond_10

    const/4 v0, 0x1

    .line 75
    .end local v1    # "url":Ljava/net/URL;
    :cond_f
    :goto_f
    return v0

    .line 69
    .restart local v1    # "url":Ljava/net/URL;
    :cond_10
    const/4 v0, 0x0

    goto :goto_f

    .line 70
    .end local v1    # "url":Ljava/net/URL;
    :catch_12
    move-exception v2

    goto :goto_f
.end method

.method public getHlsHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->hlsHref:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoDuration()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->_videDuration:I

    return v0
.end method
