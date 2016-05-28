.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
.super Ljava/lang/Object;
.source "ReusableImageBitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;
    }
.end annotation


# static fields
.field private static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field private mCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

.field private final mDiskCacheLock:Ljava/lang/Object;

.field private mDiskCacheStarting:Z

.field private mMemoryCache:Landroid/support/v4/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private mReusableBitmaps:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method private constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V
    .registers 3
    .param p1, "cacheParams"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mDiskCacheLock:Ljava/lang/Object;

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mDiskCacheStarting:Z

    .line 73
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->init(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V

    .line 74
    return-void
.end method

.method static synthetic access$000()Landroid/graphics/Bitmap$CompressFormat;
    .registers 1

    .prologue
    .line 37
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-object v0
.end method

.method private static findOrCreateRetainFragment(Landroid/support/v4/app/FragmentManager;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
    .registers 4
    .param p0, "fm"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 466
    const-string v1, "ImageCache"

    invoke-virtual {p0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;

    .line 469
    .local v0, "mRetainFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
    if-nez v0, :cond_1c

    .line 470
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;

    .end local v0    # "mRetainFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;-><init>()V

    .line 471
    .restart local v0    # "mRetainFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
    invoke-virtual {p0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "ImageCache"

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 474
    :cond_1c
    return-object v0
.end method

.method public static getBitmapSize(Landroid/graphics/drawable/BitmapDrawable;)I
    .registers 4
    .param p0, "value"    # Landroid/graphics/drawable/BitmapDrawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 393
    invoke-virtual {p0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 397
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/PlatformCommonUtils;->hasKitKat()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 398
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result v1

    .line 406
    :goto_e
    return v1

    .line 401
    :cond_f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/PlatformCommonUtils;->hasHoneycombMR1()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 402
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v1

    goto :goto_e

    .line 406
    :cond_1a
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    goto :goto_e
.end method

.method public static getInstance(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    .registers 4
    .param p0, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p1, "cacheParams"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .prologue
    .line 88
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->findOrCreateRetainFragment(Landroid/support/v4/app/FragmentManager;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;

    move-result-object v1

    .line 91
    .local v1, "mRetainFragment":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    .line 94
    .local v0, "imageCache":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    if-nez v0, :cond_14

    .line 95
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    .end local v0    # "imageCache":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V

    .line 96
    .restart local v0    # "imageCache":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;->setObject(Ljava/lang/Object;)V

    .line 99
    :cond_14
    return-object v0
.end method

.method private init(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V
    .registers 4
    .param p1, "cacheParams"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->memoryCacheEnabled:Z

    if-eqz v0, :cond_24

    .line 126
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/PlatformCommonUtils;->hasHoneycomb()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 127
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 128
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mReusableBitmaps:Ljava/util/Set;

    .line 131
    :cond_19
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$1;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    iget v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->memCacheSize:I

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    .line 158
    :cond_24
    return-void
.end method


# virtual methods
.method public addBitmapToCache(Ljava/lang/String;Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 4
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 169
    if-eqz p1, :cond_4

    if-nez p2, :cond_5

    .line 180
    :cond_4
    :goto_4
    return-void

    .line 174
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v0, :cond_4

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4
.end method

.method public clearCache()V
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v0, :cond_9

    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v0}, Landroid/support/v4/util/LruCache;->evictAll()V

    .line 254
    :cond_9
    return-void
.end method

.method public getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .registers 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 190
    const/4 v0, 0x0

    .line 192
    .local v0, "memValue":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    if-eqz v1, :cond_d

    .line 193
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->mMemoryCache:Landroid/support/v4/util/LruCache;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "memValue":Landroid/graphics/drawable/BitmapDrawable;
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 200
    .restart local v0    # "memValue":Landroid/graphics/drawable/BitmapDrawable;
    :cond_d
    return-object v0
.end method
