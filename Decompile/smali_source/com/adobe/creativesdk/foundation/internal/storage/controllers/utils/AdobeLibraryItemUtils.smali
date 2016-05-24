.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;
.super Ljava/lang/Object;
.source "AdobeLibraryItemUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils$Cache;
    }
.end annotation


# direct methods
.method public static getImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 6
    .param p0, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "completionCallback"    # Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;

    .prologue
    .line 69
    .line 70
    invoke-static {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseAbsListViewController;->adjustRenditionSizeBasedOnDeviceScale(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v1

    .line 69
    invoke-static {p0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils$Cache;->getRenditionFromCacheWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)[B

    move-result-object v0

    .line 72
    .local v0, "thumbnailData":[B
    if-eqz v0, :cond_e

    .line 73
    invoke-static {v0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getBitmapFromData([BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 78
    :goto_d
    return-void

    .line 76
    :cond_e
    invoke-static {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->getAssetRenditionUtil(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    goto :goto_d
.end method

.method public static getRenditionFile(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2
    .param p0, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 40
    instance-of v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    if-eqz v0, :cond_b

    .line 41
    check-cast p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .end local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getRenditionFileForImageLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 50
    :goto_a
    return-object v0

    .line 42
    .restart local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_b
    instance-of v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    if-eqz v0, :cond_16

    .line 43
    check-cast p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    .end local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    goto :goto_a

    .line 44
    .restart local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_16
    instance-of v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    if-eqz v0, :cond_21

    .line 45
    check-cast p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    .end local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    goto :goto_a

    .line 46
    .restart local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_21
    instance-of v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    if-eqz v0, :cond_2c

    .line 47
    check-cast p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    .end local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    goto :goto_a

    .line 48
    .restart local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_2c
    instance-of v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    if-eqz v0, :cond_37

    .line 49
    check-cast p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    .end local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    goto :goto_a

    .line 50
    .restart local p0    # "libraryItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    :cond_37
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static getRenditionFileForImageLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 4
    .param p0, "imageItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .prologue
    .line 29
    const/4 v0, 0x0

    .line 30
    .local v0, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getPrimaryComponentType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "image/vnd.adobe.shape+svg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 36
    :goto_11
    return-object v0

    .line 34
    :cond_12
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    goto :goto_11
.end method
