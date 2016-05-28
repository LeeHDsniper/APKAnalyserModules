.class public Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;
.super Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;
.source "BlemishOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;
    }
.end annotation


# instance fields
.field private alpha1:I

.field private alpha2:I

.field private mDetailText1:Ljava/lang/CharSequence;

.field private mDetailText2:Ljava/lang/CharSequence;

.field private mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

.field private mTextAlign1:Landroid/text/Layout$Alignment;

.field private mTextDrawable1:Landroid/graphics/drawable/Drawable;

.field private mTextDrawable2:Landroid/graphics/drawable/Drawable;

.field private mTextRelativePosition1:Ljava/lang/CharSequence;

.field private mTextRelativePosition2:Ljava/lang/CharSequence;

.field private mTextWidthFraction1:F

.field private mTextWidthFraction2:F

.field private mTitleDrawable1:Landroid/graphics/drawable/Drawable;

.field private mTitleDrawable2:Landroid/graphics/drawable/Drawable;

.field private mTitleText1:Ljava/lang/CharSequence;

.field private mTitleText2:Ljava/lang/CharSequence;

.field private mView1:Landroid/view/View;

.field private mView2:Landroid/view/View;

.field private ripple:Landroid/graphics/drawable/Drawable;

.field private final viewRect1:Landroid/graphics/Rect;

.field private final viewRect2:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Landroid/view/View;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "view1"    # Landroid/view/View;
    .param p3, "view2"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/16 v4, 0x64

    .line 53
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 54
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$attr;->com_adobe_image_editor_blemish_overlay_style:I

    .line 53
    invoke-direct {p0, p1, v2, v3, v6}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    .line 30
    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->NONE:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 49
    iput v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha2:I

    .line 50
    iput v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha1:I

    .line 57
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView1:Landroid/view/View;

    .line 58
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView2:Landroid/view/View;

    .line 59
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    .line 60
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    .line 61
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateRipple()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 65
    .local v0, "res":Landroid/content/res/Resources;
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_tap_title:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleText1:Ljava/lang/CharSequence;

    .line 66
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_blemish_tap_text:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mDetailText1:Ljava/lang/CharSequence;

    .line 67
    sget v2, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_overlay_blemish_text1_width:I

    invoke-virtual {v0, v2, v4, v4}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextWidthFraction1:F

    .line 68
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_overlay_blemish_text1_position:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextRelativePosition1:Ljava/lang/CharSequence;

    .line 70
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_zoom_title:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleText2:Ljava/lang/CharSequence;

    .line 71
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_zoom_text:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mDetailText2:Ljava/lang/CharSequence;

    .line 72
    sget v2, Lcom/aviary/android/feather/sdk/R$fraction;->com_adobe_image_editor_overlay_blemish_text2_width:I

    invoke-virtual {v0, v2, v4, v4}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextWidthFraction2:F

    .line 73
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_overlay_blemish_text2_position:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextRelativePosition2:Ljava/lang/CharSequence;

    .line 75
    sget v2, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_overlay_default_text_align:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "textAlign":Ljava/lang/String;
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v2}, Landroid/text/Layout$Alignment;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_92

    .line 78
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    .line 84
    :goto_89
    new-array v2, v6, [I

    fill-array-data v2, :array_a4

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->addCloseButton([I)V

    .line 85
    return-void

    .line 79
    :cond_92
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    invoke-virtual {v2, v1}, Landroid/text/Layout$Alignment;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9f

    .line 80
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    goto :goto_89

    .line 82
    :cond_9f
    sget-object v2, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    goto :goto_89

    .line 84
    :array_a4
    .array-data 4
        0xa
        0x9
    .end array-data
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->onAnimationComplete()V

    return-void
.end method

.method private calculateTextLayouts()V
    .registers 14

    .prologue
    const/high16 v12, 0x42c80000

    const/4 v11, 0x0

    .line 292
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->isAttachedToParent()Z

    move-result v5

    if-nez v5, :cond_a

    .line 357
    :cond_9
    :goto_9
    return-void

    .line 296
    :cond_a
    const/4 v0, 0x0

    .line 297
    .local v0, "alpha":I
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v5, v6, :cond_13

    .line 298
    const/16 v0, 0xff

    .line 301
    :cond_13
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 303
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->FIRST:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v5, v6, :cond_1d

    .line 307
    :cond_1d
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v5, v6, :cond_29

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v5, v6, :cond_f6

    .line 308
    :cond_29
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v5, v6, :cond_37

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_37

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_f6

    .line 309
    :cond_37
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView1:Landroid/view/View;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    invoke-virtual {v5, v6}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 311
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    .line 312
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    div-int/lit8 v7, v7, 0x3

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    .line 313
    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    div-int/lit8 v8, v8, 0x3

    add-int/2addr v7, v8

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->left:I

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    .line 314
    invoke-virtual {v9}, Landroid/graphics/Rect;->width()I

    move-result v9

    div-int/lit8 v9, v9, 0x3

    add-int/2addr v8, v9

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v9

    add-int/2addr v8, v9

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect1:Landroid/graphics/Rect;

    .line 315
    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    div-int/lit8 v10, v10, 0x3

    add-int/2addr v9, v10

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    add-int/2addr v9, v10

    .line 311
    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 316
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 318
    iget v5, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v5, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextWidthFraction1:F

    div-float/2addr v6, v12

    mul-float/2addr v5, v6

    float-to-int v3, v5

    .line 321
    .local v3, "textWidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mDetailText1:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v5, v6, v3, v7}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateTextDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    .line 322
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getTextMargins()I

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextRelativePosition1:Ljava/lang/CharSequence;

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;

    move-result-object v2

    .line 323
    .local v2, "textBounds":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 324
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 327
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleText1:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v5, v6, v3, v7}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateTitleDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    .line 328
    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    invoke-direct {v4, v11, v11, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 329
    .local v4, "titleBounds":Landroid/graphics/Rect;
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getTitleMargins()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 331
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 332
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 337
    .end local v2    # "textBounds":Landroid/graphics/Rect;
    .end local v3    # "textWidth":I
    .end local v4    # "titleBounds":Landroid/graphics/Rect;
    :cond_f6
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v5, v6, :cond_102

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v5, v6, :cond_9

    .line 338
    :cond_102
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v5, v6, :cond_110

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_110

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_9

    .line 339
    :cond_110
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView2:Landroid/view/View;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    invoke-virtual {v5, v6}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 341
    iget v5, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v5, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextWidthFraction2:F

    div-float/2addr v6, v12

    mul-float/2addr v5, v6

    float-to-int v3, v5

    .line 344
    .restart local v3    # "textWidth":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mDetailText2:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v5, v6, v3, v7}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateTextDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    .line 345
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getTextMargins()I

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextRelativePosition2:Ljava/lang/CharSequence;

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;

    move-result-object v2

    .line 346
    .restart local v2    # "textBounds":Landroid/graphics/Rect;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 347
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 350
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleText2:Ljava/lang/CharSequence;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextAlign1:Landroid/text/Layout$Alignment;

    invoke-virtual {p0, v5, v6, v3, v7}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateTitleDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    .line 351
    new-instance v4, Landroid/graphics/Rect;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    invoke-direct {v4, v11, v11, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 352
    .restart local v4    # "titleBounds":Landroid/graphics/Rect;
    iget v5, v2, Landroid/graphics/Rect;->left:I

    iget v6, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getTitleMargins()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 353
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 354
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto/16 :goto_9
.end method

.method private generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;
    .registers 13
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "relativeTo"    # Landroid/graphics/Rect;
    .param p3, "margins"    # I
    .param p4, "relativePosition"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v6, 0x0

    .line 360
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 361
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 362
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 364
    .local v0, "drawableHeight":I
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v6, v6, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 367
    .local v4, "textBounds":Landroid/graphics/Rect;
    iget v6, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v7

    sub-int/2addr v6, v7

    sub-int v5, v6, p3

    .line 369
    .local v5, "top":I
    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->POSITION_LEFT:Ljava/lang/CharSequence;

    invoke-virtual {v6, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 370
    iget v6, p2, Landroid/graphics/Rect;->left:I

    sub-int v2, v6, v1

    .line 377
    .local v2, "left":I
    :goto_27
    invoke-virtual {v4, v2, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 379
    iget v6, v4, Landroid/graphics/Rect;->right:I

    iget v7, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    if-le v6, v7, :cond_52

    .line 380
    iget v6, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v7

    sub-int/2addr v6, v7

    sub-int/2addr v6, p3

    iget v7, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 385
    :cond_3d
    :goto_3d
    return-object v4

    .line 371
    .end local v2    # "left":I
    :cond_3e
    sget-object v6, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->POSITION_CENTER:Ljava/lang/CharSequence;

    invoke-virtual {v6, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 372
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    div-int/lit8 v7, v1, 0x2

    sub-int v2, v6, v7

    .restart local v2    # "left":I
    goto :goto_27

    .line 374
    .end local v2    # "left":I
    :cond_4f
    iget v2, p2, Landroid/graphics/Rect;->right:I

    .restart local v2    # "left":I
    goto :goto_27

    .line 381
    :cond_52
    iget v6, v4, Landroid/graphics/Rect;->left:I

    if-gez v6, :cond_3d

    .line 382
    iget v6, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v4, p3, v6}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_3d
.end method

.method private onAnimationComplete()V
    .registers 3

    .prologue
    .line 172
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$4;->$SwitchMap$com$adobe$creativesdk$aviary$overlays$BlemishOverlay$State:[I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    .line 188
    :goto_d
    :pswitch_d
    return-void

    .line 177
    :pswitch_e
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->setState(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;)V

    goto :goto_d

    .line 181
    :pswitch_14
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->setState(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;)V

    goto :goto_d

    .line 172
    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_e
        :pswitch_14
    .end packed-switch
.end method

.method private setState(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;)V
    .registers 2
    .param p1, "state"    # Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .prologue
    .line 389
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 390
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->calculatePositions()V

    .line 391
    return-void
.end method


# virtual methods
.method public calculatePositions()V
    .registers 1

    .prologue
    .line 229
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->calculateTextLayouts()V

    .line 230
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 249
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getVisibility()I

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->isAttachedToParent()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView1:Landroid/view/View;

    if-nez v0, :cond_12

    .line 289
    :cond_11
    :goto_11
    return-void

    .line 253
    :cond_12
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->calculateTextLayouts()V

    .line 254
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 256
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->SECOND:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v0, v2, :cond_2e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v0, v2, :cond_2e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v0, v2, :cond_3d

    .line 257
    :cond_2e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 258
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 259
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 262
    :cond_3d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->THIRD:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-eq v0, v2, :cond_49

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    sget-object v2, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    if-ne v0, v2, :cond_8b

    .line 263
    :cond_49
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 267
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 270
    iget v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha2:I

    const/16 v2, 0xff

    if-ge v0, v2, :cond_8f

    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    .line 274
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v3, v0

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->viewRect2:Landroid/graphics/Rect;

    .line 275
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v4, v0

    iget v5, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha2:I

    const/4 v6, 0x4

    move-object v0, p1

    move v2, v1

    .line 271
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    move-result v7

    .line 278
    .local v7, "count":I
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView2:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 279
    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 284
    .end local v7    # "count":I
    :goto_88
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 288
    :cond_8b
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto :goto_11

    .line 281
    :cond_8f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mView2:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    goto :goto_88
.end method

.method protected doShow()V
    .registers 2

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_7

    .line 238
    :goto_6
    return-void

    .line 237
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->fadeIn()V

    goto :goto_6
.end method

.method protected generateInAnimation()Lcom/nineoldandroids/animation/Animator;
    .registers 10

    .prologue
    const/4 v8, 0x2

    .line 90
    new-instance v3, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v3}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 93
    .local v3, "animatorSet":Lcom/nineoldandroids/animation/AnimatorSet;
    const-string v5, "alpha"

    new-array v6, v8, [F

    fill-array-data v6, :array_8a

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v4

    .line 94
    .local v4, "fadein":Lcom/nineoldandroids/animation/Animator;
    const-string v5, "alpha1"

    new-array v6, v8, [I

    fill-array-data v6, :array_92

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 95
    .local v0, "animation1":Lcom/nineoldandroids/animation/Animator;
    const-string v5, "alpha2"

    new-array v6, v8, [I

    fill-array-data v6, :array_9a

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    .line 96
    .local v1, "animation2":Lcom/nineoldandroids/animation/Animator;
    new-array v5, v8, [I

    fill-array-data v5, :array_a2

    invoke-static {v5}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v2

    .line 98
    .local v2, "animation3":Lcom/nineoldandroids/animation/Animator;
    const-wide/16 v6, 0xc8

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 99
    const-wide/16 v6, 0x12c

    invoke-virtual {v1, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 100
    const-wide/16 v6, 0x190

    invoke-virtual {v2, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 104
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v1, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 107
    new-instance v5, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$1;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$1;-><init>(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V

    invoke-virtual {v4, v5}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 124
    new-instance v5, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$2;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$2;-><init>(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V

    invoke-virtual {v0, v5}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 146
    new-instance v5, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$3;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$3;-><init>(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V

    invoke-virtual {v1, v5}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 166
    const/4 v5, 0x4

    new-array v5, v5, [Lcom/nineoldandroids/animation/Animator;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    const/4 v6, 0x1

    aput-object v0, v5, v6

    aput-object v1, v5, v8

    const/4 v6, 0x3

    aput-object v2, v5, v6

    invoke-virtual {v3, v5}, Lcom/nineoldandroids/animation/AnimatorSet;->playSequentially([Lcom/nineoldandroids/animation/Animator;)V

    .line 168
    return-object v3

    .line 93
    nop

    :array_8a
    .array-data 4
        0x0
        0x3f800000
    .end array-data

    .line 94
    :array_92
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 95
    :array_9a
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 96
    :array_a2
    .array-data 4
        0x0
        0xff
    .end array-data
.end method

.method public getAlpha1()I
    .registers 2

    .prologue
    .line 214
    iget v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha1:I

    return v0
.end method

.method public getAlpha2()I
    .registers 2

    .prologue
    .line 200
    iget v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha2:I

    return v0
.end method

.method protected inAnimationCompleted()V
    .registers 3

    .prologue
    .line 242
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 243
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 245
    :cond_e
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 401
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->ALL:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mState:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    .line 402
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 403
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 219
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_c

    .line 220
    const-string v0, "background"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->hide(Ljava/lang/String;)V

    .line 224
    :cond_c
    return v1
.end method

.method public setAlpha1(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 205
    iput p1, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha1:I

    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->ripple:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 209
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->postInvalidate()V

    .line 210
    return-void
.end method

.method public setAlpha2(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->alpha2:I

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTitleDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->mTextDrawable2:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 195
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->postInvalidate()V

    .line 196
    return-void
.end method

.method public showDelayed(J)Z
    .registers 4
    .param p1, "delay"    # J

    .prologue
    .line 395
    sget-object v0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;->FIRST:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->setState(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$State;)V

    .line 396
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->showDelayed(J)Z

    move-result v0

    return v0
.end method
