.class Lcom/nostra13/universalimageloader/core/ImageLoader$SyncImageLoadingListener;
.super Lcom/nostra13/universalimageloader/core/listener/SimpleImageLoadingListener;
.source "ImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/ImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SyncImageLoadingListener"
.end annotation


# instance fields
.field private loadedImage:Landroid/graphics/Bitmap;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 750
    invoke-direct {p0}, Lcom/nostra13/universalimageloader/core/listener/SimpleImageLoadingListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/nostra13/universalimageloader/core/ImageLoader$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/nostra13/universalimageloader/core/ImageLoader$1;

    .prologue
    .line 750
    invoke-direct {p0}, Lcom/nostra13/universalimageloader/core/ImageLoader$SyncImageLoadingListener;-><init>()V

    return-void
.end method


# virtual methods
.method public getLoadedBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 760
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/ImageLoader$SyncImageLoadingListener;->loadedImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "loadedImage"    # Landroid/graphics/Bitmap;

    .prologue
    .line 756
    iput-object p3, p0, Lcom/nostra13/universalimageloader/core/ImageLoader$SyncImageLoadingListener;->loadedImage:Landroid/graphics/Bitmap;

    .line 757
    return-void
.end method
