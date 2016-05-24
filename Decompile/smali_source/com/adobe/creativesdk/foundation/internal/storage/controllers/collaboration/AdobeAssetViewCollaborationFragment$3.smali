.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;
.super Ljava/lang/Object;
.source "AdobeAssetViewCollaborationFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->refreshListDueToSwipe()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;)V
    .registers 9
    .param p1, "collaborations"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;

    .prologue
    const/4 v6, 0x1

    .line 275
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z
    invoke-static {v4, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$302(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;Z)Z

    .line 276
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 277
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->hideProgress()V
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    .line 278
    if-eqz p1, :cond_21

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->getCollaboratorsAndInvites()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_61

    .line 280
    :cond_21
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .local v2, "ownerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;-><init>()V

    .line 282
    .local v1, "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    .line 283
    .local v0, "adobeUXAuthManagerRestricted":Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v3

    .line 284
    .local v3, "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getEmail()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setEmail(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setName(Ljava/lang/String;)V

    .line 286
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getAdobeID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setUserId(Ljava/lang/String;)V

    .line 287
    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->setOwner(Z)V

    .line 288
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->setCollaboratorsList(Ljava/util/ArrayList;)V

    .line 293
    .end local v0    # "adobeUXAuthManagerRestricted":Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;
    .end local v1    # "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
    .end local v2    # "ownerList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;>;"
    .end local v3    # "userProfile":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    :goto_57
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->refreshDueToDataChange()V

    .line 294
    return-void

    .line 292
    :cond_61
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    move-result-object v4

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboration;->getCollaboratorsAndInvites()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->setCollaboratorsList(Ljava/util/ArrayList;)V

    goto :goto_57
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;)V
    .registers 4
    .param p1, "exception"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationException;

    .prologue
    const/4 v1, 0x0

    .line 298
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 299
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$302(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;Z)Z

    .line 300
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->wentOffline()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    .line 301
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->hideProgress()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    .line 310
    :goto_1a
    return-void

    .line 305
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$302(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;Z)Z

    .line 306
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->hideProgress()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    .line 307
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->showErrorScreen()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    goto :goto_1a
.end method
