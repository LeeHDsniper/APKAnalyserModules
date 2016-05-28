.class Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;
.super Lcom/facebook/AuthorizationClient$KatanaAuthHandler;
.source "AuthorizationClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "KatanaProxyAuthHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private applicationId:Ljava/lang/String;

.field final synthetic this$0:Lcom/facebook/AuthorizationClient;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;)V
    .registers 2

    .prologue
    .line 802
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-direct {p0, p1}, Lcom/facebook/AuthorizationClient$KatanaAuthHandler;-><init>(Lcom/facebook/AuthorizationClient;)V

    return-void
.end method

.method private handleResultOk(Landroid/content/Intent;)Lcom/facebook/AuthorizationClient$Result;
    .registers 11
    .param p1, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 849
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    .line 850
    .local v4, "extras":Landroid/os/Bundle;
    const-string v7, "error"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 851
    .local v1, "error":Ljava/lang/String;
    if-nez v1, :cond_13

    .line 852
    const-string v7, "error_type"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 854
    :cond_13
    const-string v7, "error_code"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 855
    .local v2, "errorCode":Ljava/lang/String;
    const-string v7, "error_message"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 856
    .local v3, "errorMessage":Ljava/lang/String;
    if-nez v3, :cond_27

    .line 857
    const-string v7, "error_description"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 860
    :cond_27
    const-string v7, "e2e"

    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 861
    .local v0, "e2e":Ljava/lang/String;
    invoke-static {v0}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3a

    .line 862
    iget-object v7, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v8, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->applicationId:Ljava/lang/String;

    # invokes: Lcom/facebook/AuthorizationClient;->logWebLoginCompleted(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v7, v8, v0}, Lcom/facebook/AuthorizationClient;->access$1(Lcom/facebook/AuthorizationClient;Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    :cond_3a
    if-nez v1, :cond_57

    if-nez v2, :cond_57

    if-nez v3, :cond_57

    .line 866
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-virtual {v6}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v6

    .line 867
    sget-object v7, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_WEB:Lcom/facebook/AccessTokenSource;

    .line 866
    invoke-static {v6, v4, v7}, Lcom/facebook/AccessToken;->createFromWebBundle(Ljava/util/List;Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v5

    .line 868
    .local v5, "token":Lcom/facebook/AccessToken;
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v6, v5}, Lcom/facebook/AuthorizationClient$Result;->createTokenResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AccessToken;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v6

    .line 874
    .end local v5    # "token":Lcom/facebook/AccessToken;
    :cond_56
    :goto_56
    return-object v6

    .line 869
    :cond_57
    sget-object v7, Lcom/facebook/internal/ServerProtocol;->errorsProxyAuthDisabled:Ljava/util/Collection;

    invoke-interface {v7, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_56

    .line 871
    sget-object v7, Lcom/facebook/internal/ServerProtocol;->errorsUserCanceled:Ljava/util/Collection;

    invoke-interface {v7, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_70

    .line 872
    iget-object v7, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v7, v7, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v7, v6}, Lcom/facebook/AuthorizationClient$Result;->createCancelResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v6

    goto :goto_56

    .line 874
    :cond_70
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v6, v1, v3, v2}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v6

    goto :goto_56
.end method


# virtual methods
.method getNameForLogging()Ljava/lang/String;
    .registers 2

    .prologue
    .line 808
    const-string v0, "katana_proxy_auth"

    return-object v0
.end method

.method onActivityResult(IILandroid/content/Intent;)Z
    .registers 8
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 829
    if-nez p3, :cond_15

    .line 831
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v1, v1, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v2, "Operation canceled"

    invoke-static {v1, v2}, Lcom/facebook/AuthorizationClient$Result;->createCancelResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v0

    .line 840
    .local v0, "outcome":Lcom/facebook/AuthorizationClient$Result;
    :goto_c
    if-eqz v0, :cond_3a

    .line 841
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v1, v0}, Lcom/facebook/AuthorizationClient;->completeAndValidate(Lcom/facebook/AuthorizationClient$Result;)V

    .line 845
    :goto_13
    const/4 v1, 0x1

    return v1

    .line 832
    .end local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    :cond_15
    if-nez p2, :cond_26

    .line 833
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v1, v1, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v2, "error"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/AuthorizationClient$Result;->createCancelResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v0

    .line 834
    .restart local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    goto :goto_c

    .end local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    :cond_26
    const/4 v1, -0x1

    if-eq p2, v1, :cond_35

    .line 835
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v1, v1, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v2, "Unexpected resultCode from authorization."

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v0

    .line 836
    .restart local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    goto :goto_c

    .line 837
    .end local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    :cond_35
    invoke-direct {p0, p3}, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->handleResultOk(Landroid/content/Intent;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v0

    .restart local v0    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    goto :goto_c

    .line 843
    :cond_3a
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v1}, Lcom/facebook/AuthorizationClient;->tryNextHandler()V

    goto :goto_13
.end method

.method tryAuthorize(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)Z
    .registers 9
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    .prologue
    .line 813
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getApplicationId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->applicationId:Ljava/lang/String;

    .line 815
    # invokes: Lcom/facebook/AuthorizationClient;->getE2E()Ljava/lang/String;
    invoke-static {}, Lcom/facebook/AuthorizationClient;->access$0()Ljava/lang/String;

    move-result-object v3

    .line 816
    .local v3, "e2e":Ljava/lang/String;
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v0, v0, Lcom/facebook/AuthorizationClient;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    .line 817
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->isRerequest()Z

    move-result v4

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getDefaultAudience()Lcom/facebook/SessionDefaultAudience;

    move-result-object v5

    .line 816
    invoke-static/range {v0 .. v5}, Lcom/facebook/internal/NativeProtocol;->createProxyAuthIntent(Landroid/content/Context;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;ZLcom/facebook/SessionDefaultAudience;)Landroid/content/Intent;

    move-result-object v6

    .line 819
    .local v6, "intent":Landroid/content/Intent;
    const-string v0, "e2e"

    invoke-virtual {p0, v0, v3}, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 821
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getRequestCode()I

    move-result v0

    invoke-virtual {p0, v6, v0}, Lcom/facebook/AuthorizationClient$KatanaProxyAuthHandler;->tryIntent(Landroid/content/Intent;I)Z

    move-result v0

    return v0
.end method
