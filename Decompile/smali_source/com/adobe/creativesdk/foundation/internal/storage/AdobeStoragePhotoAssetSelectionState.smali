.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;
.super Ljava/lang/Object;
.source "AdobeStoragePhotoAssetSelectionState.java"


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
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 44
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive:Z

    .line 45
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeSupported:Z

    .line 46
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 51
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->_selectionStateTimeStamp:I

    return-void
.end method

.method public static addSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 4
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 81
    if-nez p0, :cond_3

    .line 90
    :goto_2
    return-void

    .line 84
    :cond_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->setSelectionStateChanged()V

    .line 85
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 88
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_2
.end method

.method public static containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)Z
    .registers 3
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 122
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getCurrentSelectionTimeStamp()I
    .registers 1

    .prologue
    .line 62
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->_selectionStateTimeStamp:I

    return v0
.end method

.method public static isMultiSelectModeActive()Z
    .registers 1

    .prologue
    .line 174
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive:Z

    return v0
.end method

.method public static removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 4
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 100
    if-nez p0, :cond_3

    .line 110
    :goto_2
    return-void

    .line 103
    :cond_3
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->setSelectionStateChanged()V

    .line 104
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;->getGUID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 107
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_2
.end method

.method public static resetSelectedAssets()V
    .registers 3

    .prologue
    .line 141
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 142
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->setSelectionStateChanged()V

    .line 143
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetAssetCountChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 144
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 145
    return-void
.end method

.method public static selectedAssetCount()I
    .registers 1

    .prologue
    .line 132
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

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
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 220
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssets()Ljava/util/HashMap;

    move-result-object v0

    .line 221
    .local v0, "selectDict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
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
    .line 154
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive:Z

    if-ne v1, p0, :cond_5

    .line 165
    :goto_4
    return-void

    .line 157
    :cond_5
    sget-boolean v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive:Z

    if-eqz v1, :cond_e

    if-nez p0, :cond_e

    .line 158
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->resetSelectedAssets()V

    .line 160
    :cond_e
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->isMultiSelectModeActive:Z

    .line 162
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageSelectedAssetMultiselectModeDidChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 163
    .local v0, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    goto :goto_4
.end method

.method private static setSelectionStateChanged()V
    .registers 1

    .prologue
    .line 66
    sget v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->_selectionStateTimeStamp:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->_selectionStateTimeStamp:I

    .line 67
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
            "Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    if-nez v0, :cond_b

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    .line 58
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStoragePhotoAssetSelectionState;->sharedSelectedAssetsCollection:Ljava/util/HashMap;

    return-object v0
.end method
