.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeCollaborationListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CollaborationListViewBaseAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 239
    return-void
.end method


# virtual methods
.method public disableDataViewAndShowProgress()V
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;->disableDataView()V

    .line 255
    return-void
.end method

.method public enableDataView()V
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;->enableDataView()V

    .line 261
    return-void
.end method

.method public getActivityContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;->getHostActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    return-object v0
.end method

.method protected getCollaborationItemData(I)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 293
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->getCollaborationItem(I)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;

    move-result-object v0

    return-object v0
.end method

.method protected getCollaboratorsCount()I
    .registers 2

    .prologue
    .line 289
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->collaboratorsList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->getCollaboratorsCount()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 368
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->getCollaboratorTypeFromPosition(I)I
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;I)I

    move-result v0

    return v0
.end method

.method public getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 1

    .prologue
    .line 354
    return-object p0
.end method

.method public getToken()I
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_deleteToken:I
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)I

    move-result v0

    return v0
.end method

.method protected handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;I)V
    .registers 5
    .param p1, "cellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
    .param p2, "collaborator"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    .param p3, "position"    # I

    .prologue
    .line 373
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;->isInvite()Z

    move-result v0

    if-nez v0, :cond_f

    .line 374
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    .end local p1    # "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;
    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;

    .end local p2    # "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->loadAndDisplayThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;I)V

    .line 375
    :cond_f
    return-void
.end method

.method public handleSelfDelete()V
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->handleCollaboratorSelfDelete()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)V

    .line 305
    return-void
.end method

.method protected invalidateAssetsList()V
    .registers 1

    .prologue
    .line 350
    return-void
.end method

.method public isOnline()Z
    .registers 2

    .prologue
    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->online:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Z

    move-result v0

    return v0
.end method

.method public markDataSetChanged()V
    .registers 2

    .prologue
    .line 357
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->getRealAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 358
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 11
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 309
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->getCollaborationItemData(I)Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;

    move-result-object v2

    .local v2, "collaborationInvite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;
    move-object v6, p1

    .line 310
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->prepareForReuse()V

    move-object v6, p1

    .line 311
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v6

    invoke-virtual {v6, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->setPosition(I)V

    move-object v6, p1

    .line 312
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v7

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_deleteToken:I
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)I

    move-result v6

    if-ne v6, p2, :cond_42

    const/4 v6, 0x1

    :goto_28
    invoke-virtual {v7, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->setDeleteVisibility(Z)V

    move-object v6, p1

    .line 313
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v6

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->isOnline()Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;->setEnabled(Z)V

    move-object v6, p1

    .line 315
    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    iget v6, v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->viewTypeId:I

    packed-switch v6, :pswitch_data_92

    .line 335
    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_41
    return-void

    .line 312
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_42
    const/4 v6, 0x0

    goto :goto_28

    :pswitch_44
    move-object v5, v2

    .line 318
    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;

    .line 319
    .local v5, "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;

    .line 320
    .local v0, "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getInviteID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->setInviteId(Ljava/lang/String;)V

    .line 321
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;->getEmail()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->setName(Ljava/lang/String;)V

    .line 322
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;->setInviteProfilePicture()V

    goto :goto_41

    .end local v0    # "cellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeInvitationCellView;
    .end local v5    # "invite":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;
    .restart local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :pswitch_61
    move-object v3, v2

    .line 325
    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;

    .line 326
    .local v3, "collaborator":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;->getCellView()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;

    .line 327
    .local v1, "collaborationCellView":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->getUserID()Ljava/lang/String;

    move-result-object v4

    .line 328
    .local v4, "id":Ljava/lang/String;
    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setID(Ljava/lang/String;)V

    .line 329
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->getSelfID()Ljava/lang/String;
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setSelf(Z)V

    .line 330
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->isOwner()Z

    move-result v6

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setOwner(Z)V

    .line 331
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborator;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationCellView;->setName(Ljava/lang/String;)V

    .line 332
    invoke-virtual {p0, v1, v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->handlePostCellViewBinding(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationGenericCellView;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;I)V

    goto :goto_41

    .line 315
    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_61
        :pswitch_44
    .end packed-switch
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 339
    .line 340
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_collaboration_list_view:I

    const/4 v3, 0x0

    .line 341
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 344
    .local v0, "itemView":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;

    invoke-direct {v1, p0, v0, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter$CellViewHolder;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;Landroid/view/View;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationCellViewDelegate;I)V

    return-object v1
.end method

.method public removeView(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 298
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->removeViewAndRefresh(I)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;I)V

    .line 300
    return-void
.end method

.method public setToken(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # setter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_deleteToken:I
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$202(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;I)I

    .line 272
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->_deleteToken:I
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_14

    .line 274
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->showAddCollaboratorIcon()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)V

    .line 280
    :goto_13
    return-void

    .line 278
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController$CollaborationListViewBaseAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->hideAddCollaboratorIcon()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;)V

    goto :goto_13
.end method
