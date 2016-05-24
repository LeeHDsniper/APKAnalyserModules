.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;
.super Ljava/lang/Object;
.source "ReusableImageBitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageCacheParams"
.end annotation


# instance fields
.field public compressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field public compressQuality:I

.field public diskCacheSize:I

.field public memCacheSize:I

.field public memoryCacheEnabled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    const/16 v0, 0x1400

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->memCacheSize:I

    .line 261
    const/high16 v0, 0xa00000

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->diskCacheSize:I

    .line 263
    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->access$000()Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 264
    const/16 v0, 0x46

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->compressQuality:I

    .line 265
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->memoryCacheEnabled:Z

    return-void
.end method


# virtual methods
.method public setMemCacheSizePercent(F)V
    .registers 4
    .param p1, "percent"    # F

    .prologue
    .line 284
    const v0, 0x3c23d70a

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_e

    const v0, 0x3f4ccccd

    cmpl-float v0, p1, v0

    if-lez v0, :cond_16

    .line 285
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "setMemCacheSizePercent - percent must be between 0.01 and 0.8 (inclusive)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_16
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    long-to-float v0, v0

    mul-float/2addr v0, p1

    const/high16 v1, 0x44800000

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->memCacheSize:I

    .line 289
    return-void
.end method
