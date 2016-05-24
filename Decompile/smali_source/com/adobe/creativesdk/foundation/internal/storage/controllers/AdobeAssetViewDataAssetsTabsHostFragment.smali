.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
.source "AdobeAssetViewDataAssetsTabsHostFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    }
.end annotation


# instance fields
.field private _allAssetTabsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;",
            ">;"
        }
    .end annotation
.end field

.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _dataSourcesList:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation
.end field

.field private _observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

.field private mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

.field private mViewPager:Landroid/support/v4/view/ViewPager;

.field private mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;-><init>()V

    .line 272
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getDisplayNameOfDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "x2"    # Landroid/os/Bundle;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getHostDetailsFromDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    return-object v0
.end method

.method private getDataSourcesList()Ljava/util/EnumSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 79
    .local v0, "bundle":Landroid/os/Bundle;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getDataSourcesListToDisplayFromBundle(Landroid/os/Bundle;)Ljava/util/EnumSet;

    move-result-object v1

    return-object v1
.end method

.method private getDisplayNameOfDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;
    .registers 4
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    .line 89
    const-string v0, ""

    .line 90
    .local v0, "name":Ljava/lang/String;
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_d

    .line 91
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_files:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    .line 107
    :cond_c
    :goto_c
    return-object v0

    .line 92
    :cond_d
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePhotos:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_18

    .line 93
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_photos:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 94
    :cond_18
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_23

    .line 95
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_psmix:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 96
    :cond_23
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_2e

    .line 97
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_designlibrary:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 98
    :cond_2e
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_39

    .line 99
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_sketches:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 100
    :cond_39
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_44

    .line 101
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_lines:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 102
    :cond_44
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_4f

    .line 103
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_drawings:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 104
    :cond_4f
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_c

    .line 105
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_uxassetbrowser_comps:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private getHostDetailsFromDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    .registers 5
    .param p1, "dataSource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "parentBundleArgs"    # Landroid/os/Bundle;

    .prologue
    .line 113
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 114
    .local v0, "context":Landroid/content/Context;
    const/4 v1, 0x0

    invoke-static {v0, p1, p2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAssetViewFragmentDetails(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v1

    return-object v1
.end method

.method private getLocalizedString(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 84
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setupTabsBasedOnGivenDataSources()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 119
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getDataSourcesList()Ljava/util/EnumSet;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_dataSourcesList:Ljava/util/EnumSet;

    .line 121
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;

    .line 123
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v4, :cond_1c

    .line 124
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 127
    :cond_1c
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_dataSourcesList:Ljava/util/EnumSet;

    invoke-virtual {v4}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_22
    :goto_22
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 129
    .local v0, "dataSource":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-static {v0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->shouldShowComponent(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v5

    if-eqz v5, :cond_22

    .line 130
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;

    invoke-direct {v1, p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;)V

    .line 131
    .local v1, "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getDisplayNameOfDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->assetsTabName:Ljava/lang/String;

    .line 132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    invoke-direct {p0, v0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getHostDetailsFromDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v5

    iput-object v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->fragmentDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    .line 133
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 137
    .end local v0    # "dataSource":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .end local v1    # "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    :cond_51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getLoadedDataSourcesTypes()Ljava/util/List;

    move-result-object v3

    .line 139
    .local v3, "types":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    if-eqz v3, :cond_96

    .line 140
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5f
    :goto_5f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_96

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 141
    .local v2, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_dataSourcesList:Ljava/util/EnumSet;

    invoke-virtual {v5, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5f

    .line 142
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-static {v2, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->shouldShowComponent(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 143
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;

    invoke-direct {v1, p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;)V

    .line 144
    .restart local v1    # "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getDisplayNameOfDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->assetsTabName:Ljava/lang/String;

    .line 145
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    invoke-direct {p0, v2, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getHostDetailsFromDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v5

    iput-object v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->fragmentDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    .line 146
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    .line 153
    .end local v1    # "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    .end local v2    # "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    :cond_96
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->onCreate(Landroid/os/Bundle;)V

    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 74
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 158
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assetsview_datasource_tabs:I

    invoke-virtual {p1, v2, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 159
    .local v1, "rootView":Landroid/view/View;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->view_pager:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 161
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Landroid/support/v4/app/FragmentManager;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    .line 163
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->setupTabsBasedOnGivenDataSources()V

    .line 165
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 168
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->sliding_tabs:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    .line 169
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$layout;->tab_layout:I

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$id;->creativesdk_tab_title:I

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setCustomTabView(II)V

    .line 172
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 173
    .local v0, "res":Landroid/content/res/Resources;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    const/4 v3, 0x2

    new-array v3, v3, [I

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$color;->creative_sdk_tab_indicator_color:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    aput v4, v3, v5

    const/4 v4, -0x1

    aput v4, v3, v6

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setSelectedIndicatorColors([I)V

    .line 174
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setDistributeEvenly(Z)V

    .line 175
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->getCount()I

    move-result v2

    if-eqz v2, :cond_65

    .line 176
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 178
    :cond_65
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)V

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 195
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    .line 196
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeDataSourceReady:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 197
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAppOrientationConfigurationChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 199
    return-object v1
.end method

.method public onDestroyView()V
    .registers 4

    .prologue
    .line 318
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->onDestroyView()V

    .line 319
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeDataSourceReady:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 320
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAppOrientationConfigurationChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 321
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_observer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;

    .line 322
    return-void
.end method
