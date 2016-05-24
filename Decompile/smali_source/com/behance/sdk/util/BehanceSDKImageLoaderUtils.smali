.class public Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;
.super Ljava/lang/Object;
.source "BehanceSDKImageLoaderUtils.java"


# static fields
.field private static imageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# direct methods
.method public static displayImageFromCacheOrLoadFromServer(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .registers 10
    .param p0, "imageUrl"    # Ljava/lang/String;
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "listener"    # Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;
    .param p3, "options"    # Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .prologue
    .line 67
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v3

    .line 68
    .local v3, "imageloader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    const/4 v4, 0x0

    .line 69
    .local v4, "loadedFromCache":Z
    invoke-virtual {v3, p1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    .line 70
    invoke-virtual {v3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getMemoryCache()Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;

    move-result-object v2

    .line 71
    .local v2, "imageLoaderMemoryCache":Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;
    if-eqz v2, :cond_2f

    .line 72
    invoke-static {p0, v2}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->findCachedBitmapsForImageUri(Ljava/lang/String;Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;)Ljava/util/List;

    move-result-object v1

    .line 73
    .local v1, "cachedBitmapsForImageUri":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Bitmap;>;"
    if-eqz v1, :cond_2f

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_2f

    .line 74
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 75
    .local v0, "cachedBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v5

    if-nez v5, :cond_2f

    .line 76
    const/4 v4, 0x1

    .line 77
    if-eqz p2, :cond_37

    .line 78
    invoke-interface {p2, p0, p1, v0}, Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;->onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V

    .line 86
    .end local v0    # "cachedBitmap":Landroid/graphics/Bitmap;
    .end local v1    # "cachedBitmapsForImageUri":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Bitmap;>;"
    :cond_2f
    :goto_2f
    if-nez v4, :cond_36

    .line 87
    if-eqz p2, :cond_3d

    .line 88
    invoke-virtual {v3, p0, p1, p3, p2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    .line 93
    :cond_36
    :goto_36
    return-void

    .line 80
    .restart local v0    # "cachedBitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "cachedBitmapsForImageUri":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Bitmap;>;"
    :cond_37
    if-eqz p1, :cond_2f

    .line 81
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_2f

    .line 90
    .end local v0    # "cachedBitmap":Landroid/graphics/Bitmap;
    .end local v1    # "cachedBitmapsForImageUri":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Bitmap;>;"
    :cond_3d
    invoke-virtual {v3, p0, p1, p3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_36
.end method

.method public static getDefaultImageLoaderOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 48
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->imageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    if-nez v0, :cond_3b

    .line 49
    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 50
    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    .line 51
    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    .line 52
    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    .line 53
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v1, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;

    const/16 v2, 0x12c

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v4, v4}, Lcom/behance/sdk/ui/animations/BehanceSDKCustomFadeInBitmapDisplayer;-><init>(IZZZ)V

    .line 54
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x1080078

    .line 55
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 56
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->imageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .line 59
    :cond_3b
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->imageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object v0
.end method

.method public static getImageBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 3
    .param p0, "ImageUrl"    # Ljava/lang/String;

    .prologue
    .line 100
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    .line 101
    .local v0, "imageloader":Lcom/nostra13/universalimageloader/core/ImageLoader;
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKImageLoaderUtils;->getDefaultImageLoaderOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public static updateBitmapForRotation(Landroid/graphics/Bitmap;Lcom/behance/sdk/project/modules/ImageModule;)Landroid/graphics/Bitmap;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    const/4 v1, 0x0

    .line 123
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->getRotation()I

    move-result v7

    .line 124
    .local v7, "rotation":I
    if-lez v7, :cond_21

    .line 125
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 127
    .local v5, "matrix":Landroid/graphics/Matrix;
    mul-int/lit8 v0, v7, 0x5a

    int-to-float v0, v0

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 128
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 130
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_21
    return-object p0
.end method
