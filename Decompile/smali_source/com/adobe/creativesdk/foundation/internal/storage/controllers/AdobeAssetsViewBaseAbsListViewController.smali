.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseListViewController;
.source "AdobeAssetsViewBaseAbsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController$IThumbnailLoadCompletionHandler;
    }
.end annotation


# instance fields
.field private final _requestedThumbnails:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->_requestedThumbnails:Ljava/util/HashMap;

    return-object v0
.end method

.method public static adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .registers 7
    .param p0, "thumbnailSizedRendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    .prologue
    .line 277
    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->getAdjustedDimension(F)D

    move-result-wide v4

    double-to-float v2, v4

    .line 278
    .local v2, "newWidth":F
    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->getAdjustedDimension(F)D

    move-result-wide v4

    double-to-float v0, v4

    .line 280
    .local v0, "newHeight":F
    new-instance v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v1, v2, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    .line 281
    .local v1, "newImageDims":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    return-object v1
.end method

.method public static getAdjustedDimension(F)D
    .registers 9
    .param p0, "value"    # F

    .prologue
    .line 238
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v3

    .line 239
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 244
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    float-to-double v0, p0

    .line 246
    .local v0, "adjustedDim":D
    iget v3, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    const/16 v4, 0x140

    if-lt v3, v4, :cond_1c

    .line 247
    const/high16 v3, 0x40000000

    mul-float/2addr v3, p0

    float-to-double v0, v3

    .line 251
    :cond_1b
    :goto_1b
    return-wide v0

    .line 248
    :cond_1c
    iget v3, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    const/16 v4, 0xa0

    if-le v3, v4, :cond_1b

    .line 249
    float-to-double v4, p0

    const-wide/high16 v6, 0x3ff8000000000000L

    mul-double v0, v4, v6

    goto :goto_1b
.end method
