.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "AdobeAssetViewCollaborationV2Activity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;


# instance fields
.field private ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

.field private _actionBarToolbar:Landroid/support/v7/widget/Toolbar;

.field private _collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

.field private _containerId:I

.field private folderHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 24
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->frame_collaboration_container:I

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_containerId:I

    .line 25
    const-string v0, "ASSET_VIEW_COLLABORATION_FOLDER_HREF"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

    return-void
.end method

.method private createCollaborationFragment()Landroid/support/v4/app/Fragment;
    .registers 5

    .prologue
    .line 54
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;-><init>()V

    .line 55
    .local v1, "fragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 56
    .local v0, "collaborationBundle":Landroid/os/Bundle;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->ASSET_VIEW_COLLABORATION_FOLDER_HREF_KEY:Ljava/lang/String;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->folderHref:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->setFragmentHostActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/IAdobeCollaborationFragmentHostActivity;)V

    .line 58
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->setArguments(Landroid/os/Bundle;)V

    .line 60
    return-object v1
.end method

.method private setupActionBarCustomFont()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 106
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->actionbar_toolbar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    .line 108
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->collaborator:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 112
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 113
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 114
    return-void
.end method

.method private startCollaborationFragment()V
    .registers 6

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 46
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->createCollaborationFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    .line 47
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 48
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_containerId:I

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    const-string v4, ""

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 49
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 50
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 51
    return-void
.end method


# virtual methods
.method public handleSelfDelete()V
    .registers 3

    .prologue
    .line 30
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_ASSET_VIEW_COLLABORATOR_SELF_DELETE_MOVE_TO_ROOT:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetBrowserCommandMgr;->postCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;)V

    .line 31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->finish()V

    .line 32
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->handleBackPress()Z

    move-result v0

    if-nez v0, :cond_f

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->finish()V

    .line 120
    :cond_f
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->activity_asset_browser_collaboration:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->setContentView(I)V

    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->setupActionBarCustomFont()V

    .line 39
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "Folder Href"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->folderHref:Ljava/lang/String;

    .line 40
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->startCollaborationFragment()V

    .line 42
    return-void
.end method

.method protected onDestroy()V
    .registers 1

    .prologue
    .line 66
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->destorySharedInstance()V

    .line 67
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onDestroy()V

    .line 68
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->_collaborationFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 80
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/collaboration/AdobeAssetViewCollaborationV2Activity;->finish()V

    .line 81
    const/4 v0, 0x1

    .line 84
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method protected onResume()V
    .registers 1

    .prologue
    .line 102
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onResume()V

    .line 103
    return-void
.end method

.method protected onStart()V
    .registers 1

    .prologue
    .line 90
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStart()V

    .line 92
    return-void
.end method

.method protected onStop()V
    .registers 1

    .prologue
    .line 96
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStop()V

    .line 98
    return-void
.end method
