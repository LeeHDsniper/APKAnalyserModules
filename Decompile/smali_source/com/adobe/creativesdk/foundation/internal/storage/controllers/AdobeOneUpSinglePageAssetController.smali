.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;
.super Ljava/lang/Object;
.source "AdobeOneUpSinglePageAssetController.java"


# instance fields
.field protected _asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

.field protected _currentAssetPos:I

.field protected _displayMetrics:Landroid/util/DisplayMetrics;

.field protected _mainRootView:Landroid/view/View;

.field protected _oneUpViewContext:Landroid/content/Context;

.field private _reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;",
            ">;"
        }
    .end annotation
.end field

.field protected imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;[B)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;
    .param p1, "x1"    # [B

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->handleAssetImageData([B)V

    return-void
.end method

.method private handleAssetImageData([B)V
    .registers 7
    .param p1, "imagedata"    # [B

    .prologue
    .line 118
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_mainRootView:Landroid/view/View;

    if-nez v2, :cond_5

    .line 168
    :cond_4
    :goto_4
    return-void

    .line 122
    :cond_5
    if-nez p1, :cond_d

    .line 123
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->handleNoPreview()V

    goto :goto_4

    .line 127
    :cond_d
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->isReusableWorkerValid()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 129
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$2;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;)V

    invoke-virtual {v2, v3, p1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImageWithData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    goto :goto_4

    .line 150
    :cond_2a
    const/4 v0, 0x0

    .line 151
    .local v0, "bmp":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_33

    .line 152
    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {p1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 153
    :cond_33
    if-nez v0, :cond_35

    .line 157
    :cond_35
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->displayThumbnail(Landroid/graphics/Bitmap;)V

    .line 159
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 160
    .local v1, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getType()Ljava/lang/String;

    move-result-object v2

    const-string v3, "video/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 161
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->handleVideoFiles()V

    goto :goto_4
.end method

.method private isReusableWorkerValid()Z
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method public cancelAnyOneUpImageOperation()V
    .registers 3

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->isReusableWorkerValid()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->cancelImageLoad(Ljava/lang/String;)V

    .line 56
    :cond_17
    return-void
.end method

.method public initiateDisplay()V
    .registers 10

    .prologue
    .line 176
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    instance-of v4, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v4, :cond_6b

    .line 177
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;)V

    .line 201
    .local v2, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->isNetworkAvailable()Z

    move-result v4

    if-eqz v4, :cond_6c

    .line 202
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->isOnline()V

    .line 203
    const/4 v3, 0x1

    .line 204
    .local v3, "shouldLoadFromFile":Z
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->isReusableWorkerValid()Z

    move-result v4

    if-eqz v4, :cond_50

    .line 205
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImage(Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    .line 206
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :cond_50

    .line 207
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->displayThumbnail(Landroid/graphics/drawable/BitmapDrawable;)V

    .line 208
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 209
    .local v1, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    if-eqz v4, :cond_4f

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "video/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 210
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->handleVideoFiles()V

    .line 212
    :cond_4f
    const/4 v3, 0x0

    .line 216
    .end local v0    # "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    .end local v1    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_50
    if-eqz v3, :cond_6b

    .line 218
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v7, v7

    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_displayMetrics:Landroid/util/DisplayMetrics;

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 229
    .end local v2    # "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    .end local v3    # "shouldLoadFromFile":Z
    :cond_6b
    :goto_6b
    return-void

    .line 226
    .restart local v2    # "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    :cond_6c
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->handleNoNetwork()V

    goto :goto_6b
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_oneUpViewContext:Landroid/content/Context;

    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_displayMetrics:Landroid/util/DisplayMetrics;

    .line 86
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_mainRootView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->setMainRootView(Landroid/view/View;)V

    .line 88
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_displayMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->setDisplayMetrics(Landroid/util/DisplayMetrics;)V

    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_currentAssetPos:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->setCurrentAssetPos(I)V

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->performInitialization(Landroid/content/Context;)V

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->createPhotoTapListenenr()V

    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->getAttacher()Luk/co/senab/photoview/PhotoViewAttacher;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;)V

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomDelegate(Luk/co/senab/photoview/IPhotoViewZoomDelegate;)V

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->initiallizeVideoButton()V

    .line 108
    return-void
.end method

.method public setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 72
    return-void
.end method

.method public setCurrentAssetPos(I)V
    .registers 2
    .param p1, "currentAssetPos"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_currentAssetPos:I

    .line 64
    return-void
.end method

.method public setMainRootView(Landroid/view/View;)V
    .registers 4
    .param p1, "mainRootView"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 43
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_mainRootView:Landroid/view/View;

    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_mainRootView:Landroid/view/View;

    if-nez v0, :cond_12

    .line 45
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_oneUpViewContext:Landroid/content/Context;

    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    if-eqz v0, :cond_12

    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->imageCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->setContext(Landroid/content/Context;)V

    .line 50
    :cond_12
    return-void
.end method

.method public setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V
    .registers 3
    .param p1, "bitmapCacheWorker"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 111
    if-nez p1, :cond_3

    .line 115
    :goto_2
    return-void

    .line 114
    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeOneUpSinglePageAssetController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    goto :goto_2
.end method
