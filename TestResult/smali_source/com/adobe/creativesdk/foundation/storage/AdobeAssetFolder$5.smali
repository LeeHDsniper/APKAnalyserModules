.class synthetic Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;
.super Ljava/lang/Object;
.source "AdobeAssetFolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 464
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection:[I

    :try_start_9
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_45

    :goto_14
    :try_start_14
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderDirection:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_43

    .line 451
    :goto_1f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy:[I

    :try_start_28
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_41

    :goto_33
    :try_start_33
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder$5;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetFolderOrderBy:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3f

    :goto_3e
    return-void

    :catch_3f
    move-exception v0

    goto :goto_3e

    :catch_41
    move-exception v0

    goto :goto_33

    .line 464
    :catch_43
    move-exception v0

    goto :goto_1f

    :catch_45
    move-exception v0

    goto :goto_14
.end method
