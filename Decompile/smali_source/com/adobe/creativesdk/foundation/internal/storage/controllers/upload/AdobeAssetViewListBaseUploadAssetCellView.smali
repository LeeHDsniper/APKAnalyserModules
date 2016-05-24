.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;
.source "AdobeAssetViewListBaseUploadAssetCellView.java"


# instance fields
.field protected _uploadProgressBar:Landroid/widget/ProgressBar;

.field private _uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

.field private final kImageDisabledAlpha:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;-><init>()V

    .line 26
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->YetToStart:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    .line 28
    const/high16 v0, 0x3f000000

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->kImageDisabledAlpha:F

    return-void
.end method

.method private setImageCellProgressState(Z)V
    .registers 3
    .param p1, "isInProgress"    # Z

    .prologue
    .line 51
    if-eqz p1, :cond_8

    const/high16 v0, 0x3f000000

    :goto_4
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setImageAssetAlpha(F)V

    .line 52
    return-void

    .line 51
    :cond_8
    const/high16 v0, 0x3f800000

    goto :goto_4
.end method

.method private setProgressColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 64
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 65
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 66
    return-void
.end method


# virtual methods
.method protected addProgressBarChildRule(Landroid/widget/RelativeLayout$LayoutParams;)V
    .registers 3
    .param p1, "layoutParams"    # Landroid/widget/RelativeLayout$LayoutParams;

    .prologue
    .line 125
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 126
    return-void
.end method

.method protected createAttachProgressBarToView()V
    .registers 3

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->createProgressBar(Landroid/content/Context;)V

    .line 146
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->getProgressBarContainer()Landroid/widget/RelativeLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 148
    return-void
.end method

.method protected createProgressBar(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 129
    new-instance v1, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v1, p1, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    .line 131
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->asset_upload_progress_bar:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 133
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, 0x2

    .line 134
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewUtils;->convertDpToPx(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 136
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->addProgressBarChildRule(Landroid/widget/RelativeLayout$LayoutParams;)V

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 140
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v4}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 141
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 142
    return-void
.end method

.method protected abstract getProgressBarContainer()Landroid/widget/RelativeLayout;
.end method

.method protected handleDisableChange()V
    .registers 1

    .prologue
    .line 48
    return-void
.end method

.method protected handleOnFinishInflate()V
    .registers 1

    .prologue
    .line 152
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->handleOnFinishInflate()V

    .line 153
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->createAttachProgressBarToView()V

    .line 154
    return-void
.end method

.method public markUpload100Percent()V
    .registers 1

    .prologue
    .line 84
    return-void
.end method

.method public markUploadAsInProgress()V
    .registers 5

    .prologue
    .line 88
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 89
    const/16 v1, 0x20

    const/16 v2, 0x98

    const/16 v3, 0xf5

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    .line 90
    .local v0, "color":I
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setProgressColor(I)V

    .line 91
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setImageCellProgressState(Z)V

    .line 92
    return-void
.end method

.method public markUploadComplete()V
    .registers 3

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setImageCellProgressState(Z)V

    .line 56
    return-void
.end method

.method public markUploadError()V
    .registers 1

    .prologue
    .line 96
    return-void
.end method

.method public markUploadQueued()V
    .registers 2

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUploadAsInProgress()V

    .line 60
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setImageCellProgressState(Z)V

    .line 61
    return-void
.end method

.method protected providesSelection()Z
    .registers 2

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method protected setImageAssetAlpha(F)V
    .registers 4
    .param p1, "alpha"    # F

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->YetToStart:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-eq v0, v1, :cond_c

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->InProgress:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-ne v0, v1, :cond_e

    .line 40
    :cond_c
    const/high16 p1, 0x3f000000

    .line 42
    :cond_e
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetGenericStaggeredCellView;->setImageAssetAlpha(F)V

    .line 43
    return-void
.end method

.method public setUploadProgres(D)V
    .registers 8
    .param p1, "progressPercent"    # D

    .prologue
    .line 114
    const-wide/high16 v2, 0x4059000000000000L

    cmpl-double v1, p1, v2

    if-ltz v1, :cond_13

    const/4 v0, 0x1

    .line 116
    .local v0, "isDone":Z
    :goto_7
    if-eqz v0, :cond_c

    .line 117
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUpload100Percent()V

    .line 119
    :cond_c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadProgressBar:Landroid/widget/ProgressBar;

    double-to-int v2, p1

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 121
    return-void

    .line 114
    .end local v0    # "isDone":Z
    :cond_13
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setUploadStatus(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;)V
    .registers 4
    .param p1, "status"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    .line 102
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->YetToStart:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-ne v0, v1, :cond_c

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUploadQueued()V

    .line 111
    :cond_b
    :goto_b
    return-void

    .line 104
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->Completed:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-ne v0, v1, :cond_16

    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUploadComplete()V

    goto :goto_b

    .line 106
    :cond_16
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->Error:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-ne v0, v1, :cond_20

    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUploadError()V

    goto :goto_b

    .line 108
    :cond_20
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->Started:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-eq v0, v1, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->_uploadStatus:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;->InProgress:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    if-ne v0, v1, :cond_b

    .line 110
    :cond_2c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->markUploadAsInProgress()V

    goto :goto_b
.end method
