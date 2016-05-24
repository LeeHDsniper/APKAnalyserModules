.class public Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKPublishProjectHeadlessFragment.java"

# interfaces
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKCopyrightSettingsDialog$Callbacks;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKCreativeFieldsFilterDialog$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

.field private getFacebookUserIdInProgress:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->getFacebookUserIdInProgress:Z

    .line 37
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->setRetainInstance(Z)V

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    return-object v0
.end method


# virtual methods
.method public loadFacebookUserId(Lcom/facebook/Session;)V
    .registers 5
    .param p1, "activeSession"    # Lcom/facebook/Session;

    .prologue
    const/4 v2, 0x1

    .line 53
    invoke-virtual {p0, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->setGetFacebookUserIdInProgress(Z)V

    .line 54
    new-instance v1, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$1;

    invoke-direct {v1, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$1;-><init>(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;)V

    invoke-static {p1, v1}, Lcom/facebook/Request;->newMeRequest(Lcom/facebook/Session;Lcom/facebook/Request$GraphUserCallback;)Lcom/facebook/Request;

    move-result-object v0

    .line 67
    .local v0, "meRequest":Lcom/facebook/Request;
    new-array v1, v2, [Lcom/facebook/Request;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Lcom/facebook/Request;->executeBatchAsync([Lcom/facebook/Request;)Lcom/facebook/RequestAsyncTask;

    .line 68
    return-void
.end method

.method public onCopyrightSettingSelected(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 3
    .param p1, "copyRightSetting"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    if-eqz v0, :cond_9

    .line 49
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;->onCopyrightSettingSelected(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V

    .line 50
    :cond_9
    return-void
.end method

.method public onCreativeFieldsSelected(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "selectedFields":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    if-eqz v0, :cond_9

    .line 43
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;->onCreativeFieldsSelected(Ljava/util/List;)V

    .line 44
    :cond_9
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment$Callbacks;

    .line 34
    return-void
.end method

.method public setGetFacebookUserIdInProgress(Z)V
    .registers 2
    .param p1, "getFacebookUserIdInProgress"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishProjectHeadlessFragment;->getFacebookUserIdInProgress:Z

    .line 76
    return-void
.end method
