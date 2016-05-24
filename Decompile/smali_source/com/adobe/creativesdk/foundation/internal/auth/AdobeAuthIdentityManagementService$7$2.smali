.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;->onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;

.field final synthetic val$finalAccessToken:Ljava/lang/String;

.field final synthetic val$finalAdobeID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;

    .prologue
    .line 638
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->val$finalAdobeID:Ljava/lang/String;

    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->val$finalAccessToken:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    .prologue
    .line 641
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->this$1:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7;->val$client:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->val$finalAdobeID:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->val$finalAccessToken:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignInClient;->onSuccess(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 638
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$7$2;->onError(Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;)V

    return-void
.end method
