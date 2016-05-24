.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessTokenWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;)V
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
    .line 578
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 586
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 587
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 581
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$6;->val$completionHandler:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    .line 582
    return-void
.end method
