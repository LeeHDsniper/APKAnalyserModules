.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;

.field final synthetic val$accessToken:Ljava/lang/String;

.field final synthetic val$adobeID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->val$adobeID:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->val$accessToken:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 190
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->onCompletion(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onCompletion(Lorg/json/JSONObject;)V
    .registers 5
    .param p1, "requestResult"    # Lorg/json/JSONObject;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1;->val$callbackClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->val$adobeID:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$1$1;->val$accessToken:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onSuccess(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    return-void
.end method
