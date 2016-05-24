.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthTokenCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signInWithDeviceToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

.field final synthetic val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

.field final synthetic val$deviceToken:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .prologue
    .line 689
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$deviceToken:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 733
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->createAuthError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;
    invoke-static {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->access$200(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 734
    return-void
.end method

.method public onInvalidClientId()V
    .registers 4

    .prologue
    .line 743
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 744
    return-void
.end method

.method public onInvalidClientSecret()V
    .registers 4

    .prologue
    .line 748
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_CLIENT_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 749
    return-void
.end method

.method public onInvalidDeviceId()V
    .registers 4

    .prologue
    .line 738
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    new-instance v1, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_DEVICE_ID_REQUIRED:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V

    .line 739
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 11
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 694
    :try_start_0
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;-><init>(Ljava/lang/String;)V

    .line 695
    .local v5, "responseJSON":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
    const-string v6, "userId"

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 696
    .local v1, "adobeId":Ljava/lang/String;
    const-string v6, "access_token"

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 697
    .local v0, "accessToken":Ljava/lang/String;
    const/4 v4, 0x0

    .line 698
    .local v4, "errorResponse":Ljava/lang/String;
    const-string v6, "error"

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_24

    .line 699
    const-string v6, "error"

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 701
    :cond_24
    if-eqz v0, :cond_43

    .line 702
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    const/4 v7, 0x1

    invoke-virtual {v6, v5, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->parseResponse(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;Z)V

    .line 703
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$deviceToken:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->setDeviceToken(Ljava/lang/String;)V

    .line 705
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8$1;

    invoke-direct {v7, p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8$2;

    invoke-direct {v8, p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;Ljava/lang/String;Ljava/lang/String;)V

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->profileFromServiceWithAccessToken(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V
    invoke-static {v6, v0, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->access$000(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;)V

    .line 729
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "adobeId":Ljava/lang/String;
    .end local v4    # "errorResponse":Ljava/lang/String;
    .end local v5    # "responseJSON":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
    :cond_42
    :goto_42
    return-void

    .line 718
    .restart local v0    # "accessToken":Ljava/lang/String;
    .restart local v1    # "adobeId":Ljava/lang/String;
    .restart local v4    # "errorResponse":Ljava/lang/String;
    .restart local v5    # "responseJSON":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
    :cond_43
    if-eqz v4, :cond_42

    .line 719
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 720
    .local v2, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "info"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 721
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    new-instance v7, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;

    sget-object v8, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;->ADOBE_AUTH_ERROR_CODE_UNKNOWN_ERROR:Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;

    invoke-direct {v7, v8, v2}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthErrorCode;Ljava/util/HashMap;)V

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onError(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthException;)V
    :try_end_63
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_63} :catch_64

    goto :goto_42

    .line 724
    .end local v0    # "accessToken":Ljava/lang/String;
    .end local v1    # "adobeId":Ljava/lang/String;
    .end local v2    # "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "errorResponse":Ljava/lang/String;
    .end local v5    # "responseJSON":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeJSONObject;
    :catch_64
    move-exception v3

    .line 725
    .local v3, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v7, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error in parsing response for access token"

    invoke-static {v6, v7, v8, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 726
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$8;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->onJSONException(Lorg/json/JSONException;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V
    invoke-static {v6, v3, v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->access$100(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lorg/json/JSONException;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;)V

    goto :goto_42
.end method
