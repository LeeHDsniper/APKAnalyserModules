.class public Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;
.super Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;
.source "OverlayOverlay.java"


# instance fields
.field private mBottomArrow:Landroid/graphics/drawable/Drawable;

.field private final mTextAlign:Landroid/text/Layout$Alignment;

.field private mTitleDrawable1:Landroid/graphics/drawable/Drawable;

.field private mTitleText:Ljava/lang/CharSequence;

.field private final mTitleWidthFraction:F

.field private mTopArrow:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_pinch"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-direct {p0, p1, v1, p2, v2}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 29
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_editor_overlay_arrow_top:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    .line 30
    sget v1, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_editor_overlay_arrow_top:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mBottomArrow:Landroid/graphics/drawable/Drawable;

    .line 32
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleText:Ljava/lang/CharSequence;

    .line 34
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getTitleWidthFraction(Landroid/content/res/Resources;)F

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleWidthFraction:F

    .line 36
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    .line 37
    const/4 v1, 0x2

    new-array v1, v1, [I

    fill-array-data v1, :array_4c

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->addCloseButton([I)V

    .line 38
    return-void

    .line 37
    :array_4c
    .array-data 4
        0xa
        0x9
    .end array-data
.end method

.method private calculateTextLayouts()V
    .registers 14

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->isAttachedToParent()Z

    move-result v8

    if-nez v8, :cond_7

    .line 120
    :goto_6
    return-void

    .line 92
    :cond_7
    const/4 v0, 0x0

    .line 93
    .local v0, "alpha":I
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mOrientationChanged:Z

    if-eqz v8, :cond_e

    .line 94
    const/16 v0, 0xff

    .line 97
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 100
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    iget v8, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v8, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleWidthFraction:F

    const/high16 v10, 0x42c80000

    div-float/2addr v9, v10

    mul-float/2addr v8, v9

    float-to-int v5, v8

    .line 102
    .local v5, "titleWidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleText:Ljava/lang/CharSequence;

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v8, v9, v5, v10}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->generateTitleDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    .line 104
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    .line 105
    .local v7, "width":I
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    .line 107
    .local v2, "height":I
    new-instance v4, Landroid/graphics/Rect;

    .line 108
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    div-int/lit8 v9, v7, 0x2

    sub-int/2addr v8, v9

    .line 109
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    div-int/lit8 v10, v2, 0x2

    sub-int/2addr v9, v10

    .line 110
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    div-int/lit8 v11, v7, 0x2

    add-int/2addr v10, v11

    .line 111
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getHeight()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    div-int/lit8 v12, v2, 0x2

    add-int/2addr v11, v12

    invoke-direct {v4, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 113
    .local v4, "textBounds":Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getTextMargins()I

    move-result v9

    const-string v10, "top"

    invoke-direct {p0, v8, v4, v9, v10}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;

    move-result-object v6

    .line 114
    .local v6, "topArrowBounds":Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getTextMargins()I

    move-result v9

    const-string v10, "bottom"

    invoke-direct {p0, v8, v4, v9, v10}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;

    move-result-object v1

    .line 116
    .local v1, "bottomArrowBounds":Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v6}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 117
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mBottomArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 118
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 119
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto/16 :goto_6
.end method

.method private generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;
    .registers 11
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "relativeTo"    # Landroid/graphics/Rect;
    .param p3, "margins"    # I
    .param p4, "relativePosition"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v4, 0x0

    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 124
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 125
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 127
    .local v0, "drawableHeight":I
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v4, v4, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 129
    .local v3, "textBounds":Landroid/graphics/Rect;
    const-string v4, "top"

    invoke-virtual {v4, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 130
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v4, v1

    div-int/lit8 v4, v4, 0x2

    iget v5, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v0

    sub-int/2addr v5, p3

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 134
    :goto_26
    return-object v3

    .line 132
    :cond_27
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v4, v1

    div-int/lit8 v4, v4, 0x2

    iget v5, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, p3

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_26
.end method


# virtual methods
.method protected calculatePositions()V
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "calculatePositions"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 84
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->calculateTextLayouts()V

    .line 85
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v7, 0x42340000

    .line 163
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getVisibility()I

    move-result v3

    if-nez v3, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->isAttachedToParent()Z

    move-result v3

    if-nez v3, :cond_f

    .line 192
    :cond_e
    :goto_e
    return-void

    .line 167
    :cond_f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getBackgroundColor()I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 169
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 172
    .local v0, "count":I
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 173
    .local v1, "matrix":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 174
    .local v2, "textBounds":Landroid/graphics/Rect;
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1, v7, v3, v4}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 175
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 176
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 177
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 180
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 181
    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 182
    const/high16 v3, 0x3f800000

    const/high16 v4, -0x40800000

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mBottomArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 183
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1, v7, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 184
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 185
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mBottomArrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 186
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 189
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 191
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto :goto_e
.end method

.method protected doShow()V
    .registers 3

    .prologue
    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "doShow"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 140
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_e

    .line 144
    :goto_d
    return-void

    .line 143
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->fadeIn()V

    goto :goto_d
.end method

.method protected getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 45
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_pinch_to_zoom:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitleWidthFraction(Landroid/content/res/Resources;)F
    .registers 4
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    const/16 v1, 0x64

    .line 41
    sget v0, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_overlay_overlay_text_width:I

    invoke-virtual {p1, v0, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    return v0
.end method

.method protected inAnimationCompleted()V
    .registers 3

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 157
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 159
    :cond_e
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_2d

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    if-eqz v0, :cond_2d

    .line 73
    const-string v0, "button"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->trackTutorialClosed(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;->onClose(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    .line 79
    :goto_2c
    return-void

    .line 78
    :cond_2d
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->onClick(Landroid/view/View;)V

    goto :goto_2c
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 51
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->isActive()Z

    move-result v0

    if-nez v0, :cond_e

    .line 65
    :cond_d
    :goto_d
    return v1

    .line 55
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    if-eqz v0, :cond_1d

    .line 56
    const-string v0, "background"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->trackTutorialClosed(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;->onClose(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    goto :goto_d

    .line 61
    :cond_1d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_d

    .line 62
    const-string v0, "background"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->hide(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public setAlpha(F)V
    .registers 5
    .param p1, "alpha"    # F

    .prologue
    const/high16 v2, 0x437f0000

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTopArrow:Landroid/graphics/drawable/Drawable;

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mBottomArrow:Landroid/graphics/drawable/Drawable;

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/OverlayOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 151
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->setAlpha(F)V

    .line 152
    return-void
.end method
