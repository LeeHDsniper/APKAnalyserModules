.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;
.super Ljava/lang/Object;
.source "AdobeAssetViewBaseContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "AssetsViewBaseActionBarController"
.end annotation


# instance fields
.field protected _myAccountMenuItem:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    .prologue
    .line 928
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleCurrentNetworkStatus(Z)V
    .registers 2
    .param p1, "isOnline"    # Z

    .prologue
    .line 951
    return-void
.end method

.method public handleOnStart()V
    .registers 1

    .prologue
    .line 974
    return-void
.end method

.method protected handleOptionItemSelect(I)Z
    .registers 5
    .param p1, "itemId"    # I

    .prologue
    .line 956
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_sdk_common_menu_myaccount:I

    if-ne p1, v0, :cond_e

    .line 958
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;->ACTION_MENU_SHOW_MY_ACCOUNT:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->postActionCommand(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewBrowserCommandName;Ljava/lang/Object;)V

    .line 959
    const/4 v0, 0x1

    .line 961
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 933
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$menu;->adobe_assetview_common_menu:I

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 934
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_uxassetbrowser_sdk_common_menu_myaccount:I

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->_myAccountMenuItem:Landroid/view/MenuItem;

    .line 935
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 965
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->handleOptionItemSelect(I)Z

    move-result v0

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 939
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_sdk_myaccount:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 940
    .local v0, "accountString":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->_myAccountMenuItem:Landroid/view/MenuItem;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getAdobeFontFormattedString(Ljava/lang/String;Landroid/app/Activity;)Landroid/text/SpannableString;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 941
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->_myAccountMenuItem:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->shouldEnableMyAccountMenu()Z

    move-result v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 942
    return-void
.end method

.method public refreshOptionItems()V
    .registers 1

    .prologue
    .line 970
    return-void
.end method

.method public saveActionBarInstanceState()V
    .registers 1

    .prologue
    .line 978
    return-void
.end method

.method protected shouldEnableMyAccountMenu()Z
    .registers 4

    .prologue
    .line 945
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseContainerFragment;->getHostActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->shouldEnableLokiSpecificFeatures(Landroid/content/Context;)Z

    move-result v1

    .line 946
    .local v1, "isLoki":Z
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;->hasClientPreferenceToEnableMyAccountOption()Z

    move-result v0

    .line 948
    .local v0, "clientOptionEnableMyAccount":Z
    if-nez v1, :cond_14

    if-eqz v0, :cond_14

    const/4 v2, 0x1

    :goto_13
    return v2

    :cond_14
    const/4 v2, 0x0

    goto :goto_13
.end method
