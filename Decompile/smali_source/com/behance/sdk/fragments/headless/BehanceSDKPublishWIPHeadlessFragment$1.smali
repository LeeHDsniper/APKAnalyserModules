.class Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPHeadlessFragment.java"

# interfaces
.implements Lcom/facebook/Request$GraphUserCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->loadFacebookUserId(Lcom/facebook/Session;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;


# direct methods
.method constructor <init>(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/model/GraphUser;Lcom/facebook/Response;)V
    .registers 5
    .param p1, "user"    # Lcom/facebook/model/GraphUser;
    .param p2, "response"    # Lcom/facebook/Response;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->setGetFacebookUserIdInProgress(Z)V

    .line 124
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    # getter for: Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
    invoke-static {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    move-result-object v0

    if-eqz v0, :cond_1d

    .line 125
    if-eqz p1, :cond_1e

    .line 126
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    # getter for: Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
    invoke-static {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    move-result-object v0

    invoke-interface {p1}, Lcom/facebook/model/GraphUser;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;->onGetFacebookUserIdComplete(Ljava/lang/String;)V

    .line 131
    :cond_1d
    :goto_1d
    return-void

    .line 128
    :cond_1e
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$1;->this$0:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;

    # getter for: Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;
    invoke-static {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;->access$000(Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment;)Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKPublishWIPHeadlessFragment$Callbacks;->onGetFacebookUserIdComplete(Ljava/lang/String;)V

    goto :goto_1d
.end method
