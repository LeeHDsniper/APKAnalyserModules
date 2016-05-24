.class Lcom/facebook/AuthorizationClient$AuthDialogBuilder;
.super Lcom/facebook/widget/WebDialog$Builder;
.source "AuthorizationClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AuthDialogBuilder"
.end annotation


# instance fields
.field private e2e:Ljava/lang/String;

.field private isRerequest:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "applicationId"    # Ljava/lang/String;
    .param p3, "parameters"    # Landroid/os/Bundle;

    .prologue
    .line 906
    const-string v0, "oauth"

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/facebook/widget/WebDialog$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 907
    return-void
.end method


# virtual methods
.method public build()Lcom/facebook/widget/WebDialog;
    .registers 7

    .prologue
    .line 921
    invoke-virtual {p0}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->getParameters()Landroid/os/Bundle;

    move-result-object v3

    .line 922
    .local v3, "parameters":Landroid/os/Bundle;
    const-string v0, "redirect_uri"

    const-string v1, "fbconnect://success"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 923
    const-string v0, "client_id"

    invoke-virtual {p0}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 924
    const-string v0, "e2e"

    iget-object v1, p0, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->e2e:Ljava/lang/String;

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    const-string v0, "response_type"

    const-string v1, "token"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 926
    const-string v0, "return_scopes"

    const-string v1, "true"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    iget-boolean v0, p0, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->isRerequest:Z

    if-eqz v0, :cond_3a

    invoke-static {}, Lcom/facebook/Settings;->getPlatformCompatibilityEnabled()Z

    move-result v0

    if-nez v0, :cond_3a

    .line 930
    const-string v0, "auth_type"

    const-string v1, "rerequest"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 933
    :cond_3a
    new-instance v0, Lcom/facebook/widget/WebDialog;

    invoke-virtual {p0}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "oauth"

    invoke-virtual {p0}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->getTheme()I

    move-result v4

    invoke-virtual {p0}, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->getListener()Lcom/facebook/widget/WebDialog$OnCompleteListener;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/facebook/widget/WebDialog;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;ILcom/facebook/widget/WebDialog$OnCompleteListener;)V

    return-object v0
.end method

.method public setE2E(Ljava/lang/String;)Lcom/facebook/AuthorizationClient$AuthDialogBuilder;
    .registers 2
    .param p1, "e2e"    # Ljava/lang/String;

    .prologue
    .line 910
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->e2e:Ljava/lang/String;

    .line 911
    return-object p0
.end method

.method public setIsRerequest(Z)Lcom/facebook/AuthorizationClient$AuthDialogBuilder;
    .registers 2
    .param p1, "isRerequest"    # Z

    .prologue
    .line 915
    iput-boolean p1, p0, Lcom/facebook/AuthorizationClient$AuthDialogBuilder;->isRerequest:Z

    .line 916
    return-object p0
.end method
