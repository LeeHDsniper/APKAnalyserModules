.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;
.super Ljava/lang/Object;
.source "AdobeAssetViewUtils.java"


# static fields
.field public static ASSETVIEW_NAVIGATE_ISROOT_KEY:Ljava/lang/String;

.field public static ASSETVIEW_NAVIGATE_TARGETCOLLECTION_NAME:Ljava/lang/String;

.field public static ASSET_ONE_UP_ACTIVITY_REQUEST:I

.field public static LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

.field public static MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

.field public static PHOTO_ONE_UP_ACTIVITY_REQUEST:I

.field public static TARGET_COLLECTION_KEY:Ljava/lang/String;

.field private static _appIdFromPreference:Ljava/lang/String;

.field private static _cameraCheckedResult:I

.field private static k_ONE_DP_TO_PIXELS:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->k_ONE_DP_TO_PIXELS:I

    .line 46
    const/16 v0, 0x856

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->ASSET_ONE_UP_ACTIVITY_REQUEST:I

    .line 47
    const/16 v0, 0x857

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->PHOTO_ONE_UP_ACTIVITY_REQUEST:I

    .line 48
    const/16 v0, 0x858

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->LIBRARY_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    .line 49
    const/16 v0, 0x859

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->MOBILE_PACKAGE_ITEMS_ONE_UP_ACTIVITY_REQUEST:I

    .line 52
    const-string v0, "TARGET_COLLECTION"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->TARGET_COLLECTION_KEY:Ljava/lang/String;

    .line 53
    const-string v0, "isCollectionRoot"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->ASSETVIEW_NAVIGATE_ISROOT_KEY:Ljava/lang/String;

    .line 54
    const-string v0, "targetCollectionName"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->ASSETVIEW_NAVIGATE_TARGETCOLLECTION_NAME:Ljava/lang/String;

    .line 56
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_appIdFromPreference:Ljava/lang/String;

    .line 57
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_cameraCheckedResult:I

    return-void
.end method

.method public static convertDpToPx(I)I
    .registers 3
    .param p0, "dp"    # I

    .prologue
    .line 106
    int-to-float v0, p0

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public static deviceHasCameraFeature(Landroid/content/Context;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 79
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_cameraCheckedResult:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_16

    .line 81
    const/4 v0, 0x1

    .line 83
    .local v0, "hasCamera":Z
    :try_start_7
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 84
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const-string v2, "android.hardware.camera.any"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_10} :catch_1f

    move-result v0

    .line 89
    .end local v1    # "pm":Landroid/content/pm/PackageManager;
    :goto_11
    if-eqz v0, :cond_1b

    move v2, v3

    :goto_14
    sput v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_cameraCheckedResult:I

    .line 91
    .end local v0    # "hasCamera":Z
    :cond_16
    sget v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_cameraCheckedResult:I

    if-ne v2, v3, :cond_1d

    :goto_1a
    return v3

    .line 89
    .restart local v0    # "hasCamera":Z
    :cond_1b
    const/4 v2, 0x2

    goto :goto_14

    .line 91
    .end local v0    # "hasCamera":Z
    :cond_1d
    const/4 v3, 0x0

    goto :goto_1a

    .line 86
    .restart local v0    # "hasCamera":Z
    :catch_1f
    move-exception v2

    goto :goto_11
.end method

.method public static getAdobeFontFormattedString(Ljava/lang/String;Landroid/app/Activity;)Landroid/text/SpannableString;
    .registers 10
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/16 v7, 0x21

    const/4 v6, 0x0

    .line 211
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 212
    .local v0, "adobeString":Landroid/text/SpannableString;
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 213
    .local v1, "font":Landroid/graphics/Typeface;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 214
    .local v2, "typefaceSpan":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v3

    invoke-virtual {v0, v2, v6, v3, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 216
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_browser_dark_text:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v4

    invoke-virtual {v0, v3, v6, v4, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 218
    return-object v0
.end method

.method public static getAssetFolderFromHref(Ljava/lang/String;Z)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 8
    .param p0, "targetCollectionHref"    # Ljava/lang/String;
    .param p1, "getRootIfNull"    # Z

    .prologue
    .line 244
    const/4 v5, 0x0

    .line 246
    .local v5, "targetFolder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getLastOrderField()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    move-result-object v2

    .line 247
    .local v2, "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getLastOrderDirection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    move-result-object v1

    .line 249
    .local v1, "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    if-eqz p0, :cond_15

    .line 251
    const/4 v3, 0x0

    .line 253
    .local v3, "targetCollectionURI":Ljava/net/URI;
    :try_start_c
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/net/URISyntaxException; {:try_start_c .. :try_end_11} :catch_1e

    .line 254
    .end local v3    # "targetCollectionURI":Ljava/net/URI;
    .local v4, "targetCollectionURI":Ljava/net/URI;
    :try_start_11
    invoke-static {v4, v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getFolderFromDirectHref(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    :try_end_14
    .catch Ljava/net/URISyntaxException; {:try_start_11 .. :try_end_14} :catch_23

    move-result-object v5

    .line 261
    .end local v4    # "targetCollectionURI":Ljava/net/URI;
    :cond_15
    :goto_15
    if-nez v5, :cond_1d

    if-eqz p1, :cond_1d

    .line 263
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getRootOrderedByField(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v5

    .line 266
    :cond_1d
    return-object v5

    .line 255
    .restart local v3    # "targetCollectionURI":Ljava/net/URI;
    :catch_1e
    move-exception v0

    .line 257
    .local v0, "e":Ljava/net/URISyntaxException;
    :goto_1f
    invoke-virtual {v0}, Ljava/net/URISyntaxException;->printStackTrace()V

    goto :goto_15

    .line 255
    .end local v0    # "e":Ljava/net/URISyntaxException;
    .end local v3    # "targetCollectionURI":Ljava/net/URI;
    .restart local v4    # "targetCollectionURI":Ljava/net/URI;
    :catch_23
    move-exception v0

    move-object v3, v4

    .end local v4    # "targetCollectionURI":Ljava/net/URI;
    .restart local v3    # "targetCollectionURI":Ljava/net/URI;
    goto :goto_1f
.end method

.method public static getAssetRenditionUtil(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 6
    .param p0, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 298
    .local p2, "onCompleteCallBack":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/Bitmap;>;"
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 299
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1;

    invoke-direct {v2, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1;-><init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 298
    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 315
    return-void
.end method

.method public static getBitmapFromData([BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 5
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 288
    .local p1, "onCompleteCallBack":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/Bitmap;>;"
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;

    invoke-direct {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;-><init>(Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 289
    .local v1, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;
    const/4 v2, 0x1

    new-array v0, v2, [[B

    .line 290
    .local v0, "arrayOfByteArray":[[B
    const/4 v2, 0x0

    aput-object p0, v0, v2

    .line 291
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils$1DecodeImageInBackgroundTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 292
    return-void
.end method

.method public static getLastOrderDirection()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    .registers 3

    .prologue
    .line 234
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    if-ne v1, v2, :cond_b

    .line 235
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .line 238
    .local v0, "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    :goto_a
    return-object v0

    .line 237
    .end local v0    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;->ADOBE_ASSET_FOLDER_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;

    .restart local v0    # "orderDirection":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderDirection;
    goto :goto_a
.end method

.method public static getLastOrderField()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    .registers 3

    .prologue
    .line 224
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_ALPHA:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v1, v2, :cond_b

    .line 225
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_NAME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .line 228
    .local v0, "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :goto_a
    return-object v0

    .line 227
    .end local v0    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;->ADOBE_ASSET_FOLDER_ORDER_BY_MODIFIED:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;

    .restart local v0    # "orderField":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolderOrderBy;
    goto :goto_a
.end method

.method public static shouldEnableLokiSpecificFeatures(Landroid/content/Context;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 61
    if-nez p0, :cond_4

    .line 75
    :cond_3
    :goto_3
    return v1

    .line 64
    :cond_4
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_appIdFromPreference:Ljava/lang/String;

    if-nez v2, :cond_1a

    .line 66
    :try_start_8
    const-string v2, "com.adobe.ccsdk.ccAssetsContainer_private_preference"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 67
    .local v0, "preferences":Landroid/content/SharedPreferences;
    if-eqz v0, :cond_1a

    .line 68
    const-string v2, "ccfilescontainer_private_appId"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_appIdFromPreference:Ljava/lang/String;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1a} :catch_2a

    .line 75
    .end local v0    # "preferences":Landroid/content/SharedPreferences;
    :cond_1a
    :goto_1a
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_appIdFromPreference:Ljava/lang/String;

    if-eqz v2, :cond_3

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->_appIdFromPreference:Ljava/lang/String;

    const-string v3, "com.adobe.cc.android.loki"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v1, 0x1

    goto :goto_3

    .line 71
    :catch_2a
    move-exception v2

    goto :goto_1a
.end method
