.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;
.super Ljava/lang/Object;
.source "AdobeStorageUtils.java"


# static fields
.field private static _queue:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

.field private static _sDateFormats:[Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 64
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_queue:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestExecutor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static JSONObjectWithData(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 3
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 147
    if-eqz p0, :cond_c

    .line 149
    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_7} :catch_8

    .line 156
    :goto_7
    return-object v1

    .line 150
    :catch_8
    move-exception v0

    .line 152
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 156
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_c
    const/4 v1, 0x0

    goto :goto_7
.end method

.method public static cacheKeyForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;
    .registers 8
    .param p0, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .param p2, "dimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p3, "page"    # I

    .prologue
    .line 303
    const-string v0, "%s-%d_%d-%d-%d"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->getIntVal()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertStringToDate(Ljava/lang/String;)Ljava/util/Date;
    .registers 8
    .param p0, "inputStrDate"    # Ljava/lang/String;

    .prologue
    .line 212
    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;

    monitor-enter v3

    .line 213
    :try_start_3
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    if-nez v2, :cond_54

    .line 214
    const/4 v2, 0x6

    new-array v2, v2, [Ljava/text/SimpleDateFormat;

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    .line 215
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x0

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 216
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x1

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 217
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x2

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "EEE, dd MMM yyyy HH:mm:ss z"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 218
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x3

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "EEE, dd MMM yyyy HH:mm:ss Z"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 219
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x4

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZ"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 220
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    const/4 v4, 0x5

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    aput-object v5, v2, v4

    .line 222
    :cond_54
    monitor-exit v3
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_6b

    .line 224
    if-eqz p0, :cond_6e

    .line 225
    const/4 v1, 0x0

    .line 226
    .local v1, "result":Ljava/util/Date;
    const/4 v0, 0x0

    .line 227
    .local v0, "i":I
    :goto_59
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    array-length v2, v2

    if-ge v0, v2, :cond_6f

    if-nez v1, :cond_6f

    .line 228
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->_sDateFormats:[Ljava/text/SimpleDateFormat;

    aget-object v2, v2, v0

    invoke-static {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->convertToDate(Ljava/text/SimpleDateFormat;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 229
    add-int/lit8 v0, v0, 0x1

    goto :goto_59

    .line 222
    .end local v0    # "i":I
    .end local v1    # "result":Ljava/util/Date;
    :catchall_6b
    move-exception v2

    :try_start_6c
    monitor-exit v3
    :try_end_6d
    .catchall {:try_start_6c .. :try_end_6d} :catchall_6b

    throw v2

    .line 236
    :cond_6e
    const/4 v1, 0x0

    :cond_6f
    return-object v1
.end method

.method private static convertToDate(Ljava/text/SimpleDateFormat;Ljava/lang/String;)Ljava/util/Date;
    .registers 4
    .param p0, "dateFormat"    # Ljava/text/SimpleDateFormat;
    .param p1, "inputStrDate"    # Ljava/lang/String;

    .prologue
    .line 195
    const/4 v0, 0x0

    .line 197
    .local v0, "result":Ljava/util/Date;
    if-eqz p0, :cond_7

    .line 198
    :try_start_3
    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_6
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_6} :catch_8

    move-result-object v0

    .line 204
    :cond_7
    :goto_7
    return-object v0

    .line 200
    :catch_8
    move-exception v1

    goto :goto_7
.end method

.method public static generateUuid()Ljava/lang/String;
    .registers 1

    .prologue
    .line 160
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMimeTypeFromString(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    .registers 7
    .param p0, "inMimeTypeString"    # Ljava/lang/String;

    .prologue
    .line 242
    const/4 v0, 0x0

    .line 243
    .local v0, "mimeType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    if-eqz p0, :cond_18

    .line 244
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    move-result-object v1

    .line 245
    .local v1, "mimeTypes":[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_9
    if-ge v3, v4, :cond_18

    aget-object v2, v1, v3

    .line 246
    .local v2, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->getMimeType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 247
    move-object v0, v2

    .line 252
    .end local v1    # "mimeTypes":[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    .end local v2    # "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    :cond_18
    return-object v0

    .line 245
    .restart local v1    # "mimeTypes":[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    .restart local v2    # "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method public static isMimeTypeFilterPresent(Ljava/util/EnumSet;Ljava/lang/String;)Z
    .registers 4
    .param p1, "typeStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 258
    .local p0, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    const/4 v0, 0x0

    .line 260
    .local v0, "isPresent":Z
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->getMimeTypeFromString(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    move-result-object v1

    .line 262
    .local v1, "mimeTypeOfAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    if-eqz v1, :cond_c

    .line 264
    invoke-virtual {p0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 269
    :goto_b
    return v0

    .line 267
    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static shouldFilterAssetMimeType(Ljava/util/EnumSet;Ljava/lang/String;Z)Z
    .registers 6
    .param p1, "assetTypeStr"    # Ljava/lang/String;
    .param p2, "isInclusive"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;",
            "Ljava/lang/String;",
            "Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    const/4 v1, 0x0

    .line 275
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/util/EnumSet;->size()I

    move-result v2

    if-nez v2, :cond_b

    :cond_9
    move v0, v1

    .line 279
    :cond_a
    :goto_a
    return v0

    .line 278
    :cond_b
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->isMimeTypeFilterPresent(Ljava/util/EnumSet;Ljava/lang/String;)Z

    move-result v0

    .line 279
    .local v0, "isMimeTypePresent":Z
    if-eqz p2, :cond_a

    if-nez v0, :cond_15

    const/4 v0, 0x1

    goto :goto_a

    :cond_15
    move v0, v1

    goto :goto_a
.end method
