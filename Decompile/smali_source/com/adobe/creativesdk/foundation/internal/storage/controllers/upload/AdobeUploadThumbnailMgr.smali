.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;
.super Ljava/lang/Object;
.source "AdobeUploadThumbnailMgr.java"


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;


# instance fields
.field private final CACHE_NUM_ENTRIES:I

.field private _bitmapCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private _thumbnailCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const/16 v0, 0xf

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->CACHE_NUM_ENTRIES:I

    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;)Landroid/util/LruCache;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    return-object v0
.end method

.method public static calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)I
    .registers 10
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p1, "reqDimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    .prologue
    .line 113
    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 114
    .local v1, "height":I
    iget v5, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 115
    .local v5, "width":I
    const/4 v2, 0x1

    .line 117
    .local v2, "inSampleSize":I
    iget v6, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    iget v7, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_23

    iget v4, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    .line 120
    .local v4, "requiredLongestSideLength":F
    :goto_f
    if-le v1, v5, :cond_26

    move v3, v1

    .line 122
    .local v3, "referenceSideLength":I
    :goto_12
    int-to-float v6, v3

    cmpl-float v6, v6, v4

    if-lez v6, :cond_28

    .line 123
    div-int/lit8 v0, v3, 0x2

    .line 127
    .local v0, "halfRefSide":I
    :goto_19
    div-int v6, v0, v2

    int-to-float v6, v6

    cmpl-float v6, v6, v4

    if-lez v6, :cond_28

    .line 128
    mul-int/lit8 v2, v2, 0x2

    goto :goto_19

    .line 117
    .end local v0    # "halfRefSide":I
    .end local v3    # "referenceSideLength":I
    .end local v4    # "requiredLongestSideLength":F
    :cond_23
    iget v4, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    goto :goto_f

    .restart local v4    # "requiredLongestSideLength":F
    :cond_26
    move v3, v5

    .line 120
    goto :goto_12

    .line 131
    .restart local v3    # "referenceSideLength":I
    :cond_28
    return v2
.end method

.method public static decodeSampledBitmapFromStream(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)Landroid/graphics/Bitmap;
    .registers 8
    .param p0, "fileURL"    # Ljava/net/URL;
    .param p1, "outImageDimensions"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    .prologue
    const/4 v0, 0x0

    .line 145
    new-instance v4, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v4}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 146
    .local v4, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v5, 0x1

    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 149
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->fileStreamFromPath(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v3

    .line 152
    .local v3, "fileStream":Ljava/io/InputStream;
    invoke-static {v3, v0, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 153
    .local v1, "checkbitmap":Landroid/graphics/Bitmap;
    invoke-static {v4, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->calculateInSampleSize(Landroid/graphics/BitmapFactory$Options;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;)I

    move-result v5

    iput v5, v4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 156
    const/4 v5, 0x0

    iput-boolean v5, v4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 159
    :try_start_1a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_25

    .line 164
    :goto_1d
    const/4 v3, 0x0

    .line 165
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->fileStreamFromPath(Ljava/net/URL;)Ljava/io/InputStream;

    move-result-object v3

    .line 168
    if-nez v3, :cond_2a

    .line 179
    :goto_24
    return-object v0

    .line 160
    :catch_25
    move-exception v2

    .line 161
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1d

    .line 173
    .end local v2    # "e":Ljava/io/IOException;
    :cond_2a
    invoke-static {v3, v0, v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 175
    .local v0, "bmp":Landroid/graphics/Bitmap;
    :try_start_2e
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_32

    goto :goto_24

    .line 176
    :catch_32
    move-exception v2

    .line 177
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_24
.end method

.method private static fileStreamFromPath(Ljava/net/URL;)Ljava/io/InputStream;
    .registers 2
    .param p0, "fileUrl"    # Ljava/net/URL;

    .prologue
    .line 136
    :try_start_0
    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    .line 139
    :goto_4
    return-object v0

    .line 138
    :catch_5
    move-exception v0

    .line 139
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;

    if-nez v0, :cond_b

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;

    .line 33
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;

    return-object v0
.end method

.method private getUploadAssetThumbnailAsync(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 7
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 217
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<[B>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$2GetRenditionTask;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$2GetRenditionTask;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 218
    .local v0, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$2GetRenditionTask;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/net/URL;

    const/4 v2, 0x0

    iget-object v3, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_localAssetURL:Ljava/net/URL;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$2GetRenditionTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 219
    return-void
.end method

.method private initializeBitmapCache()V
    .registers 3

    .prologue
    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    if-eqz v0, :cond_5

    .line 232
    :goto_4
    return-void

    .line 231
    :cond_5
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x28

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    goto :goto_4
.end method

.method private initializeCache()V
    .registers 3

    .prologue
    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_thumbnailCache:Landroid/util/LruCache;

    if-eqz v0, :cond_5

    .line 225
    :goto_4
    return-void

    .line 224
    :cond_5
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_thumbnailCache:Landroid/util/LruCache;

    goto :goto_4
.end method


# virtual methods
.method public clearBitmapCache()V
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    if-nez v0, :cond_5

    .line 50
    :goto_4
    return-void

    .line 48
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    goto :goto_4
.end method

.method public getThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 6
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<[B>;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<[B>;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->initializeCache()V

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_thumbnailCache:Landroid/util/LruCache;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 102
    .local v0, "bitmapData":[B
    if-nez v0, :cond_13

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->getUploadAssetThumbnailAsync(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 107
    :goto_12
    return-void

    .line 106
    :cond_13
    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    goto :goto_12
.end method

.method public getThumbnailasBitmap(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 8
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p2, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/Bitmap;>;"
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->initializeBitmapCache()V

    .line 55
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;->_bitmapCache:Landroid/util/LruCache;

    iget-object v3, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 57
    .local v0, "bmp":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_13

    .line 59
    invoke-interface {p2, v0}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 96
    :goto_12
    return-void

    .line 94
    :cond_13
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$1GetRenditionTask;

    invoke-direct {v1, p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$1GetRenditionTask;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 95
    .local v1, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$1GetRenditionTask;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/net/URL;

    const/4 v3, 0x0

    iget-object v4, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->_localAssetURL:Ljava/net/URL;

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeUploadThumbnailMgr$1GetRenditionTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_12
.end method
