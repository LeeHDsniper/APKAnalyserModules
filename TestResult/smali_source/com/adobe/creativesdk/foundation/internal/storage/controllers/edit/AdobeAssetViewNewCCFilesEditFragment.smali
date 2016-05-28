.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;
.source "AdobeAssetViewNewCCFilesEditFragment.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeAssetViewEditFragmentControllerCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$CCFilesActionBarControllerWithEditControls;
    }
.end annotation


# instance fields
.field private _actionBarToolbar:Landroid/support/v7/widget/Toolbar;

.field private _actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

.field private _assetCount:I

.field private _backButton:Landroid/graphics/drawable/Drawable;

.field private _content:Landroid/view/View;

.field private _crossButton:Landroid/graphics/drawable/Drawable;

.field private _isGridView:Z

.field protected alertDialog:Landroid/app/AlertDialog;

.field protected alertNegativeButton:Landroid/view/View;

.field protected alertPositiveButton:Landroid/view/View;

.field protected alertText:Landroid/widget/TextView;

.field protected builder:Landroid/app/AlertDialog$Builder;

.field public dialogView:Landroid/view/View;

.field private expandedMode:Z

.field private isRootViewEnabled:Z

.field targetCollectionHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;-><init>()V

    .line 42
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->expandedMode:Z

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_isGridView:Z

    .line 55
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isRootViewEnabled:Z

    .line 423
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->deleteItems()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    return-object v0
.end method

.method private clearAndDisableButtons()V
    .registers 2

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->clearSelection()V

    .line 113
    :goto_d
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    .line 114
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->handleNoAssetSelection()V

    .line 115
    return-void

    .line 111
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->clearSelection()V

    goto :goto_d
.end method

.method private deleteItems()V
    .registers 6

    .prologue
    .line 325
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getSelectedAssets()V

    .line 326
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;->ADOBE_CC_FILE_EDIT_OPERATION_ERASE:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$3;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .line 349
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v4

    .line 326
    invoke-static {v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->createSession(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    move-result-object v0

    .line 350
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->startEditSession()V

    .line 351
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 352
    return-void
.end method

.method private disableRootView()V
    .registers 3

    .prologue
    .line 402
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 403
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->disableController()V

    .line 406
    :goto_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v0

    const/high16 v1, 0x3f000000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 407
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isRootViewEnabled:Z

    .line 409
    return-void

    .line 405
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->disableController()V

    goto :goto_d
.end method

.method private enableRootView()V
    .registers 3

    .prologue
    .line 393
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 394
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->enableController()V

    .line 397
    :goto_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getAssetsMainRootFrame()Landroid/widget/FrameLayout;

    move-result-object v0

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isRootViewEnabled:Z

    .line 399
    return-void

    .line 396
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->enableController()V

    goto :goto_d
.end method

.method private getCount()I
    .registers 2

    .prologue
    .line 259
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 260
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 262
    :goto_12
    return v0

    :cond_13
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_12
.end method

.method private getResourceString(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSelectedAssets()V
    .registers 3

    .prologue
    .line 251
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSelectedAssetsController;->sharedController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSelectedAssetsController;

    move-result-object v0

    .line 252
    .local v0, "selectedAssetsController":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSelectedAssetsController;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 253
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSelectedAssetsController;->setTargetAssets(Ljava/util/ArrayList;)V

    .line 256
    :goto_15
    return-void

    .line 255
    :cond_16
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSelectedAssetsController;->setTargetAssets(Ljava/util/ArrayList;)V

    goto :goto_15
.end method

.method private isGridView()Z
    .registers 2

    .prologue
    .line 131
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_isGridView:Z

    return v0
.end method

.method private isSingleAssetFile()Z
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 266
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 269
    :goto_15
    return v0

    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->getSelectedAssets()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    goto :goto_15
.end method

.method private setRenameButtonVisibilty(Z)V
    .registers 3
    .param p1, "visibilty"    # Z

    .prologue
    .line 419
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    if-eqz v0, :cond_9

    .line 420
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;->setRenameButtonVisibilty(Z)V

    .line 422
    :cond_9
    return-void
.end method

.method private setupActionBarCustomFont()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_browser_edit_actionbar_background:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 166
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 167
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetEditActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 168
    return-void
.end method


# virtual methods
.method protected createActionBarController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;
    .registers 2

    .prologue
    .line 412
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$CCFilesActionBarControllerWithEditControls;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$CCFilesActionBarControllerWithEditControls;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    return-object v0
.end method

.method protected getInternalFilters()Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$DataSourceInternalFilters;
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x0

    return-object v0
.end method

.method protected handleActionMenuButtonClick(Z)V
    .registers 3
    .param p1, "expandedMode"    # Z

    .prologue
    .line 187
    const/4 v0, 0x1

    if-ne p1, v0, :cond_7

    .line 189
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->disableRootView()V

    .line 195
    :goto_6
    return-void

    .line 192
    :cond_7
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->enableRootView()V

    goto :goto_6
.end method

.method protected handleBackPress()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 173
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    if-lez v1, :cond_1b

    .line 174
    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    .line 175
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->enableRootView()V

    .line 176
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->handleNoAssetSelection()V

    .line 177
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isGridView()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_gridAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->clearSelection()V

    .line 181
    :goto_1a
    const/4 v0, 0x1

    .line 183
    :cond_1b
    return v0

    .line 179
    :cond_1c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_listAssetsViewController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->clearSelection()V

    goto :goto_1a
.end method

.method protected handleEraseButtonClick()V
    .registers 7

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 282
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    if-nez v2, :cond_4c

    .line 283
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getLayoutInflater(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_alert_dialog_view:I

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    .line 284
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->builder:Landroid/app/AlertDialog$Builder;

    .line 285
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->builder:Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 286
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->alert_dialog_box_title_text:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertText:Landroid/widget/TextView;

    .line 287
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->alert_dialog_box_positive_button:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertPositiveButton:Landroid/view/View;

    .line 288
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->dialogView:Landroid/view/View;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$id;->alert_dialog_box_negative_button:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertNegativeButton:Landroid/view/View;

    .line 289
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertDialog:Landroid/app/AlertDialog;

    .line 291
    :cond_4c
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertPositiveButton:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_delete_dialog_positive_button:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertNegativeButton:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_delete_dialog_negative_button:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 293
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getCount()I

    move-result v0

    .line 294
    .local v0, "count":I
    const-string v1, ""

    .line 295
    .local v1, "message":Ljava/lang/String;
    if-le v0, v5, :cond_ac

    .line 296
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_delete_dialog_message_multi_select:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v2

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 304
    :goto_8d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertPositiveButton:Landroid/view/View;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertNegativeButton:Landroid/view/View;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$2;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 319
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 320
    return-void

    .line 299
    :cond_ac
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isSingleAssetFile()Z

    move-result v2

    if-eqz v2, :cond_b9

    .line 300
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_delete_dialog_message_file:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8d

    .line 302
    :cond_b9
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_delete_dialog_message_folder:I

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8d
.end method

.method protected handleExtraConfigurations(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditFragmentExtraConfiguration;)V
    .registers 2
    .param p1, "extraControls"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditFragmentExtraConfiguration;

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->handleNoAssetSelection()V

    .line 156
    return-void
.end method

.method public handleMoveButtonClick()V
    .registers 3

    .prologue
    .line 276
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getSelectedAssets()V

    .line 277
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    .line 278
    .local v0, "commandMgr":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_EDIT_OPEN_MOVE_CCFILES_BROWSER:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 279
    return-void
.end method

.method public handleMultipleAssetSelection(I)V
    .registers 5
    .param p1, "count"    # I

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->setRenameButtonVisibilty(Z)V

    .line 211
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    .line 212
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_content:Landroid/view/View;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitleWithColor(Landroid/view/View;Ljava/lang/String;I)V

    .line 213
    return-void
.end method

.method protected handleNetworkStatusChange(Z)V
    .registers 3
    .param p1, "isOnline"    # Z

    .prologue
    .line 81
    if-nez p1, :cond_c

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isRootViewEnabled:Z

    .line 83
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->disableRootView()V

    .line 84
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->clearAndDisableButtons()V

    .line 93
    :goto_b
    return-void

    .line 88
    :cond_c
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->isRootViewEnabled:Z

    if-eqz v0, :cond_14

    .line 89
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->enableRootView()V

    goto :goto_b

    .line 91
    :cond_14
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->disableRootView()V

    goto :goto_b
.end method

.method public handleNoAssetSelection()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 221
    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->expandedMode:Z

    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    if-eqz v0, :cond_c

    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;->handleFloatingMenuVisibilty(Z)V

    .line 226
    :cond_c
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->enableRootView()V

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_backButton:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 228
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_content:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_edit_fragment_title:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResourceString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitleWithColor(Landroid/view/View;Ljava/lang/String;I)V

    .line 231
    return-void
.end method

.method protected handleRenameButtonClick()V
    .registers 6

    .prologue
    .line 355
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getSelectedAssets()V

    .line 356
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;->ADOBE_CC_FILE_EDIT_OPERATION_RENAME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$4;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetViewConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;

    .line 381
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v4

    .line 356
    invoke-static {v1, v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditManager;->createSession(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditOperation;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeEditAssetCallback;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;

    move-result-object v0

    .line 382
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$5;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment$5;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession;->startEditSession(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeCCFilesRenameDialogDismissController;)V

    .line 389
    return-void
.end method

.method public handleSingleAssetSelection()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    if-eqz v0, :cond_a

    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    invoke-interface {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;->handleFloatingMenuVisibilty(Z)V

    .line 242
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_crossButton:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 243
    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    .line 244
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_content:Landroid/view/View;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_assetCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitleWithColor(Landroid/view/View;Ljava/lang/String;I)V

    .line 245
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->setRenameButtonVisibilty(Z)V

    .line 247
    return-void
.end method

.method protected initializeCCFilesContainerFromCollectionHref(Ljava/lang/String;)V
    .registers 3
    .param p1, "targetCollectionHref"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->targetCollectionHref:Ljava/lang/String;

    invoke-super {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->initializeCCFilesContainerFromCollectionHref(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 61
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 62
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->setRetainInstance(Z)V

    .line 63
    const-string v1, "EDIT_MULTI_SELECT_TARGET_HREF"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->targetCollectionHref:Ljava/lang/String;

    .line 64
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 65
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->asset_edit_home_as_up_cross:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_crossButton:Landroid/graphics/drawable/Drawable;

    .line 66
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->asset_edit_home_as_up_back:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_backButton:Landroid/graphics/drawable/Drawable;

    .line 67
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->setupActionBarCustomFont()V

    .line 68
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 69
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v2

    if-ne v1, v2, :cond_3a

    .line 71
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_isGridView:Z

    .line 77
    :goto_39
    return-void

    .line 75
    :cond_3a
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_isGridView:Z

    goto :goto_39
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 149
    return-void
.end method

.method public onHiddenChanged(Z)V
    .registers 2
    .param p1, "hidden"    # Z

    .prologue
    .line 101
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->onHiddenChanged(Z)V

    .line 102
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 198
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->onStart()V

    .line 199
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 204
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;->onStop()V

    .line 205
    return-void
.end method

.method protected setActionBarToolbarAndContent(Landroid/support/v7/widget/Toolbar;Landroid/view/View;)V
    .registers 3
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    .line 160
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_content:Landroid/view/View;

    .line 161
    return-void
.end method

.method protected setActionButtonController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;)V
    .registers 2
    .param p1, "controller"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->_actionButtonController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeActionButtonController;

    .line 97
    return-void
.end method

.method protected setupGridViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesGridViewController;
    .registers 3

    .prologue
    .line 124
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;-><init>(Landroid/content/Context;)V

    .line 125
    .local v0, "controller":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditGridViewController;->setControllerCallback(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeAssetViewEditFragmentControllerCallback;)V

    .line 126
    return-object v0
.end method

.method protected setupSectionalListViewController()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesSectionListViewController;
    .registers 3

    .prologue
    .line 141
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewNewCCFilesEditFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;-><init>(Landroid/content/Context;)V

    .line 142
    .local v0, "controller":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeAssetViewEditSectionalListViewController;->setControllerCallback(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/IAdobeAssetViewEditFragmentControllerCallback;)V

    .line 143
    return-object v0
.end method
