.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrUtils;
.super Ljava/lang/Object;
.source "AdobeCollaborationErrUtils.java"


# direct methods
.method public static createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    .registers 6
    .param p0, "errorCode"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;
    .param p1, "details"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 20
    if-eqz p1, :cond_13

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .local v0, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "ADOBE_ASSET_DETAILS_STRING_KEY"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    invoke-direct {v1, p0, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 27
    .end local v0    # "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_12
    return-object v1

    :cond_13
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    invoke-direct {v1, p0, v2, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    goto :goto_12
.end method

.method public static createCollaborationError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/net/URL;Ljava/lang/Object;ILjava/lang/Object;)Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    .registers 9
    .param p0, "code"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "data"    # Ljava/lang/Object;
    .param p3, "status"    # I
    .param p4, "headers"    # Ljava/lang/Object;

    .prologue
    .line 32
    if-nez p2, :cond_4

    .line 33
    const-string p2, "[no data]"

    .line 35
    .end local p2    # "data":Ljava/lang/Object;
    :cond_4
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 36
    .local v1, "userDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 38
    .local v0, "assetError":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    if-eqz p1, :cond_11

    .line 39
    const-string v2, "AdobeAssetRequestURLString"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_11
    const-string v2, "AdobeNetworkHTTPStatus"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    const-string v2, "AdobeAssetResponseData"

    invoke-virtual {v1, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    if-eqz p4, :cond_26

    .line 44
    const-string v2, "AdobeAssetResponseHeaders"

    invoke-virtual {v1, v2, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    :cond_26
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    .end local v0    # "assetError":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationErrorCode;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 48
    .restart local v0    # "assetError":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;
    return-object v0
.end method
