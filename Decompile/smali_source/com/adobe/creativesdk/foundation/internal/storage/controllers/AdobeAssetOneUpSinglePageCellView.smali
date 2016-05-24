.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;
.source "AdobeAssetOneUpSinglePageCellView.java"


# instance fields
.field private _currentAssetPos:I

.field private mVidPlayBtn:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpBaseCellView;-><init>()V

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;

    .prologue
    .line 21
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->_currentAssetPos:I

    return v0
.end method


# virtual methods
.method public handleVideoFiles()V
    .registers 3

    .prologue
    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->mVidPlayBtn:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->mVidPlayBtn:Landroid/widget/ImageButton;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    return-void
.end method

.method public initiallizeVideoButton()V
    .registers 2

    .prologue
    .line 37
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->asset_video_playBtn:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->mVidPlayBtn:Landroid/widget/ImageButton;

    .line 38
    return-void
.end method

.method public setCurrentAssetPos(I)V
    .registers 2
    .param p1, "currentAssetPos"    # I

    .prologue
    .line 31
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetOneUpSinglePageCellView;->_currentAssetPos:I

    .line 32
    return-void
.end method
