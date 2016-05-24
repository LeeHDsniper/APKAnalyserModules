.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeAssetViewMainBrowserFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;
    }
.end annotation


# static fields
.field public static COLLABORATION_INTENT_REQUEST_CODE:I

.field public static NOTIFICATION_INTENT_REQUEST_CODE:I


# instance fields
.field public final BASE_FRAGMENT_TAG:Ljava/lang/String;

.field private final ROOT_VIEW_ID_CONST:I

.field private _assetViewFragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

.field private _browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

.field private _commandsHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;

.field private _extraConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

.field private _popToRootOnResume:Z

.field private _rootViewId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    const/16 v0, 0xa

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->COLLABORATION_INTENT_REQUEST_CODE:I

    .line 62
    const/16 v0, 0xb

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->NOTIFICATION_INTENT_REQUEST_CODE:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 51
    const/16 v0, 0x1234

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->ROOT_VIEW_ID_CONST:I

    .line 53
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_rootViewId:I

    .line 57
    const-string v0, "assetBrowser_baseFragmentTab"

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->BASE_FRAGMENT_TAG:Ljava/lang/String;

    .line 59
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_popToRootOnResume:Z

    .line 299
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->navigateToLibraryDesignCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->action_handleNewFolderCreated(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showCCSection_MyAssets()V

    return-void
.end method

.method static synthetic access$1200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showCCSection_MyLibraries()V

    return-void
.end method

.method static synthetic access$1300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->action_moveToRootCollection()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->navigateToMobileCreationCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showMyAccountView()V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->returnCurrentSelectedFilesToClient()V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->returnCurrentSelectedPhotosToClient()V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->signOutCurrentUser()V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Ljava/lang/Object;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->handleShowUploadErrorDetails(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Ljava/lang/Object;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->handleShowEditErrorDetails(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->action_handleCreateNewFolder(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V

    return-void
.end method

.method private action_handleCreateNewFolder(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 5
    .param p1, "parentFolder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 459
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getCreateNewFolderDialogFragment(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Landroid/support/v4/app/DialogFragment;

    move-result-object v0

    .line 460
    .local v0, "hostFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "upload_create_new_folder"

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 461
    return-void
.end method

.method private action_handleNewFolderCreated(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 4
    .param p1, "data"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 454
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->navigateToCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Ljava/lang/String;)V

    .line 455
    return-void
.end method

.method private action_moveToRootCollection()V
    .registers 1

    .prologue
    .line 387
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->performPopToRoot()V

    .line 389
    return-void
.end method

.method private fixDatasourceArgumentsForAssets()V
    .registers 4

    .prologue
    .line 407
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 408
    .local v0, "bundle":Landroid/os/Bundle;
    if-nez v0, :cond_7

    .line 417
    :cond_6
    :goto_6
    return-void

    .line 411
    :cond_7
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 412
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/EnumSet;

    .line 413
    .local v1, "dataSourceTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/util/EnumSet;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 414
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-virtual {v1, v2}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    .line 415
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    goto :goto_6
.end method

.method private handleShowEditErrorDetails(Ljava/lang/Object;)V
    .registers 5
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 470
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForEditErrorSummary(Ljava/lang/Object;)Landroid/support/v4/app/DialogFragment;

    move-result-object v0

    .line 472
    .local v0, "hostFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "edit_error_details"

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 473
    return-void
.end method

.method private handleShowUploadErrorDetails(Ljava/lang/Object;)V
    .registers 5
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 464
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForUploadErrorSummary(Ljava/lang/Object;)Landroid/support/v4/app/DialogFragment;

    move-result-object v0

    .line 466
    .local v0, "hostFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "upload_error_details"

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 467
    return-void
.end method

.method private navigateToLibraryDesignCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;)V
    .registers 7
    .param p1, "designLibraryCollectionCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;

    .prologue
    .line 421
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;

    invoke-direct {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;-><init>()V

    .line 423
    .local v2, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 424
    .local v1, "containerArgs":Landroid/os/Bundle;
    const-string v3, "designCollectionHref"

    iget-object v4, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;->collectionHref:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    const-string v3, "designCollectionParentHref"

    iget-object v4, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;->parentHref:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 427
    .local v0, "browserArgs":Landroid/os/Bundle;
    if-eqz v0, :cond_3c

    .line 428
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 429
    const-string v3, "design_library_items_key"

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 430
    const-string v3, "design_library_items_filtertype"

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 433
    :cond_3c
    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 434
    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 435
    return-void
.end method

.method private navigateToMobileCreationCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;)V
    .registers 6
    .param p1, "mcCollectionCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;

    .prologue
    .line 439
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;-><init>()V

    .line 441
    .local v1, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 442
    .local v0, "containerArgs":Landroid/os/Bundle;
    const-string v2, "mobilePackageCollectionHref"

    iget-object v3, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->collectionHref:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    const-string v2, "mobilePackageCollectionParentHref"

    iget-object v3, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;->parentHref:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 445
    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 448
    return-void
.end method

.method private performPopToRoot()V
    .registers 6

    .prologue
    .line 247
    .line 250
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 251
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v2

    .line 254
    .local v2, "numHostFragments":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_1b

    .line 259
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesForceRefreshAssetsList:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 260
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 268
    return-void

    .line 257
    .end local v1    # "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    :cond_1b
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStackImmediate()Z

    goto :goto_0
.end method

.method private returnCurrentSelectedFilesToClient()V
    .registers 3

    .prologue
    .line 482
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->getCurrentSelectedFilesAsIntentResultData()Landroid/content/Intent;

    move-result-object v0

    .line 483
    .local v0, "selectedFilesResultIntentData":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;->handleOpenSelectedFilesAction(Landroid/content/Intent;)V

    .line 484
    return-void
.end method

.method private returnCurrentSelectedPhotosToClient()V
    .registers 3

    .prologue
    .line 487
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->getCurrentSelectedPhotosAsIntentResultData()Landroid/content/Intent;

    move-result-object v0

    .line 488
    .local v0, "selectedFilesResultIntentData":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;->handleOpenSelectedFilesAction(Landroid/content/Intent;)V

    .line 489
    return-void
.end method

.method private showCCSection_MyAssets()V
    .registers 5

    .prologue
    .line 399
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->fixDatasourceArgumentsForAssets()V

    .line 401
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getBaseHostFragmentFromClientBundle(Landroid/content/Context;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    .line 402
    .local v0, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showFragmentAsRoot(Landroid/support/v4/app/Fragment;)V

    .line 403
    return-void
.end method

.method private showCCSection_MyAssetsCollection(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "collectionHref"    # Ljava/lang/String;
    .param p2, "useDropDown"    # Z

    .prologue
    .line 146
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->fixDatasourceArgumentsForAssets()V

    .line 148
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-static {v1, v2, v3, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getBaseHostFragmentFromClientBundle(Landroid/content/Context;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    .line 149
    .local v0, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showFragmentAsRoot(Landroid/support/v4/app/Fragment;)V

    .line 150
    return-void
.end method

.method private showCCSection_MyLibraries()V
    .registers 4

    .prologue
    .line 393
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    .line 395
    .local v0, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showFragmentAsRoot(Landroid/support/v4/app/Fragment;)V

    .line 396
    return-void
.end method

.method private showMyAccountView()V
    .registers 5

    .prologue
    .line 493
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;-><init>()V

    .line 494
    .local v1, "settingsFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 495
    .local v0, "bundle":Landroid/os/Bundle;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getBrowserConfiguration()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 496
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 497
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 498
    return-void
.end method

.method private signOutCurrentUser()V
    .registers 2

    .prologue
    .line 478
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;->handleUserSignOutAction()V

    .line 479
    return-void
.end method

.method private startWithClientArguments(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "browserArgs"    # Landroid/os/Bundle;

    .prologue
    .line 126
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_extraConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->startWithCollectionHref()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "collectionHref":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_extraConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->useDropDownActionBar()Z

    move-result v2

    .line 128
    .local v2, "useDropDown":Z
    if-nez v0, :cond_2e

    .line 129
    const/4 v1, 0x1

    .line 130
    .local v1, "shouldStartWithLibraries":Z
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v3

    if-eqz v3, :cond_22

    .line 131
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController;->getCurrentCCSection()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;

    move-result-object v3

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;->myLibraries:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/actionbar/AdobeUxActionBarDropDownController$CCSection;

    if-ne v3, v4, :cond_28

    const/4 v1, 0x1

    .line 134
    :cond_22
    :goto_22
    if-eqz v1, :cond_2a

    .line 135
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showCCSection_MyLibraries()V

    .line 143
    .end local v1    # "shouldStartWithLibraries":Z
    :goto_27
    return-void

    .line 131
    .restart local v1    # "shouldStartWithLibraries":Z
    :cond_28
    const/4 v1, 0x0

    goto :goto_22

    .line 137
    :cond_2a
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showCCSection_MyAssets()V

    goto :goto_27

    .line 141
    .end local v1    # "shouldStartWithLibraries":Z
    :cond_2e
    invoke-direct {p0, v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->showCCSection_MyAssetsCollection(Ljava/lang/String;Z)V

    goto :goto_27
.end method


# virtual methods
.method PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V
    .registers 6
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 111
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 112
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_rootViewId:I

    invoke-virtual {v1, v2, p1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 113
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 114
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 115
    return-void
.end method

.method public getBrowserConfiguration()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    return-object v0
.end method

.method public handleOnActivityResult(IILandroid/content/Intent;)V
    .registers 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 282
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1a

    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->ASSET_ONE_UP_ACTIVITY_REQUEST:I

    if-eq p1, v0, :cond_13

    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->PHOTO_ONE_UP_ACTIVITY_REQUEST:I

    if-eq p1, v0, :cond_13

    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    if-eq p1, v0, :cond_13

    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    if-ne p1, v0, :cond_1a

    .line 285
    :cond_13
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->PHOTO_ONE_UP_ACTIVITY_REQUEST:I

    if-ne p1, v0, :cond_1b

    .line 286
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->returnCurrentSelectedPhotosToClient()V

    .line 296
    :cond_1a
    :goto_1a
    return-void

    .line 289
    :cond_1b
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->returnCurrentSelectedFilesToClient()V

    goto :goto_1a
.end method

.method public handleOnBackPressed()Z
    .registers 3

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 242
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 243
    const/4 v1, 0x1

    return v1
.end method

.method public isAtRootFragment()Z
    .registers 4

    .prologue
    .line 271
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 272
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    .line 273
    .local v1, "numHostFragments":I
    if-nez v1, :cond_c

    const/4 v2, 0x1

    :goto_b
    return v2

    :cond_c
    const/4 v2, 0x0

    goto :goto_b
.end method

.method public navigateToCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Ljava/lang/String;)V
    .registers 6
    .param p1, "datasourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "collectionHref"    # Ljava/lang/String;

    .prologue
    .line 86
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_assetViewFragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    if-eqz v1, :cond_9

    .line 87
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_assetViewFragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;->hideCollaborationFrameOnBackPressed()V

    .line 90
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v1, p1, v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    .line 92
    .local v0, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public navigateToPhotoCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;)V
    .registers 7
    .param p1, "datasourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "navCommand"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;

    .prologue
    .line 97
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoAssetsContainerFragment;-><init>()V

    .line 98
    .local v1, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAssetViewConfigurationBundle(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 100
    .local v0, "containerArgs":Landroid/os/Bundle;
    const-string v2, "ASSET_CONTAINER_TARGET_COLLECTION_GUID"

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->collectionGUID:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const-string v2, "ASSET_CONTAINER_TARGET_COLLECTION_NAME"

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->collectionName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    const-string v2, "ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_GUID"

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->catalogGUID:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const-string v2, "ASSET_CONTAINER_TARGET_COLLECTION_CATALOG_NAME"

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;->catalogName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->setArguments(Landroid/os/Bundle;)V

    .line 106
    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->PushHostFragment(Landroid/support/v4/app/Fragment;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 174
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 176
    if-nez p1, :cond_9

    .line 177
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->startWithClientData()V

    .line 193
    :cond_8
    :goto_8
    return-void

    .line 188
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 189
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->getBackStackEntryCount()I

    move-result v1

    if-nez v1, :cond_8

    .line 190
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->startWithClientData()V

    goto :goto_8
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 197
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 198
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    if-eqz v0, :cond_b

    .line 199
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_assetViewFragmentHostActivity:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewBrowserFragmentHostActivity;

    .line 201
    :cond_b
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 66
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 68
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$1;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_commandsHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;

    .line 69
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->setRetainInstance(Z)V

    .line 70
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 71
    .local v0, "browserArgs":Landroid/os/Bundle;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getConfigurationFromBundle(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    .line 72
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getExtraConfigurationFromBundle(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_extraConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    .line 75
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->getDataSourcesFilter()Ljava/util/EnumSet;

    move-result-object v1

    if-eqz v1, :cond_33

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->getDataSourcesFilter()Ljava/util/EnumSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/EnumSet;->size()I

    move-result v1

    if-nez v1, :cond_47

    .line 76
    :cond_33
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_browserConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 77
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->loadDataSources(Z)V

    .line 79
    :cond_47
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, -0x1

    .line 160
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 161
    .local v0, "rootLayout":Landroid/widget/FrameLayout;
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    const/16 v1, 0x1234

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_rootViewId:I

    .line 165
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_rootViewId:I

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setId(I)V

    .line 167
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 169
    return-object v0
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 237
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 238
    return-void
.end method

.method public onDestroyView()V
    .registers 1

    .prologue
    .line 229
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->destorySharedInstance()V

    .line 230
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 231
    return-void
.end method

.method public onResume()V
    .registers 2

    .prologue
    .line 212
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 213
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_popToRootOnResume:Z

    if-eqz v0, :cond_d

    .line 214
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_popToRootOnResume:Z

    .line 215
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->performPopToRoot()V

    .line 217
    :cond_d
    return-void
.end method

.method public onStart()V
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_commandsHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;->onStart()V

    .line 207
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 208
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_commandsHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment$BrowserCommandsHandler;->onStop()V

    .line 223
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 224
    return-void
.end method

.method showFragmentAsRoot(Landroid/support/v4/app/Fragment;)V
    .registers 5
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 119
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 120
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->_rootViewId:I

    invoke-virtual {v1, v2, p1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 121
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 122
    return-void
.end method

.method public startWithClientData()V
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewMainBrowserFragment;->startWithClientArguments(Landroid/os/Bundle;)V

    .line 155
    return-void
.end method
