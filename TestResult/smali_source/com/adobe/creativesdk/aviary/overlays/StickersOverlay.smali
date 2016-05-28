.class public Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;
.super Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;
.source "StickersOverlay.java"


# instance fields
.field private arrow:Landroid/graphics/drawable/Drawable;

.field private final mDensity:F

.field private mDetailText:Ljava/lang/CharSequence;

.field private mDetailsLayout:Landroid/text/DynamicLayout;

.field private mDetailsPosition:Landroid/graphics/Rect;

.field private mTextAlign:Landroid/text/Layout$Alignment;

.field private mTextRelativePosition:Ljava/lang/CharSequence;

.field private mTextWidthFraction:F

.field private mTitleLayout:Landroid/text/DynamicLayout;

.field private mTitlePosition:Landroid/graphics/Rect;

.field private mTitleText:Ljava/lang/CharSequence;

.field private packView:Landroid/view/View;

.field private final viewRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/view/View;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "styleId"    # I
    .param p3, "view"    # Landroid/view/View;
    .param p4, "toolName"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .param p5, "tutorialId"    # I

    .prologue
    .line 47
    invoke-static {p4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1, v2, p2, p5}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    .line 49
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 51
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    iput v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDensity:F

    .line 53
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    .line 54
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->generateArrow()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    .line 56
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->packView:Landroid/view/View;

    .line 58
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleText:Ljava/lang/CharSequence;

    .line 59
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getDetailText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailText:Ljava/lang/CharSequence;

    .line 61
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTextWidthFraction(Landroid/content/res/Resources;)F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextWidthFraction:F

    .line 62
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTextRelativePosition(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextRelativePosition:Ljava/lang/CharSequence;

    .line 64
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_overlay_default_text_align:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "textAlign":Ljava/lang/String;
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v2}, Landroid/text/Layout$Alignment;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    .line 67
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    .line 83
    :goto_50
    const/4 v2, 0x2

    new-array v2, v2, [I

    fill-array-data v2, :array_6c

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->addCloseButton([I)V

    .line 84
    return-void

    .line 68
    :cond_5a
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    invoke-virtual {v2, v1}, Landroid/text/Layout$Alignment;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_67

    .line 69
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    goto :goto_50

    .line 71
    :cond_67
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    goto :goto_50

    .line 83
    :array_6c
    .array-data 4
        0xa
        0x9
    .end array-data
.end method

.method private calculateTextLayouts()V
    .registers 11

    .prologue
    .line 219
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->isAttachedToParent()Z

    move-result v6

    if-nez v6, :cond_7

    .line 266
    :cond_6
    :goto_6
    return-void

    .line 223
    :cond_7
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->packView:Landroid/view/View;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v6, v7}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 225
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    if-eqz v6, :cond_1a

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    if-eqz v6, :cond_1a

    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mOrientationChanged:Z

    if-eqz v6, :cond_6

    .line 227
    :cond_1a
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    .line 228
    .local v0, "centerX":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    .line 229
    .local v1, "centerY":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v5, v6, Landroid/graphics/Rect;->top:I

    .line 230
    .local v5, "top":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v2, v6, Landroid/graphics/Rect;->left:I

    .line 232
    .local v2, "left":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 234
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    iget v6, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v6, v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextWidthFraction:F

    const/high16 v8, 0x42c80000

    div-float/2addr v7, v8

    mul-float/2addr v6, v7

    float-to-int v4, v6

    .line 236
    .local v4, "textWidth":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailText:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v6, v4, v7}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->generateTextLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    .line 237
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    .line 239
    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->POSITION_LEFT:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextRelativePosition:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_fd

    .line 240
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    div-int/lit8 v7, v4, 0x2

    sub-int v7, v2, v7

    iput v7, v6, Landroid/graphics/Rect;->left:I

    .line 247
    :goto_5f
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v8}, Landroid/text/DynamicLayout;->getWidth()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v6, Landroid/graphics/Rect;->right:I

    .line 248
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    .line 249
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    sub-int v7, v5, v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v8}, Landroid/text/DynamicLayout;->getHeight()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTextMargins()I

    move-result v8

    sub-int/2addr v7, v8

    int-to-float v7, v7

    const/high16 v8, 0x41200000

    iget v9, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDensity:F

    mul-float/2addr v8, v9

    sub-float/2addr v7, v8

    float-to-int v7, v7

    iput v7, v6, Landroid/graphics/Rect;->top:I

    .line 250
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v8}, Landroid/text/DynamicLayout;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v6, Landroid/graphics/Rect;->bottom:I

    .line 252
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    iget v7, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    if-le v6, v7, :cond_11b

    .line 253
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTextMargins()I

    move-result v8

    sub-int/2addr v7, v8

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 258
    :cond_b7
    :goto_b7
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleText:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v6, v4, v7}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->generateTitleLayout(Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/text/DynamicLayout;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    .line 260
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    .line 261
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    iput v7, v6, Landroid/graphics/Rect;->left:I

    .line 262
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iput v7, v6, Landroid/graphics/Rect;->right:I

    .line 263
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v8}, Landroid/text/DynamicLayout;->getHeight()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTitleMargins()I

    move-result v8

    sub-int/2addr v7, v8

    iput v7, v6, Landroid/graphics/Rect;->top:I

    .line 264
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v8}, Landroid/text/DynamicLayout;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v6, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_6

    .line 241
    :cond_fd
    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->POSITION_CENTER:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTextRelativePosition:Ljava/lang/CharSequence;

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_111

    .line 242
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    div-int/lit8 v7, v4, 0x2

    sub-int v7, v0, v7

    iput v7, v6, Landroid/graphics/Rect;->left:I

    goto/16 :goto_5f

    .line 244
    :cond_111
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    iput v7, v6, Landroid/graphics/Rect;->left:I

    goto/16 :goto_5f

    .line 254
    :cond_11b
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    if-gez v6, :cond_b7

    .line 255
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getTextMargins()I

    move-result v7

    iput v7, v6, Landroid/graphics/Rect;->left:I

    goto :goto_b7
.end method

.method private trackPackClicked()V
    .registers 4

    .prologue
    .line 287
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_28

    .line 288
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getToolName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": tutorial_pack_selected"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 290
    :cond_28
    return-void
.end method


# virtual methods
.method protected calculatePositions()V
    .registers 3

    .prologue
    .line 214
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "calculatePositions"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 215
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->calculateTextLayouts()V

    .line 216
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v6, 0x41200000

    .line 146
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getVisibility()I

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->isAttachedToParent()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->packView:Landroid/view/View;

    if-nez v0, :cond_13

    .line 205
    :cond_12
    :goto_12
    return-void

    .line 158
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    .line 167
    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    .line 168
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDensity:F

    mul-float/2addr v3, v6

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    .line 169
    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    iget v5, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDensity:F

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    float-to-int v4, v4

    .line 166
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 173
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->calculateTextLayouts()V

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    if-eqz v0, :cond_71

    .line 176
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsPosition:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v0, p1}, Landroid/text/DynamicLayout;->draw(Landroid/graphics/Canvas;)V

    .line 182
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 185
    :cond_71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    if-eqz v0, :cond_8d

    .line 186
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 187
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitlePosition:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v0, p1}, Landroid/text/DynamicLayout;->draw(Landroid/graphics/Canvas;)V

    .line 194
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 198
    :cond_8d
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->packView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 201
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 204
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto/16 :goto_12
.end method

.method protected doShow()V
    .registers 3

    .prologue
    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "doShow"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 280
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_e

    .line 284
    :goto_d
    return-void

    .line 283
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->fadeIn()V

    goto :goto_d
.end method

.method protected getDetailText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 99
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_stickers_text:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextMargins()I
    .registers 3

    .prologue
    .line 209
    const/high16 v0, 0x40a00000

    iget v1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDensity:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method protected getTextRelativePosition(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 87
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_overlay_stickers_text_position:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTextWidthFraction(Landroid/content/res/Resources;)F
    .registers 4
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    const/16 v1, 0x64

    .line 91
    sget v0, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_overlay_stickers_text_width:I

    invoke-virtual {p1, v0, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    return v0
.end method

.method protected getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 95
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_stickers:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected inAnimationCompleted()V
    .registers 3

    .prologue
    .line 270
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "inAnimationCompleted"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 272
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 273
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 275
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 14
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x1

    const-wide/high16 v10, 0x4000000000000000L

    .line 294
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 295
    .local v3, "xDelta":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->centerY()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v4

    .line 296
    .local v4, "yDelta":F
    float-to-double v6, v3

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    float-to-double v8, v4

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    add-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    .line 297
    .local v0, "distanceFromFocus":D
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    const/high16 v7, 0x3fc00000

    div-float/2addr v6, v7

    float-to-int v2, v6

    .line 308
    .local v2, "radius":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->viewRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v8

    float-to-int v8, v8

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_54

    .line 309
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->trackPackClicked()V

    .line 310
    const/4 v5, 0x0

    .line 319
    :cond_53
    :goto_53
    return v5

    .line 314
    :cond_54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    if-nez v6, :cond_53

    .line 315
    const-string v6, "background"

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->hide(Ljava/lang/String;)V

    goto :goto_53
.end method

.method public setAlpha(F)V
    .registers 5
    .param p1, "alpha"    # F

    .prologue
    const/high16 v2, 0x437f0000

    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    if-eqz v0, :cond_12

    .line 133
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v0}, Landroid/text/DynamicLayout;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 136
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    if-eqz v0, :cond_22

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    invoke-virtual {v0}, Landroid/text/DynamicLayout;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 140
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->arrow:Landroid/graphics/drawable/Drawable;

    mul-float v1, p1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 141
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->setAlpha(F)V

    .line 142
    return-void
.end method

.method public setText(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->setText(Ljava/lang/CharSequence;)V

    .line 122
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailText:Ljava/lang/CharSequence;

    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    .line 127
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->postInvalidate()V

    .line 128
    return-void
.end method

.method public setTitle(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->setTitle(Ljava/lang/CharSequence;)V

    .line 112
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleText:Ljava/lang/CharSequence;

    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mTitleLayout:Landroid/text/DynamicLayout;

    .line 117
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->postInvalidate()V

    .line 118
    return-void
.end method

.method public update(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "update"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 104
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->packView:Landroid/view/View;

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->mDetailsLayout:Landroid/text/DynamicLayout;

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->calculatePositions()V

    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->postInvalidate()V

    .line 108
    return-void
.end method
