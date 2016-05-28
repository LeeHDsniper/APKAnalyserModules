.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;
    }
.end annotation


# instance fields
.field private final AdobeDesignLibraryAssetType_brush:I

.field private final AdobeDesignLibraryAssetType_characterStyle:I

.field private final AdobeDesignLibraryAssetType_color:I

.field private final AdobeDesignLibraryAssetType_colorTheme:I

.field private final AdobeDesignLibraryAssetType_image:I

.field private final AdobeDesignLibraryAssetType_layoutStyle:I

.field private final AdobeDesignLibraryAssetType_look:I

.field private final AdobeDesignLibraryItemsLastViewType:I

.field private final AdobeDesignLibrarySectionViewType:I

.field private final AdobeDesignLibraryViewTypesCount:I

.field final NUM_SECTION_TYPES:I

.field private _brushArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;",
            ">;"
        }
    .end annotation
.end field

.field private _charStylesArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private _colorArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;",
            ">;"
        }
    .end annotation
.end field

.field private _colorThemeArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;",
            ">;"
        }
    .end annotation
.end field

.field private _designLibraryItemsClientConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

.field private _imageItemsArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;",
            ">;"
        }
    .end annotation
.end field

.field private _layoutStylesArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;",
            ">;"
        }
    .end annotation
.end field

.field private _libraryItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

.field private _looksArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;",
            ">;"
        }
    .end annotation
.end field

.field private _targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field private _twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

.field private _uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

.field private _waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x7

    const/4 v1, 0x6

    .line 72
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewRecyclerListViewController;-><init>(Landroid/content/Context;)V

    .line 948
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_color:I

    .line 949
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_colorTheme:I

    .line 950
    const/4 v0, 0x2

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_brush:I

    .line 951
    const/4 v0, 0x3

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_image:I

    .line 952
    const/4 v0, 0x4

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_characterStyle:I

    .line 953
    const/4 v0, 0x5

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_layoutStyle:I

    .line 954
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryAssetType_look:I

    .line 957
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryItemsLastViewType:I

    .line 958
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibrarySectionViewType:I

    .line 959
    const/16 v0, 0x8

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->AdobeDesignLibraryViewTypesCount:I

    .line 961
    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->NUM_SECTION_TYPES:I

    .line 73
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->rebuildLibraryItems()V

    return-void
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;

    return-object v0
.end method

.method private rebuildLibraryItems()V
    .registers 1

    .prologue
    .line 942
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->sortLibraryElementsIntoArraysOfValues()V

    .line 943
    return-void
.end method

.method private shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    .registers 10
    .param p1, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 195
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->shouldEnableLokiSpecificFeatures(Landroid/content/Context;)Z

    move-result v3

    .line 196
    .local v3, "isLoki":Z
    if-eqz v3, :cond_d

    .line 223
    :goto_c
    return v6

    .line 199
    :cond_d
    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    if-nez v7, :cond_1d

    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    if-nez v7, :cond_1d

    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    if-nez v7, :cond_1d

    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    if-eqz v7, :cond_22

    :cond_1d
    move v2, v5

    .line 202
    .local v2, "isItemFromDefaultList":Z
    :goto_1e
    if-eqz v2, :cond_24

    move v6, v5

    .line 203
    goto :goto_c

    .end local v2    # "isItemFromDefaultList":Z
    :cond_22
    move v2, v6

    .line 199
    goto :goto_1e

    .line 205
    .restart local v2    # "isItemFromDefaultList":Z
    :cond_24
    const/4 v4, 0x0

    .line 206
    .local v4, "shouldDisableItem":Z
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_designLibraryItemsClientConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    if-eqz v7, :cond_44

    .line 207
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_designLibraryItemsClientConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->getDesignLibraryItemFilter()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    move-result-object v0

    .line 208
    .local v0, "designLibraryItemFilter":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    if-eqz v0, :cond_44

    .line 209
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->getInclusiveDesignLibraryItems()Ljava/util/EnumSet;

    move-result-object v1

    .line 210
    .local v1, "designLibraryItemTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    if-eqz v1, :cond_44

    .line 211
    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    if-eqz v7, :cond_48

    .line 212
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColors:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-virtual {v1, v7}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_46

    move v4, v5

    .end local v0    # "designLibraryItemFilter":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    .end local v1    # "designLibraryItemTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    :cond_44
    :goto_44
    move v6, v4

    .line 223
    goto :goto_c

    .restart local v0    # "designLibraryItemFilter":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    .restart local v1    # "designLibraryItemTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    :cond_46
    move v4, v6

    .line 212
    goto :goto_44

    .line 214
    :cond_48
    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    if-eqz v7, :cond_58

    .line 215
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColorThemes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-virtual {v1, v7}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_56

    move v4, v5

    :goto_55
    goto :goto_44

    :cond_56
    move v4, v6

    goto :goto_55

    .line 217
    :cond_58
    instance-of v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-eqz v7, :cond_44

    .line 218
    sget-object v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemImages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-virtual {v1, v7}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_66

    move v4, v5

    :goto_65
    goto :goto_44

    :cond_66
    move v4, v6

    goto :goto_65
.end method

.method private shouldDisplayExtendedLibraryItemsInOneUpView()Z
    .registers 2

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->shouldEnableLokiSpecificFeatures(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private sortLibraryElementsIntoArraysOfValues()V
    .registers 4

    .prologue
    .line 83
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)V

    .line 93
    .local v0, "nameOrIdComparator":Ljava/util/Comparator;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getImages()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    .line 94
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 96
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getColorThemes()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    .line 97
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 99
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getColors()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    .line 100
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 102
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getBrushes()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 105
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getCharacterStyles()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;

    .line 106
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 108
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getLayoutStyles()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;

    .line 109
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 111
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;->getLooks()Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;

    .line 112
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 113
    return-void
.end method


# virtual methods
.method protected createRecyclerViewAdapter(Landroid/content/Context;Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/support/v7/widget/RecyclerView;",
            ")",
            "Landroid/support/v7/widget/RecyclerView$Adapter",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 167
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_libraryItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_libraryItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    return-object v0
.end method

.method protected getConcreteRecyclerView(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

    return-object v0
.end method

.method protected getItemDecoration(Landroid/support/v7/widget/RecyclerView;Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->adobe_library_items_spacing_size:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 132
    .local v0, "spacing":I
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    invoke-direct {v1, v0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;-><init>(II)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    .line 133
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)V

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;->setMultiColumnDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration$MultiColumnDelegate;)V

    .line 152
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_uniformItemSpacingItemDecoration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/DesignLibrarySpacingItemDecoration;

    return-object v1
.end method

.method protected getLayoutManager(Landroid/content/Context;)Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 173
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_items_columns_GCM:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    .line 174
    .local v1, "spans_GCM":I
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    invoke-direct {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;-><init>(I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    .line 176
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;I)V

    .line 189
    .local v0, "sectionDetailsDelegate":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->setClientSectionsDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;)V

    .line 190
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    return-object v2
.end method

.method protected getMainRootView(Landroid/content/Context;)Landroid/view/View;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    const-string v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 123
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_assets_library_items_view:I

    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 124
    .local v1, "mainRootView":Landroid/view/View;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_libraryitemsview_swipe_refresh_layout:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 125
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_library_design_items_twowayview:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lorg/lucasr/twowayview/widget/TwoWayView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_twowayRecyclerView:Lorg/lucasr/twowayview/widget/TwoWayView;

    .line 126
    return-object v1
.end method

.method protected getSwipeRefreshLayout()Landroid/support/v4/widget/SwipeRefreshLayout;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-object v0
.end method

.method protected handleItemClick(Landroid/view/View;I)V
    .registers 12
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 233
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;

    .line 234
    .local v5, "viewHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;->getLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    move-result-object v0

    .line 235
    .local v0, "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    if-nez v0, :cond_f

    .line 271
    :cond_e
    :goto_e
    return-void

    .line 238
    :cond_f
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 241
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;-><init>()V

    .line 242
    .local v1, "oneUpData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    iput-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 243
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    .line 245
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_45

    .line 246
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v6

    if-nez v6, :cond_bb

    move v3, v4

    .line 247
    .local v3, "shouldAddColors":Z
    :goto_3c
    if-eqz v3, :cond_45

    .line 248
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 250
    .end local v3    # "shouldAddColors":Z
    :cond_45
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_65

    .line 251
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v6

    if-nez v6, :cond_bd

    move v2, v4

    .line 252
    .local v2, "shouldAddColorThemes":Z
    :goto_5c
    if-eqz v2, :cond_65

    .line 253
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 256
    .end local v2    # "shouldAddColorThemes":Z
    :cond_65
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_84

    .line 257
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v6

    if-nez v6, :cond_bf

    .line 258
    .local v4, "shouldAddImages":Z
    :goto_7b
    if-eqz v4, :cond_84

    .line 259
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 262
    .end local v4    # "shouldAddImages":Z
    :cond_84
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisplayExtendedLibraryItemsInOneUpView()Z

    move-result v6

    if-eqz v6, :cond_a6

    .line 263
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 264
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 265
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 266
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 269
    :cond_a6
    iget-object v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->_itemsList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    iput v6, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;->startIndex:I

    .line 270
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_parentContainer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;

    invoke-interface {v6, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;->handleAssetClickAction(Ljava/lang/Object;)V

    goto/16 :goto_e

    :cond_bb
    move v3, v7

    .line 246
    goto :goto_3c

    :cond_bd
    move v2, v7

    .line 251
    goto :goto_5c

    :cond_bf
    move v4, v7

    .line 257
    goto :goto_7b
.end method

.method public refreshDueToDataChange()V
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_libraryItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->invalidateAdapter()V

    .line 276
    return-void
.end method

.method public refreshDueToNewItemsInsertion()V
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_libraryItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->invalidateAdapter()V

    .line 281
    return-void
.end method

.method public setClientViewConfiguration(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;)V
    .registers 2
    .param p1, "assetViewConfiguration"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_designLibraryItemsClientConfiguration:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;

    .line 285
    return-void
.end method

.method public setTargetLibraryFolder(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 2
    .param p1, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_targetLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 79
    return-void
.end method
