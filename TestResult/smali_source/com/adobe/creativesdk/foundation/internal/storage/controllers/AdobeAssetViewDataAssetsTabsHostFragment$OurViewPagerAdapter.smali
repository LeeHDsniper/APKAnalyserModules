.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;
.super Landroid/support/v4/app/FragmentPagerAdapter;
.source "AdobeAssetViewDataAssetsTabsHostFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OurViewPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Landroid/support/v4/app/FragmentManager;)V
    .registers 3
    .param p2, "fm"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .line 212
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 213
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .registers 7
    .param p1, "position"    # I

    .prologue
    .line 217
    const/4 v0, 0x0

    .line 219
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    :try_start_1
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;

    iget-object v1, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->fragmentDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    .line 220
    .local v1, "fragmentDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->argumentsBundle:Landroid/os/Bundle;

    invoke-static {v2, v3, v4}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    :try_end_20
    .catch Landroid/support/v4/app/Fragment$InstantiationException; {:try_start_1 .. :try_end_20} :catch_22

    move-result-object v0

    .line 223
    .end local v1    # "fragmentDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    :goto_21
    return-object v0

    .line 221
    :catch_22
    move-exception v2

    goto :goto_21
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->assetsTabName:Ljava/lang/String;

    return-object v0
.end method
