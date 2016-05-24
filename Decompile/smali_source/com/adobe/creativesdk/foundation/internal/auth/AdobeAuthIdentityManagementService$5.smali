.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenWithAuthCode(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

.field final synthetic val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .prologue
    .line 528
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 540
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 541
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 5
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 531
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_e

    .line 532
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 536
    :goto_d
    return-void

    .line 534
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$5;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorBadRequest:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_d
.end method
