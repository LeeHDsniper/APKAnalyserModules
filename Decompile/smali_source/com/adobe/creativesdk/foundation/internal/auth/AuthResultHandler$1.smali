.class Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;
.super Ljava/lang/Object;
.source "AdobeAuthSignInActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->createImsClientCommon()Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 230
    return-void
.end method

.method public onInfoNeeded(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;)V
    .registers 4
    .param p1, "info"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSInfoNeeded;

    .prologue
    .line 234
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_USER_CANCELLED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    .line 235
    .local v0, "error":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 236
    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "adobeId"    # Ljava/lang/String;
    .param p2, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 223
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleImsAccountResult(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AuthResultHandler;->handleResultFromIMS(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 225
    return-void
.end method
