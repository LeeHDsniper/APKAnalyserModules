.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;
.super Ljava/lang/Object;
.source "AdobeStorageLibrarySelectionState.java"


# static fields
.field private static _sIsSelectModeActive:Z

.field private static _selectLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field private static _selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;


# direct methods
.method private static creationSelectionLibrary(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    .registers 5
    .param p0, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    .param p1, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 79
    if-eqz p0, :cond_4

    if-nez p1, :cond_6

    .line 80
    :cond_4
    const/4 v1, 0x0

    .line 94
    :cond_5
    :goto_5
    return-object v1

    .line 82
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v0, "itemsIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getItemID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 85
    .local v1, "selectionLibraryAsset":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;
    instance-of v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    if-eqz v2, :cond_1f

    .line 86
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->setSelectedColorIDs(Ljava/util/ArrayList;)V

    goto :goto_5

    .line 88
    :cond_1f
    instance-of v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    if-eqz v2, :cond_27

    .line 89
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->setSelectedColorThemeIDs(Ljava/util/ArrayList;)V

    goto :goto_5

    .line 91
    :cond_27
    instance-of v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-eqz v2, :cond_5

    .line 92
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->setSelectedImageIDs(Ljava/util/ArrayList;)V

    goto :goto_5
.end method

.method public static creationSelectionLibraryFromCurrentSelection()Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    .registers 2

    .prologue
    .line 75
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->creationSelectionLibrary(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;

    move-result-object v0

    return-object v0
.end method

.method public static getSelectedLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    .registers 1

    .prologue
    .line 58
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    return-object v0
.end method

.method public static hasSelection()Z
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isLibraryItemSame(Ljava/lang/String;)Z
    .registers 3
    .param p0, "itemID"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x0

    .line 68
    .local v0, "result":Z
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    if-eqz v1, :cond_11

    if-eqz p0, :cond_11

    .line 69
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->getItemID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 71
    :cond_11
    return v0
.end method

.method public static isSelectModeActive()Z
    .registers 1

    .prologue
    .line 37
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_sIsSelectModeActive:Z

    return v0
.end method

.method public static resetSelection()V
    .registers 1

    .prologue
    .line 50
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .line 51
    return-void
.end method

.method public static selectLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 2
    .param p0, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    .param p1, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 45
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .line 46
    sput-object p1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_selectLibrary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 47
    return-void
.end method

.method public static setSelectModeActive(Z)V
    .registers 1
    .param p0, "selectModeActive"    # Z

    .prologue
    .line 41
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->_sIsSelectModeActive:Z

    .line 42
    return-void
.end method
