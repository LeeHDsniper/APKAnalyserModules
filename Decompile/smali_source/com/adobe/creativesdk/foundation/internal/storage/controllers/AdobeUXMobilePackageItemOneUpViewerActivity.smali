.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;
.source "AdobeUXMobilePackageItemOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$PhotoViewData;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemCollectionAdapter;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemPageChangeListener;
    }
.end annotation


# instance fields
.field _mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 378
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->removeMobilePackageInitializedObserver()V

    return-void
.end method

.method private removeMobilePackageInitializedObserver()V
    .registers 4

    .prologue
    .line 179
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    if-eqz v0, :cond_12

    .line 180
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeMobilePackageOneUpControllerInitialized:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 182
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 184
    :cond_12
    return-void
.end method


# virtual methods
.method generateShareIntentInfo()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 228
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v5

    if-nez v5, :cond_8

    .line 334
    :cond_7
    :goto_7
    return-void

    .line 233
    :cond_8
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    .line 234
    .local v1, "assetIndex":I
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v5

    iget v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 235
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$3;

    invoke-direct {v3, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 323
    .local v3, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "baseName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".png"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 325
    .local v4, "renditionFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_7

    .line 332
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v6, v8, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    invoke-virtual {v0, v5, v6, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_7
.end method

.method protected getItemPageChangeListener()Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
    .registers 2

    .prologue
    .line 189
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemPageChangeListener;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemPageChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V

    return-object v0
.end method

.method protected getShareFile()Ljava/io/File;
    .registers 7

    .prologue
    .line 339
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 340
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v1

    .line 341
    .local v1, "baseName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;
    .registers 7
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 211
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "guid":Ljava/lang/String;
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_19

    .line 214
    :cond_c
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    const-string v4, "_"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 221
    :goto_18
    return-object v2

    .line 217
    :cond_19
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 218
    .local v1, "outGuid":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_29

    .line 219
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    goto :goto_18

    .line 221
    :cond_29
    const/4 v2, 0x0

    aget-object v2, v1, v2

    goto :goto_18
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 157
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreate(Landroid/os/Bundle;)V

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->setUpMobilePackageController(Landroid/os/Bundle;)V

    .line 176
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->removeMobilePackageInitializedObserver()V

    .line 195
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->destorySharedInstance()V

    .line 198
    :try_start_6
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mImagePath:Ljava/io/File;

    if-eqz v1, :cond_f

    .line 199
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mImagePath:Ljava/io/File;

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_f} :catch_16

    .line 206
    :cond_f
    :goto_f
    const/4 v1, 0x0

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 207
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onDestroy()V

    .line 208
    return-void

    .line 201
    :catch_16
    move-exception v0

    .line 203
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;
    .param p2, "outPersistentState"    # Landroid/os/PersistableBundle;

    .prologue
    .line 351
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V

    .line 352
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->saveInstanceState(Landroid/os/Bundle;)V

    .line 353
    return-void
.end method

.method protected setUpMobilePackageController(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 91
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 93
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->startItemsOneUpDisplay()V

    .line 112
    :goto_9
    return-void

    .line 98
    :cond_a
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 106
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeMobilePackageOneUpControllerInitialized:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->_mobilePackageOneupControllerInitializedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 110
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->createInstanceFromConfigurationBundle(Landroid/os/Bundle;)V

    goto :goto_9
.end method

.method protected startItemsOneUpDisplay()V
    .registers 4

    .prologue
    .line 116
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemCollectionAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemCollectionAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 118
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getStartIndex()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 120
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->updateTitleOfActivity()V

    .line 121
    return-void
.end method

.method protected updateOpenBtnContainerVisibility()V
    .registers 3

    .prologue
    .line 148
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v0

    if-nez v0, :cond_d

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    :goto_c
    return-void

    .line 151
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_c
.end method

.method updateSelectionBtnVisibility(Z)V
    .registers 2
    .param p1, "bVisible"    # Z

    .prologue
    .line 347
    return-void
.end method

.method protected updateTitleOfActivity()V
    .registers 7

    .prologue
    .line 125
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    if-eqz v2, :cond_30

    .line 127
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_VIEWER_OF_2:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "title":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .end local v1    # "title":Ljava/lang/String;
    :cond_30
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->mPos:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 132
    .local v0, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 133
    .restart local v1    # "title":Ljava/lang/String;
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;

    if-eqz v2, :cond_50

    .line 134
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_sketchCollection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 140
    :cond_4a
    :goto_4a
    if-eqz v0, :cond_4f

    .line 142
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;->setActionBarTitle(Ljava/lang/String;)V

    .line 144
    :cond_4f
    return-void

    .line 135
    :cond_50
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompPage;

    if-eqz v2, :cond_5b

    .line 136
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_composition_collection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4a

    .line 137
    :cond_5b
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;

    if-eqz v2, :cond_4a

    .line 138
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_psmix_collection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4a
.end method
