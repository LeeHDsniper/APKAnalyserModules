.class public Lcom/adobe/creativesdk/aviary/panels/VignettePanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;
.source "VignettePanel.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 3
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 29
    return-void
.end method


# virtual methods
.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 76
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_vignette:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 81
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_seekbar:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 7

    .prologue
    .line 46
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;->onActivate()V

    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 50
    .local v2, "tempBitmap":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    const/high16 v4, -0x40800000

    const/high16 v5, 0x41000000

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setOnVignetteChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;)V

    .line 57
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->contentReady()V

    .line 58
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 36
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 37
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .line 40
    .local v0, "image":Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->getVignetteIntensity()I

    move-result v1

    add-int/lit8 v1, v1, 0x64

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->setValue(I)V

    .line 41
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    const/4 v4, 0x4

    invoke-virtual {v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->createBitmap(III)V

    .line 42
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setOnVignetteChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$OnVignetteChangeListener;)V

    .line 63
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;->onDeactivate()V

    .line 64
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->clearBitmap()V

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->dispose()V

    .line 70
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSliderContentPanel;->onDispose()V

    .line 71
    return-void
.end method

.method protected onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 6
    .param p1, "resultVO"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mPreview:Landroid/graphics/Bitmap;

    .line 117
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->generateBitmap(Landroid/graphics/Bitmap;)V

    .line 119
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 120
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    if-eqz v1, :cond_34

    .line 121
    check-cast v0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;

    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 122
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->clearBitmap()V

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 126
    :cond_34
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 127
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 128
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1, p1}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 129
    return-void
.end method

.method protected onSliderChanged(IZ)V
    .registers 5
    .param p1, "progress"    # I
    .param p2, "fromUser"    # Z

    .prologue
    .line 91
    if-eqz p2, :cond_d

    .line 92
    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v0, v1, -0x64

    .line 93
    .local v0, "value":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setVignetteIntensity(I)V

    .line 95
    .end local v0    # "value":I
    :cond_d
    return-void
.end method

.method protected onSliderEnd(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 98
    return-void
.end method

.method protected onSliderStart(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 101
    return-void
.end method

.method public onVignetteChange(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Landroid/graphics/Bitmap;Landroid/graphics/RectF;IF)V
    .registers 7
    .param p1, "imageView"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
    .param p2, "vignetteBitmap"    # Landroid/graphics/Bitmap;
    .param p3, "relativeRect"    # Landroid/graphics/RectF;
    .param p4, "intensity"    # I
    .param p5, "feather"    # F

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-virtual {v0, p3, p4, p5}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->renderPreview(Landroid/graphics/RectF;IF)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 109
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->setIsChanged(Z)V

    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 112
    :cond_13
    return-void
.end method
