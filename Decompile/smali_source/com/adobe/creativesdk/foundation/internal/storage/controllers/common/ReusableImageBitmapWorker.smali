.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
.super Ljava/lang/Object;
.source "ReusableImageBitmapWorker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    }
.end annotation


# instance fields
.field private _image2DecodeTaskMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;",
            ">;"
        }
    .end annotation
.end field

.field private mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

.field private mImageCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

.field private final mResources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mResources:Landroid/content/res/Resources;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Landroid/content/res/Resources;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    return-object v0
.end method

.method private createReusableBitmapFromImageData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    .registers 5
    .param p1, "dataKey"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;"
        }
    .end annotation

    .prologue
    .line 114
    .local p3, "onCompleteCallBack":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/Bitmap;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;

    invoke-direct {v0, p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 115
    .local v0, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    return-object v0
.end method


# virtual methods
.method public addImageCache(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V
    .registers 4
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p2, "cacheParams"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .prologue
    .line 36
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCacheParams:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    invoke-static {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->getInstance(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    .line 38
    return-void
.end method

.method public cancelImageLoad(Ljava/lang/String;)V
    .registers 4
    .param p1, "dataKey"    # Ljava/lang/String;

    .prologue
    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_9

    .line 131
    :cond_8
    :goto_8
    return-void

    .line 126
    :cond_9
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;

    .line 127
    .local v0, "task":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    if-eqz v0, :cond_8

    .line 128
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->cancel(Z)Z

    goto :goto_8
.end method

.method public clearCache()V
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->clearCache()V

    .line 120
    return-void
.end method

.method public loadImage(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .registers 4
    .param p1, "dataKey"    # Ljava/lang/String;

    .prologue
    .line 50
    if-nez p1, :cond_4

    .line 51
    const/4 v0, 0x0

    .line 58
    :cond_3
    :goto_3
    return-object v0

    .line 54
    :cond_4
    const/4 v0, 0x0

    .line 55
    .local v0, "value":Landroid/graphics/drawable/BitmapDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    if-eqz v1, :cond_3

    .line 56
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->mImageCache:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;->getBitmapFromMemCache(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    goto :goto_3
.end method

.method public loadImageWithData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V
    .registers 7
    .param p1, "dataKey"    # Ljava/lang/String;
    .param p2, "imageData"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
            "<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p3, "callback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;, "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback<Landroid/graphics/drawable/BitmapDrawable;>;"
    if-nez p1, :cond_7

    .line 83
    const/4 v2, 0x0

    invoke-interface {p3, v2}, Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;->onCompletion(Ljava/lang/Object;)V

    .line 109
    :goto_6
    return-void

    .line 87
    :cond_7
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->cancelImageLoad(Ljava/lang/String;)V

    .line 88
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;

    invoke-direct {v2, p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    invoke-direct {p0, p1, p2, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->createReusableBitmapFromImageData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;

    move-result-object v1

    .line 104
    .local v1, "imageBackgroundTask":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->_image2DecodeTaskMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const/4 v2, 0x1

    new-array v0, v2, [[B

    .line 107
    .local v0, "arrayOfByteArray":[[B
    const/4 v2, 0x0

    aput-object p2, v0, v2

    .line 108
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker$DecodeImageInBackgroundTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_6
.end method
