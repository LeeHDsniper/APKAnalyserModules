.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageErrorUtils;
.super Ljava/lang/Object;
.source "AdobeStorageErrorUtils.java"


# direct methods
.method public static createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
    .registers 4
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 81
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V

    return-object v0
.end method

.method public static createDCXError(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/lang/Exception;)Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;
    .registers 4
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "underlyingCause"    # Ljava/lang/Exception;

    .prologue
    .line 85
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V

    return-object v0
.end method

.method public static createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 5
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .param p1, "details"    # Ljava/lang/String;

    .prologue
    .line 56
    if-eqz p1, :cond_13

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 58
    .local v0, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "ADOBE_ASSET_DETAILS_STRING_KEY"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 62
    .end local v0    # "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_12
    return-object v1

    :cond_13
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;)V

    goto :goto_12
.end method

.method public static createStorageError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    .registers 9
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "status"    # I
    .param p4, "headers"    # Ljava/lang/Object;

    .prologue
    .line 36
    if-nez p2, :cond_4

    .line 37
    const-string p2, "[no data]"

    .line 39
    .end local p2    # "data":Ljava/lang/Object;
    :cond_4
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 40
    .local v1, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 42
    .local v0, "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    if-eqz p1, :cond_11

    .line 43
    const-string v2, "AdobeAssetRequestURLString"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    :cond_11
    const-string v2, "AdobeNetworkHTTPStatus"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v2, "AdobeAssetResponseData"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    if-eqz p4, :cond_26

    .line 48
    const-string v2, "AdobeAssetResponseHeaders"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_26
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .end local v0    # "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 52
    .restart local v0    # "assetError":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
    return-object v0
.end method
