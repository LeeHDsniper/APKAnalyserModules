.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;
.super Ljava/lang/Object;
.source "AdobeAssetViewDataAssetsTabsHostFragment.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DatSourceObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)V
    .registers 2

    .prologue
    .line 276
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 278
    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 8
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 282
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 284
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeDataSourceReady:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v3, v4, :cond_6d

    .line 286
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v3

    const-string v4, "DataSourceReady"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    move-object v0, v3

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 287
    .local v0, "dataSourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$1;)V

    .line 288
    .local v2, "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getDisplayNameOfDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;
    invoke-static {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->assetsTabName:Ljava/lang/String;

    .line 289
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->getHostDetailsFromDataSource(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    invoke-static {v3, v0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v3

    iput-object v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;->fragmentDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    .line 290
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->_allAssetTabsList:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setDistributeEvenly(Z)V

    .line 297
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 299
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->notifyDataSetChanged()V

    .line 300
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->forceLayout()V

    .line 312
    .end local v0    # "dataSourceType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .end local v2    # "tabDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$AssetTabDetails;
    :cond_6c
    :goto_6c
    return-void

    .line 303
    :cond_6d
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAppOrientationConfigurationChanged:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v3, v4, :cond_6c

    .line 306
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPager:Landroid/support/v4/view/ViewPager;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 308
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mViewPagerAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$OurViewPagerAdapter;->notifyDataSetChanged()V

    .line 309
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment$DatSourceObserver;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->mSlidingTabLayout:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout;->forceLayout()V

    goto :goto_6c
.end method
