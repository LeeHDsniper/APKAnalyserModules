.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "AdobeAssetViewCommentsActivity.java"


# instance fields
.field private _actionBarToolbar:Landroid/support/v7/widget/Toolbar;

.field private _commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

.field private _containerId:I

.field private openWithReplyWindow:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 18
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->frame_comments_container:I

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_containerId:I

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->openWithReplyWindow:Z

    return-void
.end method

.method private createCommentsFragment()Landroid/support/v4/app/Fragment;
    .registers 6

    .prologue
    .line 41
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;-><init>()V

    .line 42
    .local v1, "fragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 43
    .local v0, "collaborationBundle":Landroid/os/Bundle;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 44
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 45
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->openWithReplyWindow:Z

    if-eqz v2, :cond_28

    .line 46
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->setOpenWithReply(Z)V

    .line 47
    :cond_28
    return-object v1
.end method

.method private setupActionBarCustomFont()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 51
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->actionbar_toolbar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    .line 53
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_comments_title:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_actionBarToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 57
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 59
    return-void
.end method

.method private startCommentsFragment()V
    .registers 6

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 33
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->createCommentsFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    .line 34
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 35
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_containerId:I

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    const-string v4, ""

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 36
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 37
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 38
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->handleBackPress()Z

    move-result v0

    if-nez v0, :cond_f

    .line 77
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->finish()V

    .line 78
    :cond_f
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 23
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$layout;->activity_asset_browser_comments:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->setContentView(I)V

    .line 25
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->setupActionBarCustomFont()V

    .line 26
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "OPEN_REPLY_WINDOW"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->openWithReplyWindow:Z

    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->startCommentsFragment()V

    .line 29
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x102002c

    if-ne v1, v2, :cond_1a

    .line 63
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->_commentsFragment:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsFragment;->handleBackPress()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 64
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;->finish()V

    .line 65
    const/4 v0, 0x1

    .line 71
    :cond_1a
    return v0
.end method
