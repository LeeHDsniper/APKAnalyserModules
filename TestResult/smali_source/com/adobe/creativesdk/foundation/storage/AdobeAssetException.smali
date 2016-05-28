.class public final Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.source "AdobeAssetException.java"


# instance fields
.field private final errorCode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;)V
    .registers 3
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1, v0, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;)V
    .registers 4
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .param p3, "cause"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;-><init>(Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 43
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->errorCode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    .line 44
    return-void
.end method


# virtual methods
.method public getErrorCode()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->errorCode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetErrorCode;

    return-object v0
.end method

.method public getHttpStatusCode()Ljava/lang/Integer;
    .registers 3

    .prologue
    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->_data:Ljava/util/HashMap;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->_data:Ljava/util/HashMap;

    const-string v1, "AdobeNetworkHTTPStatus"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 83
    :cond_e
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 84
    :goto_13
    return-object v0

    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;->_data:Ljava/util/HashMap;

    const-string v1, "AdobeNetworkHTTPStatus"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    goto :goto_13
.end method
