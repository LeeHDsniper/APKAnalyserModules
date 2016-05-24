.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;
.super Ljava/lang/Object;
.source "AdobeStorageAssetSelectionState.java"


# static fields
.field static _selectionStateTimeStamp:I

.field static isMultiSelectModeActive:Z

.field static isMultiSelectModeSupported:Z

.field static sharedSelectedAssetsCollection:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 33
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    .line 34
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported:Z

    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 40
    const/4 v0, 0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->_selectionStateTimeStamp:I

    return-void
.end method

.method public static addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 4
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 69
    if-nez p0, :cond_3

    .line 78
    :goto_2
    return-void

    .line 72
    :cond_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setSelectionStateChanged()V

    .line 73
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 76
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_2
.end method

.method public static containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z
    .registers 3
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 111
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getCurrentSelectionTimeStamp()I
    .registers 1

    .prologue
    .line 51
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->_selectionStateTimeStamp:I

    return v0
.end method

.method public static isMultiSelectModeActive()Z
    .registers 1

    .prologue
    .line 163
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    return v0
.end method

.method public static isMultiSelectModeSupported()Z
    .registers 1

    .prologue
    .line 188
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported:Z

    return v0
.end method

.method public static removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 4
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 88
    if-nez p0, :cond_3

    .line 99
    :goto_2
    return-void

    .line 91
    :cond_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setSelectionStateChanged()V

    .line 93
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 96
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_2
.end method

.method public static resetSelectedAssets()V
    .registers 3

    .prologue
    .line 130
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 131
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->setSelectionStateChanged()V

    .line 132
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 133
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 134
    return-void
.end method

.method public static selectedAssetCount()I
    .registers 1

    .prologue
    .line 121
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    return v0
.end method

.method public static selectedAssets()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v0

    .line 210
    .local v0, "selectDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v1
.end method

.method public static setIsMultiSelectModeActive(Z)V
    .registers 4
    .param p0, "isActive"    # Z

    .prologue
    .line 143
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    if-ne v1, p0, :cond_5

    .line 154
    :goto_4
    return-void

    .line 146
    :cond_5
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    if-eqz v1, :cond_e

    if-nez p0, :cond_e

    .line 147
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 149
    :cond_e
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeActive:Z

    .line 151
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 152
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_4
.end method

.method public static setIsMultiSelectModeSupported(Z)V
    .registers 2
    .param p0, "isSupported"    # Z

    .prologue
    .line 173
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported:Z

    if-ne v0, p0, :cond_5

    .line 179
    :goto_4
    return-void

    .line 175
    :cond_5
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported:Z

    if-eqz v0, :cond_e

    if-nez p0, :cond_e

    .line 176
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->resetSelectedAssets()V

    .line 178
    :cond_e
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->isMultiSelectModeSupported:Z

    goto :goto_4
.end method

.method private static setSelectionStateChanged()V
    .registers 1

    .prologue
    .line 55
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->_selectionStateTimeStamp:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->_selectionStateTimeStamp:I

    .line 56
    return-void
.end method

.method public static sharedSelectedAssets()Ljava/util/HashMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    if-nez v0, :cond_b

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 47
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    return-object v0
.end method
