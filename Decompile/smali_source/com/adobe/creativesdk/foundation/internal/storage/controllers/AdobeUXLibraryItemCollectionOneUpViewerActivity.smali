.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;
.source "AdobeUXLibraryItemCollectionOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemFragment;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$PhotoViewData;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionAdapter;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;
    }
.end annotation


# instance fields
.field private _libraryOneupControllerInitializedObserver:Ljava/util/Observer;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 403
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updateTitleOfActivity()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->removeLibraryInitializedObserver()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->startItemsOneUpDisplay()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->handleOpenBtnClick()V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getUniqueNameForLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->isCurrentItemRenderable()Z

    move-result v0

    return v0
.end method

.method private getUniqueNameForLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;
    .registers 7
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 344
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getItemID()Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, "guid":Ljava/lang/String;
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_19

    .line 347
    :cond_c
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    const-string v4, "_"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 354
    :goto_18
    return-object v2

    .line 350
    :cond_19
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "outGuid":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_29

    .line 352
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    goto :goto_18

    .line 354
    :cond_29
    const/4 v2, 0x0

    aget-object v2, v1, v2

    goto :goto_18
.end method

.method private handleOpenBtnClick()V
    .registers 4

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getCurrentLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    .line 159
    .local v0, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->isSelectModeActive()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 160
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getLibrary()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->selectLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 163
    :cond_11
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 164
    .local v1, "resultIntent":Landroid/content/Intent;
    const/4 v2, -0x1

    invoke-virtual {p0, v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->setResult(ILandroid/content/Intent;)V

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->finish()V

    .line 166
    return-void
.end method

.method private isCurrentItemRenderable()Z
    .registers 4

    .prologue
    .line 360
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    .line 361
    .local v0, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    instance-of v1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-eqz v1, :cond_10

    .line 362
    const/4 v1, 0x1

    .line 364
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private removeLibraryInitializedObserver()V
    .registers 4

    .prologue
    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    if-eqz v0, :cond_12

    .line 170
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeLibraryOneUpControllerInitialized:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 172
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 174
    :cond_12
    return-void
.end method

.method private setUpLibraryController(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 103
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 105
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->startItemsOneUpDisplay()V

    .line 124
    :goto_9
    return-void

    .line 110
    :cond_a
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    .line 118
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeLibraryOneUpControllerInitialized:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_libraryOneupControllerInitializedObserver:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 122
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->createInstanceFromConfigurationBundle(Landroid/os/Bundle;)V

    goto :goto_9
.end method

.method private startItemsOneUpDisplay()V
    .registers 4

    .prologue
    .line 128
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    .line 129
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 130
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getStartIndex()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 132
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updateTitleOfActivity()V

    .line 133
    return-void
.end method

.method private updateTitleOfActivity()V
    .registers 7

    .prologue
    .line 84
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    if-eqz v2, :cond_30

    .line 86
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_VIEWER_OF_2:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    add-int/lit8 v5, v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getCount()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, "title":Ljava/lang/String;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .end local v1    # "title":Ljava/lang/String;
    :cond_30
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    .line 91
    .local v0, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    if-eqz v0, :cond_49

    .line 93
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    if-eqz v2, :cond_4a

    .line 94
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    .end local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorNameOrHexValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->setActionBarTitle(Ljava/lang/String;)V

    .line 99
    :cond_49
    :goto_49
    return-void

    .line 96
    .restart local v0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_4a
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->setActionBarTitle(Ljava/lang/String;)V

    goto :goto_49
.end method


# virtual methods
.method generateShareIntentInfo()V
    .registers 11

    .prologue
    .line 288
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v7

    if-nez v7, :cond_7

    .line 340
    :cond_6
    :goto_6
    return-void

    .line 292
    :cond_7
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    .line 293
    .local v0, "assetIndex":I
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v7

    iget v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    invoke-virtual {v7, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v5

    .line 295
    .local v5, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    instance-of v7, v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-eqz v7, :cond_6

    move-object v4, v5

    .line 296
    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .line 298
    .local v4, "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getPrimaryComponentType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "image/vnd.adobe.shape+svg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 299
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v3

    .line 305
    .local v3, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_2a
    if-eqz v3, :cond_6

    .line 306
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;

    invoke-direct {v2, p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    .line 329
    .local v2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getUniqueNameForLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, "baseName":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".png"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 331
    .local v6, "renditionFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_6

    .line 334
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-static {v3, v7, v8, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    goto :goto_6

    .line 302
    .end local v1    # "baseName":Ljava/lang/String;
    .end local v2    # "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    .end local v3    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v6    # "renditionFile":Ljava/io/File;
    :cond_5d
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v3

    .restart local v3    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    goto :goto_2a
.end method

.method getCurrentLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    .registers 3

    .prologue
    .line 195
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    return-object v0
.end method

.method protected getItemPageChangeListener()Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
    .registers 3

    .prologue
    .line 224
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$AdobeUXLibraryItemCollectionPageChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$1;)V

    return-object v0
.end method

.method getShareFile()Ljava/io/File;
    .registers 7

    .prologue
    .line 369
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPos:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v1

    .line 370
    .local v1, "item":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getUniqueNameForLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Ljava/lang/String;

    move-result-object v0

    .line 371
    .local v0, "baseName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method public hideOrShowActionsBar()V
    .registers 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 229
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 230
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v3

    .line 231
    .local v3, "hasMenuKey":Z
    const/4 v5, 0x4

    invoke-static {v5}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v2

    .line 233
    .local v2, "hasBackKey":Z
    if-eqz v0, :cond_53

    .line 234
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->isShowing()Z

    move-result v5

    if-eqz v5, :cond_54

    .line 235
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 236
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 237
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v5, v7, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 243
    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updatePageBackground(Z)V

    .line 244
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v7, v7, v7, v7}, Landroid/support/v4/view/ViewPager;->setPadding(IIII)V

    .line 248
    const/4 v4, 0x0

    .line 249
    .local v4, "uiOptions":I
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_42

    .line 250
    or-int/lit8 v4, v4, 0x4

    .line 252
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v5, v6, :cond_42

    .line 253
    or-int/lit16 v4, v4, 0x800

    .line 257
    :cond_42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 258
    .local v1, "decorView":Landroid/view/View;
    if-nez v3, :cond_50

    if-nez v2, :cond_50

    .line 259
    or-int/lit16 v4, v4, 0x702

    .line 261
    :cond_50
    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 284
    .end local v1    # "decorView":Landroid/view/View;
    .end local v4    # "uiOptions":I
    :cond_53
    :goto_53
    return-void

    .line 264
    :cond_54
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->show()V

    .line 265
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    const/4 v6, 0x1

    invoke-virtual {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 271
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updateOpenBtnContainerVisibility()V

    .line 275
    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->updatePageBackground(Z)V

    .line 276
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getHeight()I

    move-result v6

    invoke-virtual {v5, v7, v6, v7, v7}, Landroid/support/v4/view/ViewPager;->setPadding(IIII)V

    .line 278
    const/4 v4, 0x0

    .line 279
    .restart local v4    # "uiOptions":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 281
    .restart local v1    # "decorView":Landroid/view/View;
    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_53
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 146
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreate(Landroid/os/Bundle;)V

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->setUpLibraryController(Landroid/os/Bundle;)V

    .line 155
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 177
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->removeLibraryInitializedObserver()V

    .line 178
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->destorySharedInstance()V

    .line 180
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 181
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onDestroy()V

    .line 182
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;
    .param p2, "outPersistentState"    # Landroid/os/PersistableBundle;

    .prologue
    .line 186
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onSaveInstanceState(Landroid/os/Bundle;Landroid/os/PersistableBundle;)V

    .line 187
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/LibraryItemsOneUpViewController;->saveInstanceState(Landroid/os/Bundle;)V

    .line 188
    return-void
.end method

.method protected updateOpenBtnContainerVisibility()V
    .registers 3

    .prologue
    .line 137
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->isSelectModeActive()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    :goto_c
    return-void

    .line 140
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_c
.end method

.method public updatePageBackground(Z)V
    .registers 9
    .param p1, "imageLoading"    # Z

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 200
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_1b

    .line 201
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->isShowing()Z

    move-result v1

    .line 202
    .local v1, "isActionBarVisible":Z
    if-eqz v1, :cond_1c

    .line 203
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$color;->creative_sdk_background_color:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPager;->setBackgroundColor(I)V

    .line 220
    .end local v1    # "isActionBarVisible":Z
    :cond_1b
    :goto_1b
    return-void

    .line 205
    .restart local v1    # "isActionBarVisible":Z
    :cond_1c
    const/4 v2, 0x0

    .line 206
    .local v2, "isCurrentItemShapeImage":Z
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    if-eqz v4, :cond_2f

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentStatePagerAdapter;->getCount()I

    move-result v4

    if-lez v4, :cond_2f

    .line 208
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->getCurrentLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v3

    .line 209
    .local v3, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    instance-of v2, v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .line 212
    .end local v3    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_2f
    if-eqz v2, :cond_3b

    if-nez p1, :cond_3b

    .line 214
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->checkered:I

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPager;->setBackgroundResource(I)V

    goto :goto_1b

    .line 217
    :cond_3b
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXLibraryItemCollectionOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPager;->setBackgroundColor(I)V

    goto :goto_1b
.end method

.method updateSelectionBtnVisibility(Z)V
    .registers 2
    .param p1, "bVisible"    # Z

    .prologue
    .line 377
    return-void
.end method
