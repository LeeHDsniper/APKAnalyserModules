.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;
.super Ljava/lang/Object;
.source "AdobeAssetViewListBaseCellView.java"


# instance fields
.field protected _aspectRatioHint:F

.field private _cellDelegate:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;",
            ">;"
        }
    .end annotation
.end field

.field protected _disable:Z

.field protected _guid:Ljava/lang/String;

.field private _hasValidThumnailRendition:Z

.field private _imageAssetMD5:Ljava/lang/String;

.field protected _imageViewAssetPicture:Landroid/widget/ImageView;

.field private _isImageEmpty:Z

.field private _isSelectionEnabledOnCell:Z

.field protected _mainRootView:Landroid/view/View;

.field private _position:I

.field private _rootViewTag:Ljava/lang/Object;

.field protected _selectBtn:Landroid/view/View;

.field protected _selected:Z

.field protected _title:Ljava/lang/String;

.field protected _titleView:Landroid/widget/TextView;

.field protected _videoDuration:Landroid/widget/TextView;

.field protected _videoIndicator:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selected:Z

    .line 40
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isImageEmpty:Z

    .line 54
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_aspectRatioHint:F

    .line 65
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isSelectionEnabledOnCell:Z

    .line 66
    return-void
.end method

.method private updateSelectionBtnVisibility()V
    .registers 3

    .prologue
    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    if-eqz v0, :cond_14

    .line 254
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isSelectionEnabledOnCell:Z

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->isMarkedDisabled()Z

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x0

    :goto_11
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 256
    :cond_14
    return-void

    .line 254
    :cond_15
    const/16 v0, 0x8

    goto :goto_11
.end method


# virtual methods
.method protected GetNoPreviewImageResId()I
    .registers 2

    .prologue
    .line 259
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->asset_browser_no_preview_icon:I

    return v0
.end method

.method protected HandleTitleChange()V
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_titleView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    return-void
.end method

.method protected SetThumbnailOnAssetCell(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "thumbnail"    # Landroid/graphics/Bitmap;

    .prologue
    .line 263
    if-eqz p1, :cond_b

    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 274
    :goto_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleAfterImageLoadingComplete()V

    .line 276
    return-void

    .line 268
    :cond_b
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->GetNoPreviewImageResId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 270
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    goto :goto_7
.end method

.method protected changeSelectionOverlay()V
    .registers 5

    .prologue
    .line 132
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selected:Z

    if-eqz v0, :cond_14

    .line 133
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    const/16 v1, 0xed

    const/16 v2, 0xf0

    const/16 v3, 0xf1

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 136
    :goto_13
    return-void

    .line 135
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_13
.end method

.method public displayThumnail(Landroid/graphics/Bitmap;FZ)V
    .registers 8
    .param p1, "thumbail"    # Landroid/graphics/Bitmap;
    .param p2, "alpha"    # F
    .param p3, "showAnimation"    # Z

    .prologue
    const/4 v1, 0x0

    .line 292
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isImageEmpty:Z

    .line 294
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 295
    if-eqz p1, :cond_b

    const/4 v1, 0x1

    :cond_b
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_hasValidThumnailRendition:Z

    .line 296
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->SetThumbnailOnAssetCell(Landroid/graphics/Bitmap;)V

    .line 297
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->updateSelectionBtnVisibility()V

    .line 299
    if-eqz p3, :cond_34

    .line 301
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x10a0000

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 303
    .local v0, "fadeInAnimation":Landroid/view/animation/Animation;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView$2;

    invoke-direct {v1, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;F)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 315
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 316
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 321
    .end local v0    # "fadeInAnimation":Landroid/view/animation/Animation;
    :goto_33
    return-void

    .line 319
    :cond_34
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->setImageAssetAlpha(F)V

    goto :goto_33
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getGuid()Ljava/lang/String;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_guid:Ljava/lang/String;

    return-object v0
.end method

.method public getImageMD5()Ljava/lang/String;
    .registers 2

    .prologue
    .line 332
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageAssetMD5:Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 118
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_position:I

    return v0
.end method

.method public getRootView()Landroid/view/View;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_title:Ljava/lang/String;

    return-object v0
.end method

.method public handleAfterImageLoadingComplete()V
    .registers 1

    .prologue
    .line 280
    return-void
.end method

.method protected handleAttachToCellDelegate()V
    .registers 1

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->setUpSelectionButtonState()V

    .line 229
    return-void
.end method

.method protected handleDisableChange()V
    .registers 3

    .prologue
    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    if-eqz v0, :cond_10

    .line 189
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_disable:Z

    if-eqz v0, :cond_11

    const v0, 0x3e99999a

    :goto_d
    invoke-static {v1, v0}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 190
    :cond_10
    return-void

    .line 189
    :cond_11
    const/high16 v0, 0x3f800000

    goto :goto_d
.end method

.method protected handleGuidChange()V
    .registers 1

    .prologue
    .line 175
    return-void
.end method

.method protected abstract handleOnFinishInflate()V
.end method

.method protected handlePostInflate()V
    .registers 1

    .prologue
    .line 233
    return-void
.end method

.method protected handleSelectionMarkChange()V
    .registers 3

    .prologue
    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    if-nez v0, :cond_5

    .line 145
    :goto_4
    return-void

    .line 143
    :cond_5
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selected:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 144
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->changeSelectionOverlay()V

    goto :goto_4
.end method

.method public hasValidThumbnailRendition()Z
    .registers 2

    .prologue
    .line 283
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_hasValidThumnailRendition:Z

    return v0
.end method

.method public initializeFromLayout(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)V
    .registers 6
    .param p1, "layoutInflater"    # Landroid/view/LayoutInflater;
    .param p2, "layoutResID"    # I
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 338
    const/4 v1, 0x0

    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 339
    .local v0, "newView":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->setMainRootView(Landroid/view/View;)V

    .line 340
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->performOnFinishInflate()V

    .line 341
    return-void
.end method

.method public isMarkedDisabled()Z
    .registers 2

    .prologue
    .line 178
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_disable:Z

    return v0
.end method

.method public isMarkedSelected()Z
    .registers 2

    .prologue
    .line 155
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selected:Z

    return v0
.end method

.method public markSelected(Z)V
    .registers 2
    .param p1, "selected"    # Z

    .prologue
    .line 149
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selected:Z

    .line 150
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleSelectionMarkChange()V

    .line 151
    return-void
.end method

.method protected performOnFinishInflate()V
    .registers 1

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleOnFinishInflate()V

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handlePostInflate()V

    .line 107
    return-void
.end method

.method public prepareForReuse()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 237
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_rootViewTag:Ljava/lang/Object;

    .line 238
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_guid:Ljava/lang/String;

    .line 239
    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_position:I

    .line 240
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_title:Ljava/lang/String;

    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    if-eqz v0, :cond_1b

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 245
    :cond_1b
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_disable:Z

    .line 246
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isImageEmpty:Z

    .line 247
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_aspectRatioHint:F

    .line 248
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_cellDelegate:Ljava/lang/ref/WeakReference;

    .line 249
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_hasValidThumnailRendition:Z

    .line 250
    return-void
.end method

.method protected abstract providesSelection()Z
.end method

.method public setAssetImageAspectRatioHint(F)V
    .registers 2
    .param p1, "aspectRatio"    # F

    .prologue
    .line 324
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_aspectRatioHint:F

    .line 325
    return-void
.end method

.method public setCellDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;)V
    .registers 3
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;

    .prologue
    .line 95
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_cellDelegate:Ljava/lang/ref/WeakReference;

    .line 97
    if-eqz p1, :cond_c

    .line 98
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleAttachToCellDelegate()V

    .line 100
    :cond_c
    return-void
.end method

.method public setDisabled(Z)V
    .registers 2
    .param p1, "disable"    # Z

    .prologue
    .line 182
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_disable:Z

    .line 183
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleDisableChange()V

    .line 184
    return-void
.end method

.method public setGuid(Ljava/lang/String;)V
    .registers 2
    .param p1, "guid"    # Ljava/lang/String;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_guid:Ljava/lang/String;

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->handleGuidChange()V

    .line 166
    return-void
.end method

.method protected setImageAssetAlpha(F)V
    .registers 3
    .param p1, "alpha"    # F

    .prologue
    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageViewAssetPicture:Landroid/widget/ImageView;

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 288
    return-void
.end method

.method public setImageMD5(Ljava/lang/String;)V
    .registers 2
    .param p1, "md5Hash"    # Ljava/lang/String;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_imageAssetMD5:Ljava/lang/String;

    .line 329
    return-void
.end method

.method public setMainRootView(Landroid/view/View;)V
    .registers 2
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_mainRootView:Landroid/view/View;

    .line 87
    return-void
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_position:I

    .line 123
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_title:Ljava/lang/String;

    .line 128
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->HandleTitleChange()V

    .line 129
    return-void
.end method

.method protected setUpSelectionButtonState()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 197
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->providesSelection()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    if-eqz v0, :cond_2b

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_cellDelegate:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;->getSelectionOverallVisibility()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isSelectionEnabledOnCell:Z

    .line 200
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isSelectionEnabledOnCell:Z

    if-eqz v0, :cond_2a

    .line 202
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->markSelected(Z)V

    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_selectBtn:Landroid/view/View;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 226
    :cond_2a
    :goto_2a
    return-void

    .line 224
    :cond_2b
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_isSelectionEnabledOnCell:Z

    goto :goto_2a
.end method

.method protected toggleItemMarkSelection()V
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_cellDelegate:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;

    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetViewListCellDelegate;->handleAssetCellSelectionToggle(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;)V

    .line 194
    return-void
.end method
