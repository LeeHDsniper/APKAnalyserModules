.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;
.super Ljava/lang/Object;
.source "AdobeStorageAssetFileUtils.java"


# static fields
.field public static final FULL_SIZE_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

.field public static final THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v0, v2, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->FULL_SIZE_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    const/high16 v1, 0x437a0000

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    return-void
.end method

.method public static getAssetFileImageDimensions(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .registers 4
    .param p0, "assetFile"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    const/4 v2, 0x0

    .line 47
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v0, v2, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    .line 48
    .local v0, "imageDimensions":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    .line 49
    .local v1, "optionalMetaData":Lorg/json/JSONObject;
    if-eqz v1, :cond_2e

    .line 51
    const-string v2, "height"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    const-string v2, "width"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 55
    :try_start_1c
    const-string v2, "height"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    iput v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    .line 56
    const-string v2, "width"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-float v2, v2

    iput v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_2e} :catch_2f

    .line 61
    :cond_2e
    :goto_2e
    return-object v0

    .line 58
    :catch_2f
    move-exception v2

    goto :goto_2e
.end method

.method public static isRootCollection(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Z
    .registers 5
    .param p0, "collection"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    const/4 v2, 0x0

    .line 36
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v1

    .line 37
    .local v1, "hrefUri":Ljava/net/URI;
    if-eqz v1, :cond_16

    .line 39
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "href":Ljava/lang/String;
    if-eqz v0, :cond_16

    const-string v3, "/files/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_16

    const/4 v2, 0x1

    .line 42
    .end local v0    # "href":Ljava/lang/String;
    :cond_16
    return v2
.end method
