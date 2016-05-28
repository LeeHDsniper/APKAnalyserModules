.class public Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "OrientationPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;


# instance fields
.field isClosing:Z

.field private mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

.field private mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mButton4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "adjust"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 31
    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 32
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
    .line 88
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_orientation:I

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
    .line 82
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_orientation:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getIsChanged()Z
    .registers 7

    .prologue
    .line 113
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenStarted()Z

    move-result v2

    .line 114
    .local v2, "straightenStarted":Z
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCurrentRotation()D

    move-result-wide v4

    double-to-int v1, v4

    .line 115
    .local v1, "rotation":I
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getFlipType()I

    move-result v0

    .line 116
    .local v0, "flipType":I
    if-nez v1, :cond_1d

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v3, v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    if-ne v0, v3, :cond_1d

    if-eqz v2, :cond_1f

    :cond_1d
    const/4 v3, 0x1

    :goto_1e
    return v3

    :cond_1f
    const/4 v3, 0x0

    goto :goto_1e
.end method

.method public onActivate()V
    .registers 3

    .prologue
    .line 49
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setOnResetListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;)V

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->contentReady()V

    .line 61
    return-void
.end method

.method public onCancel()Z
    .registers 11

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 152
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->isClosing:Z

    if-eqz v8, :cond_7

    .line 171
    :goto_6
    return v6

    .line 156
    :cond_7
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->isClosing:Z

    .line 157
    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->setEnabled(Z)V

    .line 159
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCurrentRotation()D

    move-result-wide v8

    double-to-int v1, v8

    .line 160
    .local v1, "rotation":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHorizontalFlip()Z

    move-result v0

    .line 161
    .local v0, "hflip":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getVerticalFlip()Z

    move-result v5

    .line 162
    .local v5, "vflip":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenStarted()Z

    move-result v4

    .line 163
    .local v4, "straightenStarted":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenAngle()D

    move-result-wide v2

    .local v2, "rotationFromStraighten":D
    move v6, v7

    .line 171
    goto :goto_6
.end method

.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->isActive()Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_f

    .line 109
    :cond_e
    :goto_e
    return-void

    .line 98
    :cond_f
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 100
    .local v0, "id":I
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    if-ne v0, v1, :cond_1d

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotate90(Z)V

    goto :goto_e

    .line 102
    :cond_1d
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    if-ne v0, v1, :cond_27

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotate90(Z)V

    goto :goto_e

    .line 104
    :cond_27
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    if-ne v0, v1, :cond_31

    .line 105
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(Z)V

    goto :goto_e

    .line 106
    :cond_31
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button4:I

    if-ne v0, v1, :cond_e

    .line 107
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flip(Z)V

    goto :goto_e
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 38
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .line 40
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    .line 41
    .local v0, "v":Landroid/view/View;
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 42
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 43
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 44
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button4:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 45
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setOnResetListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$OnResetListener;)V

    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mButton4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 72
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 77
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 78
    return-void
.end method

.method protected onGenerateResult()V
    .registers 15

    .prologue
    .line 121
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getCurrentRotation()D

    move-result-wide v6

    double-to-int v10, v6

    .line 122
    .local v10, "rotation":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getStraightenAngle()D

    move-result-wide v2

    .line 123
    .local v2, "rotationFromStraighten":D
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getHorizontalFlip()Z

    move-result v8

    .line 124
    .local v8, "horizontal":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getVerticalFlip()Z

    move-result v11

    .line 125
    .local v11, "vertical":Z
    const-wide/high16 v6, 0x3ff0000000000000L

    iget-object v12, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getGrowthFactor()D

    move-result-wide v12

    div-double v4, v6, v12

    .line 127
    .local v4, "growthFactor":D
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;

    .line 128
    .local v1, "filter":Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;
    invoke-virtual {v1, v8, v11}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->setFlip(ZZ)Z

    .line 129
    invoke-virtual {v1, v10}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->setFixedRotation(I)Z

    move-wide v6, v4

    .line 130
    invoke-virtual/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->setStraighten(DDD)Z

    .line 136
    :try_start_31
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v7, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-virtual {v1, v6, v7, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->execute(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    :try_end_39
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_39} :catch_5b

    move-result-object v9

    .line 143
    .local v9, "output":Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mAdjustImageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v6, v9}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 144
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 145
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    new-instance v7, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-direct {v7, v12}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 147
    invoke-virtual {p0, v9}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 148
    .end local v9    # "output":Landroid/graphics/Bitmap;
    :goto_5a
    return-void

    .line 137
    :catch_5b
    move-exception v0

    .line 138
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 139
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->onGenericError(Ljava/lang/Exception;)V

    goto :goto_5a
.end method

.method public onResetComplete()V
    .registers 2

    .prologue
    .line 176
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->cancel()V

    .line 177
    return-void
.end method
