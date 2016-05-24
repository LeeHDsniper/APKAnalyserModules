.class Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;
.super Ljava/lang/Object;
.source "AdobeAuthIdentityManagementService.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->signOut(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

.field final synthetic val$signoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    .prologue
    .line 798
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->val$signoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 4
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 811
    const-string v0, "Logout Failure"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->val$signoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;->onSuccess()V

    .line 814
    return-void
.end method

.method public onSuccess(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 802
    const-string v0, "Logout Success"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->this$0:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAdobeID()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAuthStep(Ljava/lang/String;Ljava/lang/String;)V

    .line 805
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService$9;->val$signoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthIMSSignOutClient;->onSuccess()V

    .line 806
    return-void
.end method
