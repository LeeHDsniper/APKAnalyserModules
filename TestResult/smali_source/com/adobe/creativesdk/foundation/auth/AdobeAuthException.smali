.class public final Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
.super Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
.source "AdobeAuthException.java"


# instance fields
.field private final errorCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V
    .registers 3
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;Ljava/util/HashMap;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;Ljava/util/HashMap;)V
    .registers 3
    .param p1, "errorCode"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;-><init>(Ljava/util/HashMap;)V

    .line 40
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->errorCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    .line 41
    return-void
.end method


# virtual methods
.method public getErrorCode()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;->errorCode:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    return-object v0
.end method
