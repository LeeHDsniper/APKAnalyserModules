.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;
.super Ljava/lang/Object;
.source "AdobeAssetOneUpRecyclerViewController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
    }
.end annotation


# static fields
.field protected static height:I

.field protected static width:I


# instance fields
.field protected _absRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field protected _asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

.field protected _assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

.field _fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

.field private _imageHeight:I

.field private _imageWidth:I

.field protected _layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field protected _mainRootView:Landroid/view/View;

.field protected _multiPageSectionalTextView:Landroid/widget/TextView;

.field protected _mutiPageSectionalHeader:Landroid/view/View;

.field protected _noInternetConnectionBanner:Landroid/view/View;

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

.field protected num_pages:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, -0x1

    .line 44
    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->height:I

    .line 45
    sput v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->width:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->num_pages:I

    .line 49
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageWidth:I

    .line 50
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageHeight:I

    .line 273
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 33
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageWidth:I

    return v0
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;
    .param p1, "x1"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageWidth:I

    return p1
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 33
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageHeight:I

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;
    .param p1, "x1"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_imageHeight:I

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;[BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;
    .param p1, "x1"    # [B
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;
    .param p3, "x3"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p4, "x4"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->isReusableWorkerValid()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private checkPageCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 6
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 96
    instance-of v1, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    if-eqz v1, :cond_1d

    move-object v0, p1

    .line 97
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 98
    .local v0, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 99
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getOptionalMetadata()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "pages"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->num_pages:I

    .line 101
    :cond_1a
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->num_pages:I

    .line 104
    .end local v0    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_1c
    return v1

    :cond_1d
    const/4 v1, 0x0

    goto :goto_1c
.end method

.method private handleAssetImageData([BLcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)V
    .registers 9
    .param p1, "imagedata"    # [B
    .param p2, "imageCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;
    .param p3, "dimension"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .param p4, "pageNo"    # I

    .prologue
    .line 209
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    if-nez v1, :cond_5

    .line 254
    :goto_4
    return-void

    .line 213
    :cond_5
    if-nez p1, :cond_b

    .line 214
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handleNoPreview()V

    goto :goto_4

    .line 218
    :cond_b
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->isReusableWorkerValid()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 220
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    sget-object v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-static {v2, v3, p3, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageUtils;->cacheKeyForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;

    invoke-direct {v3, p0, p2, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;I)V

    invoke-virtual {v1, v2, p1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->loadImageWithData(Ljava/lang/String;[BLcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    goto :goto_4

    .line 240
    :cond_2a
    const/4 v0, 0x0

    .line 241
    .local v0, "bmp":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_33

    .line 242
    const/4 v1, 0x0

    array-length v2, p1

    invoke-static {p1, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 243
    :cond_33
    if-nez v0, :cond_38

    .line 244
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->handleNoPreview()V

    .line 247
    :cond_38
    invoke-virtual {p2, v0, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerCellView;->displayThumbnail(Landroid/graphics/Bitmap;I)V

    goto :goto_4
.end method

.method private isReusableWorkerValid()Z
    .registers 2

    .prologue
    .line 257
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

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
.method protected createRecyclerViewAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)V

    .line 92
    .local v0, "adapter":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;
    return-object v0
.end method

.method protected getMainRootView()Landroid/view/View;
    .registers 3

    .prologue
    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->multipage_recyclerview:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->listview_container_no_network_notification_bar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_noInternetConnectionBanner:Landroid/view/View;

    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_one_up_multi_page_recycler_section_container:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mutiPageSectionalHeader:Landroid/view/View;

    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_one_up_multi_page_recycler_section_textview:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_multiPageSectionalTextView:Landroid/widget/TextView;

    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    return-object v0
.end method

.method public performInitialization(Landroid/content/Context;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 110
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->getMainRootView()Landroid/view/View;

    .line 113
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    .line 116
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/LinearLayoutManager;->setSmoothScrollbarEnabled(Z)V

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 123
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->createRecyclerViewAdapter(Landroid/content/Context;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 129
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mutiPageSectionalHeader:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_multiPageSectionalTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_multi_page_numbering:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->checkPageCount(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mutiPageSectionalHeader:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/MarginDecoration;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/MarginDecoration;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_absRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 195
    return-void
.end method

.method public requestRelayout()V
    .registers 2

    .prologue
    .line 198
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_assetsItemsAdapter:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$AdobeOneUpRecyclerViewBaseAdapter;->notifyDataSetChanged()V

    .line 199
    return-void
.end method

.method public setAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_asset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 77
    return-void
.end method

.method public setFragmentController(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;)V
    .registers 2
    .param p1, "fragmentController"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_fragmentController:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeMultiPageFragmentController;

    .line 58
    return-void
.end method

.method public setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_mainRootView:Landroid/view/View;

    .line 82
    return-void
.end method

.method public setReuseableBitmapCacheWorker(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;)V
    .registers 3
    .param p1, "bitmapCacheWorker"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .prologue
    .line 202
    if-nez p1, :cond_3

    .line 206
    :goto_2
    return-void

    .line 205
    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_reusableBitmapCacheWorker:Ljava/lang/ref/WeakReference;

    goto :goto_2
.end method

.method public wentOffline()V
    .registers 3

    .prologue
    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_noInternetConnectionBanner:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_noInternetConnectionBanner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 270
    :cond_a
    return-void
.end method

.method public wentOnline()V
    .registers 3

    .prologue
    .line 261
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_noInternetConnectionBanner:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_noInternetConnectionBanner:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 264
    :cond_b
    return-void
.end method
