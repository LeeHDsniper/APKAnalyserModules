.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;
.super Ljava/lang/Object;
.source "AdobeAssetMobileCreationSelectionState.java"


# static fields
.field private static _selectPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field private static _selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;


# direct methods
.method private static creationSelectionPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    .registers 5
    .param p0, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "packagePages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 93
    const/4 v0, 0x0

    .line 95
    .local v0, "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    if-eqz p1, :cond_5

    if-nez p0, :cond_7

    .line 96
    :cond_5
    const/4 v1, 0x0

    .line 110
    :goto_6
    return-object v1

    .line 98
    :cond_7
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    if-eqz v1, :cond_1b

    .line 99
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionSketchAsset;

    .end local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionSketchAsset;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;I)V

    .line 100
    .restart local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    :cond_1b
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    if-eqz v1, :cond_2f

    .line 101
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLineAsset;

    .end local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLineAsset;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;I)V

    .line 102
    .restart local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    :cond_2f
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    if-eqz v1, :cond_43

    .line 103
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionDrawAsset;

    .end local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionDrawAsset;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;I)V

    .line 104
    .restart local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    :cond_43
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    if-eqz v1, :cond_57

    .line 105
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPSMixFile;

    .end local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPSMixFile;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSMixFile;I)V

    .line 106
    .restart local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    :cond_57
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    if-eqz v1, :cond_6b

    .line 107
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionCompFile;

    .end local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    move-object v1, p1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionCompFile;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;I)V

    .restart local v0    # "selection":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    :cond_6b
    move-object v1, v0

    .line 110
    goto :goto_6
.end method

.method public static creationSelectionPackageFromCurrentSelection()Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    .registers 2

    .prologue
    .line 88
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->creationSelectionPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;

    move-result-object v0

    return-object v0
.end method

.method public static getSelectedPackageItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 1

    .prologue
    .line 71
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public static hasSelection()Z
    .registers 1

    .prologue
    .line 67
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isPackageItemSame(Ljava/lang/String;)Z
    .registers 3
    .param p0, "itemID"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, "result":Z
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v1, :cond_11

    if-eqz p0, :cond_11

    .line 82
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 84
    :cond_11
    return v0
.end method

.method public static resetSelection()V
    .registers 1

    .prologue
    .line 63
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 64
    return-void
.end method

.method public static selectPackageItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 2
    .param p0, "packgepages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 58
    sput-object p1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackageItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 59
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->_selectPackage:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 60
    return-void
.end method
