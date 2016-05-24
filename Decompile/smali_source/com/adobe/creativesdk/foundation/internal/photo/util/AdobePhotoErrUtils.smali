.class public Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoErrUtils;
.super Ljava/lang/Object;
.source "AdobePhotoErrUtils.java"


# direct methods
.method public static createPhotoError(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    .registers 9
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "status"    # I
    .param p4, "headers"    # Ljava/lang/Object;

    .prologue
    .line 18
    if-nez p2, :cond_4

    .line 19
    const-string p2, "[no data]"

    .line 21
    .end local p2    # "data":Ljava/lang/Object;
    :cond_4
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 22
    .local v1, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 24
    .local v0, "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    if-eqz p1, :cond_11

    .line 25
    const-string v2, "AdobeAssetRequestURLString"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    :cond_11
    const-string v2, "AdobeNetworkHTTPStatus"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v2, "AdobeAssetResponseData"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    if-eqz p4, :cond_26

    .line 30
    const-string v2, "AdobeAssetResponseHeaders"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_26
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;

    .end local v0    # "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 34
    .restart local v0    # "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoException;
    return-object v0
.end method
