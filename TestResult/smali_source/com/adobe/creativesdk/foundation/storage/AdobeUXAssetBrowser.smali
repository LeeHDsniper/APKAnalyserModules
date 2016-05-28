.class public Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;
.super Ljava/lang/Object;
.source "AdobeUXAssetBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;
    }
.end annotation


# static fields
.field protected static AdobeUXAssetBrowserFilterWithAdobeContent:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation
.end field

.field protected static AdobeUXAssetBrowserFilterWithBasicImages:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 58
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_BMP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 59
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->AdobeUXAssetBrowserFilterWithBasicImages:Ljava/util/EnumSet;

    .line 62
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_ILLUSTRATOR:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 63
    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->AdobeUXAssetBrowserFilterWithAdobeContent:Ljava/util/EnumSet;

    .line 65
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;
    .param p1, "x1"    # Landroid/content/Intent;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->setBrowserConfigurationDetails(Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V

    return-void
.end method

.method public static getSharedInstance()Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;
    .registers 2

    .prologue
    .line 73
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    if-nez v0, :cond_13

    .line 75
    const-class v1, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    monitor-enter v1

    .line 77
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    if-nez v0, :cond_12

    .line 79
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    .line 81
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 84
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->sharedBrowser:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;

    return-object v0

    .line 81
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private setBrowserConfigurationDetails(Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
    .registers 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "configuration"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
        }
    .end annotation

    .prologue
    .line 213
    if-nez p2, :cond_3

    .line 242
    :goto_2
    return-void

    .line 216
    :cond_3
    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->mimeTypeFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    if-eqz v2, :cond_1d

    .line 217
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_ARRAY_KEY:Ljava/lang/String;

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->mimeTypeFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->getMimeTypes()Ljava/util/EnumSet;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 218
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_TYPE_KEY:Ljava/lang/String;

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->mimeTypeFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->getFilterType()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 221
    :cond_1d
    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->dataSourceFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;

    if-eqz v2, :cond_33

    .line 223
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->dataSourceFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->getInclusiveDataSources()Ljava/util/EnumSet;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 224
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_TYPE_KEY:Ljava/lang/String;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 227
    :cond_33
    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    if-eqz v2, :cond_49

    .line 228
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_ARRAY_KEY:Ljava/lang/String;

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->getInclusiveDesignLibraryItems()Ljava/util/EnumSet;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 229
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DESIGNLIBRARYITEMS_FILTER_TYPE_KEY:Ljava/lang/String;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 231
    :cond_49
    iget-object v2, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v2, :cond_65

    .line 232
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    .line 233
    .local v0, "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-eqz v0, :cond_5d

    .line 234
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_2

    .line 236
    :cond_5d
    new-instance v1, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    sget-object v2, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;->AdobeNetworkErrorNoCloudSpecified:Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;-><init>(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException$AdobeNetworkErrorCode;)V

    .line 237
    .local v1, "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    throw v1

    .line 240
    .end local v0    # "defaultCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v1    # "error":Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;
    :cond_65
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_2
.end method


# virtual methods
.method public popupFileBrowser(Landroid/app/Activity;ILcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V
    .registers 23
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .param p3, "configuration"    # Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;
        }
    .end annotation

    .prologue
    .line 116
    if-eqz p3, :cond_c8

    move-object/from16 v0, p3

    iget-object v14, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->options:Ljava/util/EnumSet;

    .line 119
    .local v14, "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    :goto_6
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 120
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortTypeSetByUser()Z

    move-result v2

    if-nez v2, :cond_28

    .line 122
    sget-object v16, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 124
    .local v16, "sortType":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    if-eqz v14, :cond_25

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SORT_ALPHABETICALLY_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 126
    sget-object v16, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .line 128
    :cond_25
    invoke-static/range {v16 .. v16}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->setLastSortType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;)V

    .line 131
    .end local v16    # "sortType":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    :cond_28
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastVisualSetByUser()Z

    move-result v2

    if-nez v2, :cond_3f

    .line 133
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 135
    .local v17, "visualLayout":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;
    if-eqz v14, :cond_3c

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_LIST_VIEW_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 137
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_LISTVIEW:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .line 139
    :cond_3c
    invoke-static/range {v17 .. v17}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->setLastVisualLayout(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V

    .line 142
    .end local v17    # "visualLayout":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;
    :cond_3f
    if-eqz v14, :cond_cb

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MYACCOUNT_OPTION:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_cb

    const/4 v15, 0x1

    .line 143
    .local v15, "shouldEnableMyAccountOption":Z
    :goto_4a
    invoke-static {v15}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeCSDKInternalClientsPreferences;->setClientPreferenceEnableMyAccount(Z)V

    .line 145
    if-eqz v14, :cond_ce

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ce

    const/4 v13, 0x1

    .line 146
    .local v13, "isMultiSelectSupported":Z
    :goto_58
    if-eqz v14, :cond_d0

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d0

    const/4 v12, 0x1

    .line 148
    .local v12, "isMultiSelectActive":Z
    :goto_63
    invoke-static {v13}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setIsMultiSelectModeSupported(Z)V

    .line 149
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported()Z

    move-result v2

    if-eqz v2, :cond_d2

    .line 150
    invoke-static {v12}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setIsMultiSelectModeActive(Z)V

    .line 156
    :goto_6f
    if-eqz v14, :cond_d7

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-virtual {v14, v2}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d7

    .line 158
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->setIsMultiSelectModeActive(Z)V

    .line 163
    :goto_7d
    const/4 v9, 0x0

    .line 166
    .local v9, "handler":Landroid/os/Handler;
    :try_start_7e
    new-instance v10, Landroid/os/Handler;

    invoke-direct {v10}, Landroid/os/Handler;-><init>()V
    :try_end_83
    .catch Ljava/lang/RuntimeException; {:try_start_7e .. :try_end_83} :catch_dc

    .end local v9    # "handler":Landroid/os/Handler;
    .local v10, "handler":Landroid/os/Handler;
    move-object v9, v10

    .line 172
    .end local v10    # "handler":Landroid/os/Handler;
    .restart local v9    # "handler":Landroid/os/Handler;
    :goto_84
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->resetSelection()V

    .line 173
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->setSelectModeActive(Z)V

    .line 174
    if-eqz p3, :cond_9d

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;->cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-nez v2, :cond_e1

    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAdobeApplication()Z

    move-result v2

    if-eqz v2, :cond_e1

    .line 178
    :cond_9d
    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;)V

    .line 179
    .local v6, "op":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v18

    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p3

    move/from16 v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Landroid/app/Activity;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;I)V

    new-instance v3, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$2;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v2, v3, v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->refreshClouds(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;Lcom/adobe/creativesdk/foundation/IAdobeGenericErrorCallback;Landroid/os/Handler;)V

    .line 199
    iget-object v2, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;->_error:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    if-eqz v2, :cond_f8

    .line 200
    iget-object v2, v6, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;->_error:Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKException;

    throw v2

    .line 116
    .end local v6    # "op":Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$1Output;
    .end local v9    # "handler":Landroid/os/Handler;
    .end local v12    # "isMultiSelectActive":Z
    .end local v13    # "isMultiSelectSupported":Z
    .end local v14    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    .end local v15    # "shouldEnableMyAccountOption":Z
    :cond_c8
    const/4 v14, 0x0

    goto/16 :goto_6

    .line 142
    .restart local v14    # "options":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    :cond_cb
    const/4 v15, 0x0

    goto/16 :goto_4a

    .line 145
    .restart local v15    # "shouldEnableMyAccountOption":Z
    :cond_ce
    const/4 v13, 0x0

    goto :goto_58

    .line 146
    .restart local v13    # "isMultiSelectSupported":Z
    :cond_d0
    const/4 v12, 0x0

    goto :goto_63

    .line 153
    .restart local v12    # "isMultiSelectActive":Z
    :cond_d2
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setIsMultiSelectModeActive(Z)V

    goto :goto_6f

    .line 160
    :cond_d7
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->setIsMultiSelectModeActive(Z)V

    goto :goto_7d

    .line 167
    .restart local v9    # "handler":Landroid/os/Handler;
    :catch_dc
    move-exception v8

    .line 169
    .local v8, "e":Ljava/lang/RuntimeException;
    invoke-virtual {v8}, Ljava/lang/RuntimeException;->printStackTrace()V

    goto :goto_84

    .line 203
    .end local v8    # "e":Ljava/lang/RuntimeException;
    :cond_e1
    new-instance v11, Landroid/content/Intent;

    const-class v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUxAssetBrowserV2Activity;

    move-object/from16 v0, p1

    invoke-direct {v11, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 205
    .local v11, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v11, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;->setBrowserConfigurationDetails(Landroid/content/Intent;Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;)V

    .line 208
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v0, v11, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 210
    .end local v11    # "intent":Landroid/content/Intent;
    :cond_f8
    return-void
.end method
