.class public Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.source "AdobeNetworkException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    }
.end annotation


# instance fields
.field private final errorCode:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V
    .registers 3
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .prologue
    const/4 v0, 0x0

    .line 129
    invoke-direct {p0, p1, v0, v0}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 130
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;)V
    .registers 4
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 125
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;Ljava/util/HashMap;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    .param p3, "cause"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;",
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
    .line 120
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;-><init>(Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 121
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->errorCode:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    .line 122
    return-void
.end method

.method public static getKeyForResponse()Ljava/lang/String;
    .registers 1

    .prologue
    .line 140
    const-string v0, "Response"

    return-object v0
.end method


# virtual methods
.method public getErrorCode()Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->errorCode:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    return-object v0
.end method

.method public getStatusCode()Ljava/lang/Integer;
    .registers 4

    .prologue
    .line 133
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->_data:Ljava/util/HashMap;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->_data:Ljava/util/HashMap;

    const-string v2, "Response"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 134
    :cond_e
    const/4 v1, 0x0

    .line 136
    :goto_f
    return-object v1

    .line 135
    :cond_10
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;->_data:Ljava/util/HashMap;

    const-string v2, "Response"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .line 136
    .local v0, "response":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_f
.end method
