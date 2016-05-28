.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeAssetViewCollaborationFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$5;
    }
.end annotation


# instance fields
.field private ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

.field private _addCollaboratorButton:Landroid/view/View;

.field private _commonPopUpBannerView:Landroid/view/View;

.field private _commonPopUpErrorView:Landroid/view/View;

.field private _dataView:Landroid/view/View;

.field _fragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;

.field private _network_reachability_observer:Ljava/util/Observer;

.field private _progressBar:Landroid/widget/ProgressBar;

.field private _rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

.field private _targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

.field private collaboratorInvitation:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;",
            ">;"
        }
    .end annotation
.end field

.field private dataViewLoaded:Z

.field private folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

.field private listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

.field private shadowVisible:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->collaboratorInvitation:Ljava/util/ArrayList;

    .line 52
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->shadowVisible:Z

    .line 61
    const-string v0, "ASSET_VIEW_COLLABORATION_FOLDER_HREF"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

    .line 412
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->handleAddCollaboratorClick()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->wentOnline()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->wentOffline()V

    return-void
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z

    return p1
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->hideProgress()V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->showErrorScreen()V

    return-void
.end method

.method private getFolderFromHref(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 6
    .param p1, "folderHref"    # Ljava/lang/String;

    .prologue
    .line 391
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->hrefByRemovingPathExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 392
    const/4 v2, 0x0

    .line 394
    .local v2, "folderURI":Ljava/net/URI;
    :try_start_5
    new-instance v3, Ljava/net/URI;

    invoke-direct {v3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_a} :catch_10

    .end local v2    # "folderURI":Ljava/net/URI;
    .local v3, "folderURI":Ljava/net/URI;
    move-object v2, v3

    .line 398
    .end local v3    # "folderURI":Ljava/net/URI;
    .restart local v2    # "folderURI":Ljava/net/URI;
    :goto_b
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getFolderFromHref(Ljava/net/URI;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    .line 399
    .local v0, "collaboratedFolder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    return-object v0

    .line 395
    .end local v0    # "collaboratedFolder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :catch_10
    move-exception v1

    .line 396
    .local v1, "e":Ljava/net/URISyntaxException;
    invoke-virtual {v1}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_b
.end method

.method private handleAddCollaboratorClick()V
    .registers 6

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 356
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 357
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$4;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    .line 376
    .local v3, "newInviteObserver":Ljava/util/Observer;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;-><init>()V

    .line 377
    .local v2, "newFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v4

    invoke-virtual {v2, v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setFolderAndObserver(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Ljava/util/Observer;)V

    .line 378
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->getCollaboratorsList()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->setCollaboratorsList(Ljava/util/ArrayList;)V

    .line 379
    const-string v4, "Collaborate"

    invoke-virtual {v2, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationInviteDialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 380
    return-void
.end method

.method private hideProgress()V
    .registers 3

    .prologue
    .line 255
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 256
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 257
    return-void
.end method

.method private hrefByRemovingPathExtension(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "hrefString"    # Ljava/lang/String;

    .prologue
    .line 403
    const-string v0, "/files"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 404
    :cond_8
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setupListView(Landroid/view/View;)V
    .registers 5
    .param p1, "mainView"    # Landroid/view/View;

    .prologue
    .line 343
    move-object v0, p1

    .line 344
    .local v0, "rootView":Landroid/view/View;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->setMainRootView(Landroid/view/View;)V

    .line 345
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->setParentContainer(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationContainerListViewDelegate;)V

    .line 349
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->collaboratorInvitation:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->setCollaboratorsList(Ljava/util/ArrayList;)V

    .line 350
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->getHostActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->performInitialization(Landroid/content/Context;)V

    .line 352
    return-void
.end method

.method private showErrorScreen()V
    .registers 5

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 317
    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z

    if-nez v1, :cond_23

    .line 320
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 321
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 322
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_common_view_error_message:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 323
    .local v0, "errorText":Landroid/widget/TextView;
    if-eqz v0, :cond_22

    .line 325
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaboration_error:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 338
    .end local v0    # "errorText":Landroid/widget/TextView;
    :cond_22
    :goto_22
    return-void

    .line 331
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 332
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 333
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    if-eqz v1, :cond_22

    .line 334
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->handleNetworkOffline()V

    goto :goto_22
.end method

.method private showProgress()V
    .registers 3

    .prologue
    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 252
    return-void
.end method

.method private wentOffline()V
    .registers 4

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 223
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z

    if-nez v0, :cond_1b

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 235
    :goto_11
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    if-eqz v0, :cond_1a

    .line 236
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->handleNetworkOffline()V

    .line 237
    :cond_1a
    return-void

    .line 232
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_11
.end method

.method private wentOnline()V
    .registers 3

    .prologue
    const/16 v1, 0x8

    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 243
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->refreshListDueToSwipe()V

    .line 244
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    if-eqz v0, :cond_18

    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->handleNetworkOnline()V

    .line 247
    :cond_18
    return-void
.end method


# virtual methods
.method public addInvitationToList(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;)V
    .registers 3
    .param p1, "invitation"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;

    .prologue
    .line 260
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->addInvitation(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaboratorInvitation;)V

    .line 261
    return-void
.end method

.method public disableDataView()V
    .registers 3

    .prologue
    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_15

    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 174
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 176
    :cond_15
    return-void
.end method

.method public enableDataView()V
    .registers 3

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_15

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 167
    :cond_15
    return-void
.end method

.method public getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    if-nez v0, :cond_6

    .line 385
    const/4 v0, 0x0

    .line 387
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v0

    goto :goto_5
.end method

.method public getHostActivity()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public handleBackPress()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 151
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    if-eqz v1, :cond_e

    .line 153
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->listViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeCollaborationListViewController;->handleBackPress()Z

    move-result v1

    if-ne v1, v0, :cond_e

    .line 156
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public handleSelfDelete()V
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_fragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;

    if-eqz v0, :cond_9

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_fragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;->handleSelfDelete()V

    .line 139
    :cond_9
    return-void
.end method

.method public hideAddCollaboratorIcon()V
    .registers 3

    .prologue
    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 115
    :cond_a
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 64
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_fragment_asset_browser_collaboration:I

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 65
    .local v0, "v":Landroid/view/View;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaboration_data_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_dataView:Landroid/view/View;

    .line 66
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaboration_waiting_progress_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_progressBar:Landroid/widget/ProgressBar;

    .line 67
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaboration_container_no_network_notification_bar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpBannerView:Landroid/view/View;

    .line 68
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaboration_root_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    .line 69
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowTopOffset(I)V

    .line 76
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaboration_container_no_network:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_commonPopUpErrorView:Landroid/view/View;

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->getFolderFromHref(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 79
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_targetFolder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    .line 80
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->setupListView(Landroid/view/View;)V

    .line 81
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->collaborator_add_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    .line 82
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->refreshListDueToSwipe()V

    .line 90
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 143
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_e

    .line 144
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->handleBackPress()Z

    move-result v0

    .line 147
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 119
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 120
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->registerLocalNofications()V

    .line 122
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 126
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 127
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->unRegisterLocalNotifications()V

    .line 129
    return-void
.end method

.method public refreshListDueToSwipe()V
    .registers 3

    .prologue
    .line 265
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 266
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->dataViewLoaded:Z

    .line 267
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v0

    if-nez v0, :cond_18

    .line 268
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->wentOffline()V

    .line 314
    :goto_17
    return-void

    .line 271
    :cond_18
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->showProgress()V

    .line 272
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->folderCollaboration:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->getCollaboration(Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)V

    goto :goto_17
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_network_reachability_observer:Ljava/util/Observer;

    if-nez v0, :cond_b

    .line 180
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_network_reachability_observer:Ljava/util/Observer;

    .line 201
    :cond_b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 204
    return-void
.end method

.method public setFragmentHostActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;)V
    .registers 2
    .param p1, "fragmentHostActivity"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_fragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;

    .line 100
    return-void
.end method

.method public showAddCollaboratorIcon()V
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_addCollaboratorButton:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 107
    :cond_a
    return-void
.end method

.method protected unRegisterLocalNotifications()V
    .registers 4

    .prologue
    .line 217
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 219
    return-void
.end method
