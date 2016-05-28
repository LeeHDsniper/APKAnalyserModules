.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;
.super Ljava/lang/Object;
.source "AdobeAssetViewBrowserControllerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    }
.end annotation


# static fields
.field private static _appIdFromPreference:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->_appIdFromPreference:Ljava/lang/String;

    return-void
.end method

.method private static getAllSupportedDataSourcesList()Ljava/util/EnumSet;
    .registers 7
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
    .line 194
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePhotos:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-static {v4, v5, v6}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    .line 197
    .local v1, "dataSourceTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getDataSourceTypes()Ljava/util/EnumSet;

    move-result-object v2

    .line 199
    .local v2, "mobileCreationSrcs":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-virtual {v2}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_12
    :goto_12
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 201
    .local v3, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/MobileCreationsDataSourceFactory;->getDataSourceByType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;

    move-result-object v0

    .line 202
    .local v0, "dataSource":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;->getCount()I

    move-result v5

    if-eqz v5, :cond_12

    .line 204
    invoke-virtual {v1, v3}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 208
    .end local v0    # "dataSource":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource;
    .end local v3    # "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    :cond_32
    return-object v1
.end method

.method public static getAssetViewConfigurationBundle(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 9
    .param p0, "datasource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p1, "mainBrowserBundle"    # Landroid/os/Bundle;
    .param p2, "collectionHref"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 58
    .local v0, "assetConfigBundle":Landroid/os/Bundle;
    const-string v4, "ASSET_CONTAINER_DATA_SOURCE_TYPE"

    invoke-virtual {v0, v4, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 60
    if-eqz p1, :cond_38

    .line 62
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 63
    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/EnumSet;

    .line 65
    .local v2, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    if-eqz v2, :cond_1b

    .line 66
    const-string v4, "ASSET_CONTAINER_MIME_FILTERS"

    invoke-virtual {v0, v4, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 69
    :cond_1b
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 70
    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    .line 73
    .local v3, "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    if-eq v3, v4, :cond_40

    const/4 v1, 0x1

    .line 75
    .local v1, "isFilterInclusive":Z
    :goto_28
    const-string v4, "ASSET_CONTAINER_MIME_TYPES_FILTER"

    invoke-virtual {v0, v4, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 78
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 81
    .end local v1    # "isFilterInclusive":Z
    .end local v2    # "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    .end local v3    # "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    :cond_38
    if-eqz p2, :cond_3f

    .line 82
    const-string v4, "ASSET_CONTAINER_TARGET_COLLECTION_HREF"

    invoke-virtual {v0, v4, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :cond_3f
    return-object v0

    .line 73
    .restart local v2    # "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    .restart local v3    # "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    :cond_40
    const/4 v1, 0x0

    goto :goto_28
.end method

.method public static getAssetViewFragmentDetails(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataSourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "browserArgsBundle"    # Landroid/os/Bundle;
    .param p3, "collectionHref"    # Ljava/lang/String;

    .prologue
    .line 100
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;-><init>()V

    .line 102
    .local v0, "fragmentDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_16

    .line 103
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getCCFilesContainerFragmentClass(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    .line 123
    :cond_f
    :goto_f
    invoke-static {p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAssetViewConfigurationBundle(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->argumentsBundle:Landroid/os/Bundle;

    .line 125
    return-object v0

    .line 105
    :cond_16
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePhotos:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_1f

    .line 106
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewPhotoCollectionContainerFragment;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    goto :goto_f

    .line 108
    :cond_1f
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_28

    .line 109
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionContainerFragment;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    goto :goto_f

    .line 111
    :cond_28
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p1, v1, :cond_34

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p1, v1, :cond_34

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_39

    .line 115
    :cond_34
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    goto :goto_f

    .line 117
    :cond_39
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p1, v1, :cond_41

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p1, v1, :cond_f

    .line 120
    :cond_41
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCompositionsContainerFragment;

    iput-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    goto :goto_f
.end method

.method public static getBaseHostFragmentFromClientBundle(Landroid/content/Context;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "browserArgs"    # Landroid/os/Bundle;
    .param p2, "browserConfig"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    .prologue
    .line 165
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, p2, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getBaseHostFragmentFromClientBundle(Landroid/content/Context;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    return-object v0
.end method

.method public static getBaseHostFragmentFromClientBundle(Landroid/content/Context;Landroid/os/Bundle;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "browserArgs"    # Landroid/os/Bundle;
    .param p2, "browserConfig"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;
    .param p3, "collectionHref"    # Ljava/lang/String;
    .param p4, "useDropDown"    # Z

    .prologue
    .line 171
    const/4 v1, 0x0

    .line 173
    .local v1, "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getDataSourcesListToDisplayFromBundle(Landroid/os/Bundle;)Ljava/util/EnumSet;

    move-result-object v0

    .line 175
    .local v0, "dataSources":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/util/EnumSet;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_1d

    .line 177
    :cond_e
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;

    .end local v1    # "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewDataAssetsTabsHostFragment;-><init>()V

    .line 178
    .restart local v1    # "hostFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->setArguments(Landroid/os/Bundle;)V

    .line 186
    :goto_16
    if-nez p4, :cond_1c

    .line 187
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->setShouldUseDropDownActionBar(Z)V

    .line 189
    :cond_1c
    return-object v1

    .line 183
    :cond_1d
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getFirstDataSource(Ljava/util/EnumSet;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    move-result-object v2

    invoke-static {p0, v2, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v1

    goto :goto_16
.end method

.method private static getCCFilesContainerFragmentClass(Landroid/content/Context;)Ljava/lang/Class;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->shouldEnableLokiSpecificFeatures(Landroid/content/Context;)Z

    move-result v0

    .line 91
    .local v0, "enableLokiSpecificFeatures":Z
    if-eqz v0, :cond_9

    .line 92
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewCCFilesWithUploadContainerFragment;

    .line 94
    :goto_8
    return-object v1

    :cond_9
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewNewCCFilesContainerFragment;

    goto :goto_8
.end method

.method public static getConfigurationFromBundle(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;
    .registers 11
    .param p0, "browserArgs"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 276
    if-nez p0, :cond_15

    .line 277
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getSharedCloudManager()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudManager;->getDefaultCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v5

    move-object v3, v1

    move v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;-><init>(Ljava/util/EnumSet;ZLjava/util/EnumSet;ZLcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 296
    :goto_14
    return-object v0

    .line 279
    :cond_15
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 280
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/EnumSet;

    .line 281
    .local v1, "dataSourceTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 282
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    .line 283
    .local v6, "filterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;
    sget-object v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    if-eq v6, v9, :cond_4e

    move v7, v2

    .line 286
    .local v7, "isDataSourceFilterInclusive":Z
    :goto_2a
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 287
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/util/EnumSet;

    .line 288
    .local v3, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    sget-object v9, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->MIME_TYPE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 289
    invoke-virtual {p0, v9}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    .line 292
    .local v8, "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    sget-object v9, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    if-eq v8, v9, :cond_50

    move v4, v2

    .line 294
    .local v4, "isFilterInclusive":Z
    :goto_3f
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 296
    .local v5, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;

    move v2, v7

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;-><init>(Ljava/util/EnumSet;ZLjava/util/EnumSet;ZLcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    goto :goto_14

    .end local v3    # "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    .end local v4    # "isFilterInclusive":Z
    .end local v5    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v7    # "isDataSourceFilterInclusive":Z
    .end local v8    # "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    :cond_4e
    move v7, v0

    .line 283
    goto :goto_2a

    .restart local v3    # "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    .restart local v7    # "isDataSourceFilterInclusive":Z
    .restart local v8    # "mimefilterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    :cond_50
    move v4, v0

    .line 292
    goto :goto_3f
.end method

.method public static getCreateNewFolderDialogFragment(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Landroid/support/v4/app/DialogFragment;
    .registers 2
    .param p0, "parentFolder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 347
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadCreateNewFolderMgr;->getCreateNewFolderDialogFragment(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Landroid/support/v4/app/DialogFragment;

    move-result-object v0

    return-object v0
.end method

.method static getDataSourcesListToDisplayFromBundle(Landroid/os/Bundle;)Ljava/util/EnumSet;
    .registers 9
    .param p0, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 213
    if-nez p0, :cond_7

    .line 214
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAllSupportedDataSourcesList()Ljava/util/EnumSet;

    move-result-object v0

    .line 241
    :cond_6
    :goto_6
    return-object v0

    .line 216
    :cond_7
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_ARRAY_KEY:Ljava/lang/String;

    .line 217
    invoke-virtual {p0, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/EnumSet;

    .line 218
    .local v0, "dataSourceTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    sget-object v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->DATA_SOURCE_FILTER_TYPE_KEY:Ljava/lang/String;

    .line 219
    invoke-virtual {p0, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    .line 220
    .local v1, "filterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;
    sget-object v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    if-eq v1, v6, :cond_23

    const/4 v4, 0x1

    .line 222
    .local v4, "isDataSourceFilterInclusive":Z
    :goto_1c
    if-nez v0, :cond_25

    .line 223
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAllSupportedDataSourcesList()Ljava/util/EnumSet;

    move-result-object v0

    goto :goto_6

    .line 220
    .end local v4    # "isDataSourceFilterInclusive":Z
    :cond_23
    const/4 v4, 0x0

    goto :goto_1c

    .line 226
    .restart local v4    # "isDataSourceFilterInclusive":Z
    :cond_25
    if-nez v4, :cond_6

    .line 230
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAllSupportedDataSourcesList()Ljava/util/EnumSet;

    move-result-object v5

    .line 231
    .local v5, "supportedTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAllSupportedDataSourcesList()Ljava/util/EnumSet;

    move-result-object v2

    .line 232
    .local v2, "finalTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-virtual {v0}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_33
    :goto_33
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_49

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 234
    .local v3, "inType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    invoke-virtual {v5, v3}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 235
    invoke-virtual {v2, v3}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    goto :goto_33

    .line 237
    .end local v3    # "inType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    :cond_49
    move-object v0, v2

    .line 241
    goto :goto_6
.end method

.method public static getExtraConfigurationFromBundle(Landroid/os/Bundle;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;
    .registers 6
    .param p0, "browserArgs"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 301
    if-nez p0, :cond_a

    .line 302
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;-><init>(Ljava/lang/String;Z)V

    .line 305
    :goto_9
    return-object v2

    .line 303
    :cond_a
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->START_WITH_COLLECTION_HREF_KEY:Ljava/lang/String;

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "startWithCollectionHref":Ljava/lang/String;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;->SHOULD_USE_DROP_DOWN_KEY:Ljava/lang/String;

    invoke-virtual {p0, v2, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 305
    .local v0, "shouldUseDropDown":Z
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;

    invoke-direct {v2, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserExtraConfiguration;-><init>(Ljava/lang/String;Z)V

    goto :goto_9
.end method

.method private static getFirstDataSource(Ljava/util/EnumSet;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "dataSources":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    invoke-virtual {p0}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 159
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public static getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataSourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .prologue
    const/4 v0, 0x0

    .line 142
    invoke-static {p0, p1, v0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    move-result-object v0

    return-object v0
.end method

.method public static getHostFragmentForDataSource(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "dataSourceType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p2, "browserArgsBundle"    # Landroid/os/Bundle;
    .param p3, "collectionHref"    # Ljava/lang/String;

    .prologue
    .line 148
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory;->getAssetViewFragmentDetails(Landroid/content/Context;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Landroid/os/Bundle;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;

    move-result-object v0

    .line 150
    .local v0, "hostFragmentDetails":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;
    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->classTag:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserControllerFactory$AdobeAssetViewFragmentDetails;->argumentsBundle:Landroid/os/Bundle;

    invoke-static {p0, v2, v3}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;

    .line 152
    .local v1, "hostFragmentInstance":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
    return-object v1
.end method

.method public static getHostFragmentForEditErrorSummary(Ljava/lang/Object;)Landroid/support/v4/app/DialogFragment;
    .registers 4
    .param p0, "data"    # Ljava/lang/Object;

    .prologue
    .line 329
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;-><init>()V

    .local v0, "editErrorDialog":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;
    move-object v1, p0

    .line 330
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;

    .line 341
    .local v1, "editSummary":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeCCFilesEditSession$EditSummary;->_errorAssets:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/edit/AdobeEditErrorSummaryFragment;->setEditFailedList(Ljava/util/ArrayList;)V

    .line 342
    return-object v0
.end method

.method public static getHostFragmentForUploadErrorSummary(Ljava/lang/Object;)Landroid/support/v4/app/DialogFragment;
    .registers 4
    .param p0, "data"    # Ljava/lang/Object;

    .prologue
    .line 311
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment;-><init>()V

    .local v0, "uploadErrorDialog":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment;
    move-object v1, p0

    .line 312
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;

    .line 323
    .local v1, "uploadSummary":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;
    iget-object v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession$UploadSummary;->_errorAssets:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadErrorSummaryFragment;->setUploadFailedList(Ljava/util/ArrayList;)V

    .line 324
    return-object v0
.end method

.method public static shouldShowComponent(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    .registers 5
    .param p0, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 248
    const/4 v0, 0x0

    .line 249
    .local v0, "result":Z
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePhotos:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p0, v1, :cond_10

    .line 251
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v1

    const-string v2, "lightroom"

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v0

    .line 270
    :cond_f
    :goto_f
    return v0

    .line 253
    :cond_10
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p0, v1, :cond_1f

    .line 255
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v1

    const-string v2, "libraries"

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v0

    goto :goto_f

    .line 257
    :cond_1f
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceFiles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p0, v1, :cond_37

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceDraw:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p0, v1, :cond_37

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceLine:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p0, v1, :cond_37

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceSketches:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p0, v1, :cond_37

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourcePSMix:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-eq p0, v1, :cond_37

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;->AdobeAssetDataSourceCompositions:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    if-ne p0, v1, :cond_f

    .line 266
    :cond_37
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v1

    const-string v2, "cc_storage"

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->isEntitledToService(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z

    move-result v0

    goto :goto_f
.end method
