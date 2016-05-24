.class public Lcom/adobe/creativesdk/aviary/widget/HighlightView;
.super Ljava/lang/Object;
.source "HighlightView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;
    }
.end annotation


# instance fields
.field protected animationDurationMs:I

.field private dHeight:I

.field private dWidth:I

.field final hysteresis:F

.field private mAlpha:F

.field private mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

.field private mDrawRect:Landroid/graphics/Rect;

.field private mHidden:Z

.field private mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

.field private mInitialAspectRatio:D

.field private mInversePath:Landroid/graphics/Path;

.field private mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

.field private mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

.field private mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

.field private mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

.field private mMaintainAspectRatio:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMinSize:I

.field private mMode:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

.field private final mOutlineFill:Landroid/graphics/Paint;

.field private final mOutlinePaint:Landroid/graphics/Paint;

.field private mOutsideFillColor:I

.field private mOutsideFillColorPressed:I

.field private mParentHeight:I

.field private mParentWidth:I

.field private mPath:Landroid/graphics/Path;

.field protected volatile mRunning:Z

.field private mStrokeColor:I

.field private mStrokeColorPressed:I

.field private mStrokeWidth:I

.field private mViewDrawingRect:Landroid/graphics/Rect;

.field private tempLayoutRectF:Landroid/graphics/RectF;

.field private tmpDisplayRectF:Landroid/graphics/RectF;

.field private tmpDrawRect2F:Landroid/graphics/RectF;

.field private tmpDrawRectF:Landroid/graphics/RectF;

.field private tmpRect2:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

.field private tmpRect4:Landroid/graphics/Rect;

.field private tmpRectMotion:Landroid/graphics/Rect;

.field private tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .registers 15
    .param p1, "context"    # Landroid/view/View;
    .param p2, "styleId"    # I

    .prologue
    const/4 v11, 0x2

    const/high16 v10, -0x67000000

    const-wide/high16 v8, 0x4000000000000000L

    const/4 v6, 0x0

    const/4 v7, -0x1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/high16 v1, 0x41f00000

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->hysteresis:F

    .line 30
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    .line 31
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    .line 32
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    .line 33
    const/16 v1, 0x12c

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->animationDurationMs:I

    .line 36
    const/16 v1, 0x14

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMinSize:I

    .line 38
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 42
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    .line 54
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    .line 55
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mPath:Landroid/graphics/Path;

    .line 56
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInversePath:Landroid/graphics/Path;

    .line 57
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect2:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 58
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    .line 59
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRect2F:Landroid/graphics/RectF;

    .line 60
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRectF:Landroid/graphics/RectF;

    .line 61
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    .line 62
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotion:Landroid/graphics/Rect;

    .line 63
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 64
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    .line 69
    if-lez p2, :cond_10d

    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v6, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView:[I

    invoke-virtual {v1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 72
    .local v0, "appearance":Landroid/content/res/TypedArray;
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_adobe_strokeSize:I

    invoke-virtual {v0, v1, v11}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeWidth:I

    .line 73
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_adobe_strokeColor:I

    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColor:I

    .line 74
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_adobe_strokeColorPressed:I

    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColorPressed:I

    .line 78
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_adobe_color1:I

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColor:I

    .line 79
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_adobe_color2:I

    invoke-virtual {v0, v1, v10}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColorPressed:I

    .line 81
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    .line 82
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    .line 83
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    .line 84
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageCropHighlightView_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    .line 86
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    .end local v0    # "appearance":Landroid/content/res/TypedArray;
    :goto_d3
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_f7

    .line 96
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-double v4, v1

    .line 97
    .local v4, "w":D
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    int-to-double v2, v1

    .line 99
    .local v2, "h":D
    div-double v6, v4, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v1, v6

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    .line 100
    div-double v6, v2, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v1, v6

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    .line 104
    .end local v2    # "h":D
    .end local v4    # "w":D
    :cond_f7
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 105
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentWidth:I

    .line 106
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentHeight:I

    .line 107
    const/high16 v1, 0x3f800000

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mAlpha:F

    .line 108
    return-void

    .line 88
    :cond_10d
    iput v11, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeWidth:I

    .line 89
    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColor:I

    .line 90
    iput v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColorPressed:I

    .line 91
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColor:I

    .line 92
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColorPressed:I

    goto :goto_d3
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/widget/HighlightView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    return p1
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Paint;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Paint;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private adjustCropRect(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V
    .registers 16
    .param p1, "r"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    const-wide/high16 v12, 0x4000000000000000L

    const-wide/high16 v10, -0x4010000000000000L

    const-wide/16 v8, 0x0

    .line 198
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpg-double v4, v4, v6

    if-gez v4, :cond_6c

    .line 199
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v4, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v6, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    sub-double/2addr v4, v6

    invoke-virtual {p1, v4, v5, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 204
    :cond_1a
    :goto_1a
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpg-double v4, v4, v6

    if-gez v4, :cond_82

    .line 205
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v4, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v6, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    sub-double/2addr v4, v6

    invoke-virtual {p1, v8, v9, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 210
    :cond_2e
    :goto_2e
    const-wide/high16 v0, -0x4010000000000000L

    .local v0, "diffx":D
    const-wide/high16 v2, -0x4010000000000000L

    .line 212
    .local v2, "diffy":D
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v4

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-lez v4, :cond_b1

    .line 214
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpg-double v4, v4, v6

    if-gez v4, :cond_98

    .line 215
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v4, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-wide v6, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    sub-double v0, v4, v6

    .line 216
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    add-double/2addr v4, v0

    iput-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 235
    :cond_57
    :goto_57
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v4, :cond_68

    .line 236
    cmpl-double v4, v2, v10

    if-eqz v4, :cond_f1

    .line 237
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    mul-double v0, v2, v4

    .line 238
    div-double v4, v0, v12

    invoke-virtual {p1, v4, v5, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    .line 245
    :cond_68
    :goto_68
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->sort()V

    .line 246
    return-void

    .line 200
    .end local v0    # "diffx":D
    .end local v2    # "diffy":D
    :cond_6c
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v4, v4, v6

    if-lez v4, :cond_1a

    .line 201
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double/2addr v4, v6

    neg-double v4, v4

    invoke-virtual {p1, v4, v5, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    goto :goto_1a

    .line 206
    :cond_82
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v4, v4, v6

    if-lez v4, :cond_2e

    .line 207
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double/2addr v4, v6

    neg-double v4, v4

    invoke-virtual {p1, v8, v9, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    goto :goto_2e

    .line 217
    .restart local v0    # "diffx":D
    .restart local v2    # "diffy":D
    :cond_98
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v4, v4, v6

    if-lez v4, :cond_57

    .line 218
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double v0, v4, v6

    .line 219
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    neg-double v6, v0

    add-double/2addr v4, v6

    iput-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    goto :goto_57

    .line 222
    :cond_b1
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v4

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-lez v4, :cond_57

    .line 223
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpg-double v4, v4, v6

    if-gez v4, :cond_d7

    .line 225
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v4, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-wide v6, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    sub-double v2, v4, v6

    .line 226
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    add-double/2addr v4, v2

    iput-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    goto :goto_57

    .line 228
    :cond_d7
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v4, v4, v6

    if-lez v4, :cond_57

    .line 230
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v6, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double v2, v4, v6

    .line 231
    iget-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    neg-double v6, v2

    add-double/2addr v4, v6

    iput-wide v4, p1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    goto/16 :goto_57

    .line 239
    :cond_f1
    cmpl-double v4, v0, v10

    if-eqz v4, :cond_68

    .line 240
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    div-double v2, v0, v4

    .line 241
    div-double v4, v2, v12

    invoke-virtual {p1, v8, v9, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto/16 :goto_68
.end method

.method private adjustRealCropRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .registers 20
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "rect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p3, "outsideRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .prologue
    .line 251
    const/4 v2, 0x0

    .line 253
    .local v2, "adjusted":Z
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    double-to-float v10, v10

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    double-to-float v11, v12

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    double-to-float v12, v12

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    double-to-float v13, v14

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/graphics/RectF;->set(FFFF)V

    .line 254
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 256
    const/16 v9, 0x9

    new-array v3, v9, [F

    .line 257
    .local v3, "mvalues":[F
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->getValues([F)V

    .line 258
    const/4 v9, 0x0

    aget v8, v3, v9

    .line 260
    .local v8, "scale":F
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpg-double v9, v10, v12

    if-gez v9, :cond_186

    .line 261
    const/4 v2, 0x1

    .line 262
    move-object/from16 v0, p3

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    float-to-double v12, v9

    sub-double/2addr v10, v12

    float-to-double v12, v8

    div-double/2addr v10, v12

    const-wide/16 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 268
    :cond_56
    :goto_56
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpg-double v9, v10, v12

    if-gez v9, :cond_1ae

    .line 269
    const/4 v2, 0x1

    .line 270
    const-wide/16 v10, 0x0

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-double v14, v9

    sub-double/2addr v12, v14

    float-to-double v14, v8

    div-double/2addr v12, v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 276
    :cond_7b
    :goto_7b
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    double-to-float v10, v10

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    double-to-float v11, v12

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    double-to-float v12, v12

    move-object/from16 v0, p2

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    double-to-float v13, v14

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/graphics/RectF;->set(FFFF)V

    .line 277
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 279
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v9

    float-to-double v10, v9

    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v12

    cmpl-double v9, v10, v12

    if-lez v9, :cond_fe

    .line 280
    const/4 v2, 0x1

    .line 281
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    cmpg-double v9, v10, v12

    if-gez v9, :cond_d7

    .line 282
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->left:F

    float-to-double v14, v9

    sub-double/2addr v12, v14

    float-to-double v14, v8

    div-double/2addr v12, v14

    add-double/2addr v10, v12

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 284
    :cond_d7
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v9, v10, v12

    if-lez v9, :cond_fe

    .line 285
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    float-to-double v12, v9

    move-object/from16 v0, p3

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double/2addr v12, v14

    neg-double v12, v12

    float-to-double v14, v8

    div-double/2addr v12, v14

    add-double/2addr v10, v12

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 289
    :cond_fe
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v9

    float-to-double v10, v9

    invoke-virtual/range {p3 .. p3}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v12

    cmpl-double v9, v10, v12

    if-lez v9, :cond_15d

    .line 290
    const/4 v2, 0x1

    .line 291
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    cmpg-double v9, v10, v12

    if-gez v9, :cond_136

    .line 292
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-double v14, v9

    sub-double/2addr v12, v14

    float-to-double v14, v8

    div-double/2addr v12, v14

    add-double/2addr v10, v12

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 294
    :cond_136
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v9, v10, v12

    if-lez v9, :cond_15d

    .line 295
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    float-to-double v12, v9

    move-object/from16 v0, p3

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double/2addr v12, v14

    neg-double v12, v12

    float-to-double v14, v8

    div-double/2addr v12, v14

    add-double/2addr v10, v12

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 299
    :cond_15d
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v9, :cond_182

    if-eqz v2, :cond_182

    .line 300
    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    const-wide/high16 v12, 0x3ff0000000000000L

    cmpl-double v9, v10, v12

    if-ltz v9, :cond_1d6

    .line 301
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    div-double v6, v10, v12

    .line 302
    .local v6, "dy":D
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    add-double/2addr v10, v6

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 309
    .end local v6    # "dy":D
    :cond_182
    :goto_182
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->sort()V

    .line 310
    return-object p2

    .line 263
    :cond_186
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    cmpl-double v9, v10, v12

    if-lez v9, :cond_56

    .line 264
    const/4 v2, 0x1

    .line 265
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->right:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double/2addr v10, v12

    neg-double v10, v10

    float-to-double v12, v8

    div-double/2addr v10, v12

    const-wide/16 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    goto/16 :goto_56

    .line 271
    :cond_1ae
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    float-to-double v10, v9

    move-object/from16 v0, p3

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    cmpl-double v9, v10, v12

    if-lez v9, :cond_7b

    .line 272
    const/4 v2, 0x1

    .line 273
    const-wide/16 v10, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tempLayoutRectF:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    float-to-double v12, v9

    move-object/from16 v0, p3

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double/2addr v12, v14

    neg-double v12, v12

    float-to-double v14, v8

    div-double/2addr v12, v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    goto/16 :goto_7b

    .line 304
    :cond_1d6
    invoke-virtual/range {p2 .. p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v10

    move-object/from16 v0, p0

    iget-wide v12, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    mul-double v4, v10, v12

    .line 305
    .local v4, "dx":D
    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    add-double/2addr v10, v4

    move-object/from16 v0, p2

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    goto :goto_182
.end method

.method private computeLayout(ZLandroid/graphics/Rect;)V
    .registers 13
    .param p1, "adjust"    # Z
    .param p2, "outRect"    # Landroid/graphics/Rect;

    .prologue
    const-wide/16 v2, 0x0

    .line 187
    if-eqz p1, :cond_21

    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->adjustCropRect(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 189
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect2:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentWidth:I

    int-to-double v6, v0

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentHeight:I

    int-to-double v8, v0

    move-wide v4, v2

    invoke-virtual/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(DDDD)V

    .line 190
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect2:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-direct {p0, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->adjustRealCropRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 192
    :cond_21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {p0, v0, v1, p2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDisplayRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Landroid/graphics/Rect;)V

    .line 193
    return-void
.end method


# virtual methods
.method public animateTo(Landroid/view/View;Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Z)V
    .registers 20
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "m"    # Landroid/graphics/Matrix;
    .param p3, "imageRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p4, "cropRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p5, "maintainAspectRatio"    # Z

    .prologue
    .line 553
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    if-nez v2, :cond_c5

    .line 554
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    .line 555
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->None:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMode(Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;I)V

    .line 556
    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    .line 558
    new-instance v2, Landroid/graphics/Matrix;

    move-object/from16 v0, p2

    invoke-direct {v2, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    .line 559
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 560
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v0, p3

    invoke-direct {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 561
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    .line 563
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v2

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v12

    div-double/2addr v2, v12

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    .line 565
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 566
    .local v10, "oldRect":Landroid/graphics/Rect;
    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .line 567
    .local v9, "newRect":Landroid/graphics/Rect;
    const/4 v2, 0x0

    invoke-direct {p0, v2, v9}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 569
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    iget v8, v10, Landroid/graphics/Rect;->left:I

    aput v8, v2, v3

    const/4 v3, 0x1

    iget v8, v9, Landroid/graphics/Rect;->left:I

    aput v8, v2, v3

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v4

    .line 570
    .local v4, "anim1":Lcom/nineoldandroids/animation/ValueAnimator;
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    iget v8, v10, Landroid/graphics/Rect;->right:I

    aput v8, v2, v3

    const/4 v3, 0x1

    iget v8, v9, Landroid/graphics/Rect;->right:I

    aput v8, v2, v3

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v5

    .line 571
    .local v5, "anim2":Lcom/nineoldandroids/animation/ValueAnimator;
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    iget v8, v10, Landroid/graphics/Rect;->top:I

    aput v8, v2, v3

    const/4 v3, 0x1

    iget v8, v9, Landroid/graphics/Rect;->top:I

    aput v8, v2, v3

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v6

    .line 572
    .local v6, "anim3":Lcom/nineoldandroids/animation/ValueAnimator;
    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    iget v8, v10, Landroid/graphics/Rect;->bottom:I

    aput v8, v2, v3

    const/4 v3, 0x1

    iget v8, v9, Landroid/graphics/Rect;->bottom:I

    aput v8, v2, v3

    invoke-static {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v7

    .line 574
    .local v7, "anim4":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;

    move-object v3, p0

    move-object v8, p1

    invoke-direct/range {v2 .. v8}, Lcom/adobe/creativesdk/aviary/widget/HighlightView$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;Landroid/view/View;)V

    invoke-virtual {v7, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 593
    new-instance v11, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v11}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 594
    .local v11, "set":Lcom/nineoldandroids/animation/AnimatorSet;
    const/4 v2, 0x4

    new-array v2, v2, [Lcom/nineoldandroids/animation/Animator;

    const/4 v3, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v5, v2, v3

    const/4 v3, 0x2

    aput-object v6, v2, v3

    const/4 v3, 0x3

    aput-object v7, v2, v3

    invoke-virtual {v11, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->playTogether([Lcom/nineoldandroids/animation/Animator;)V

    .line 595
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->animationDurationMs:I

    int-to-long v2, v2

    invoke-virtual {v11, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    .line 596
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;->INOUT:Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/animation/ExpoInterpolator;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/animation/EasingType$Type;)V

    invoke-virtual {v11, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 597
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;

    move/from16 v0, p5

    invoke-direct {v2, p0, v0, p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;ZLandroid/view/View;)V

    invoke-virtual {v11, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 625
    invoke-virtual {v11}, Lcom/nineoldandroids/animation/AnimatorSet;->start()V

    .line 627
    .end local v4    # "anim1":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v5    # "anim2":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v6    # "anim3":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v7    # "anim4":Lcom/nineoldandroids/animation/ValueAnimator;
    .end local v9    # "newRect":Landroid/graphics/Rect;
    .end local v10    # "oldRect":Landroid/graphics/Rect;
    .end local v11    # "set":Lcom/nineoldandroids/animation/AnimatorSet;
    :cond_c5
    return-void
.end method

.method calculateDx(DD)D
    .registers 12
    .param p1, "dy"    # D
    .param p3, "dx"    # D

    .prologue
    const-wide/16 v4, 0x0

    .line 385
    move-wide v0, p3

    .line 386
    .local v0, "ndx":D
    cmpl-double v2, p1, v4

    if-eqz v2, :cond_17

    .line 387
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    mul-double v0, p1, v2

    .line 388
    cmpl-double v2, p3, v4

    if-eqz v2, :cond_17

    .line 389
    cmpl-double v2, p3, v4

    if-lez v2, :cond_18

    .line 390
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    .line 396
    :cond_17
    :goto_17
    return-wide v0

    .line 392
    :cond_18
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide/high16 v4, -0x4010000000000000L

    mul-double v0, v2, v4

    goto :goto_17
.end method

.method calculateDy(DD)D
    .registers 12
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .prologue
    const-wide/16 v4, 0x0

    .line 370
    move-wide v0, p3

    .line 371
    .local v0, "ndy":D
    cmpl-double v2, p1, v4

    if-eqz v2, :cond_17

    .line 372
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    div-double v0, p1, v2

    .line 373
    cmpl-double v2, p3, v4

    if-eqz v2, :cond_17

    .line 374
    cmpl-double v2, p3, v4

    if-lez v2, :cond_18

    .line 375
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    .line 381
    :cond_17
    :goto_17
    return-wide v0

    .line 377
    :cond_18
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide/high16 v4, -0x4010000000000000L

    mul-double v0, v2, v4

    goto :goto_17
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 110
    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 121
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mHidden:Z

    if-eqz v4, :cond_5

    .line 160
    :cond_4
    :goto_4
    return-void

    .line 125
    :cond_5
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 126
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInversePath:Landroid/graphics/Path;

    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    .line 128
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRectF:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 129
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRect2F:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 131
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInversePath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRect2F:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 132
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInversePath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRectF:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 134
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRectF:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 135
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mPath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRectF:Landroid/graphics/RectF;

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 137
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDrawRect2F:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 139
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInversePath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 140
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mPath:Landroid/graphics/Path;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 142
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    add-int/lit8 v1, v4, 0x1

    .line 143
    .local v1, "left":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/lit8 v2, v4, 0x1

    .line 144
    .local v2, "right":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    add-int/lit8 v3, v4, 0x4

    .line 145
    .local v3, "top":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v0, v4, 0x3

    .line 146
    .local v0, "bottom":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_4

    .line 148
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    sub-int v5, v1, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    sub-int v6, v3, v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    add-int/2addr v7, v1

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    add-int/2addr v8, v3

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 149
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 151
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    sub-int v5, v2, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    sub-int v6, v3, v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    add-int/2addr v7, v2

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    add-int/2addr v8, v3

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 152
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 154
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    sub-int v5, v1, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    sub-int v6, v0, v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    add-int/2addr v7, v1

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    add-int/2addr v8, v0

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 155
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 157
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    sub-int v5, v2, v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    sub-int v6, v0, v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    add-int/2addr v7, v2

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    add-int/2addr v8, v0

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 158
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_4
.end method

.method public fadeIn(Landroid/view/View;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 749
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    .line 750
    .local v0, "alpha1":I
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    .line 752
    .local v1, "alpha2":I
    const/4 v3, 0x2

    new-array v3, v3, [F

    fill-array-data v3, :array_28

    invoke-static {v3}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v2

    .line 753
    .local v2, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    const-wide/16 v4, 0xc8

    invoke-virtual {v2, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 754
    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;

    invoke-direct {v3, p0, v0, v1, p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;-><init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;IILandroid/view/View;)V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 771
    invoke-virtual {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 772
    return-void

    .line 752
    nop

    :array_28
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method

.method public getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .registers 2

    .prologue
    .line 723
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    return-object v0
.end method

.method public getDisplayRect(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Landroid/graphics/Rect;)V
    .registers 10
    .param p1, "m"    # Landroid/graphics/Matrix;
    .param p2, "supportRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p3, "outRect"    # Landroid/graphics/Rect;

    .prologue
    .line 314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    iget-wide v2, p2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    double-to-float v1, v2

    iget-wide v2, p2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    double-to-float v2, v2

    iget-wide v4, p2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    double-to-float v3, v4

    iget-wide v4, p2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    double-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 319
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 320
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 321
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 322
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    .line 323
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpDisplayRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    .line 324
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 320
    invoke-virtual {p3, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 325
    return-void
.end method

.method public getDrawRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 719
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getHit(FF)I
    .registers 11
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/high16 v7, 0x41f00000

    .line 163
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 164
    .local v1, "r":Landroid/graphics/Rect;
    invoke-direct {p0, v5, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 165
    const/4 v2, 0x1

    .line 166
    .local v2, "retval":I
    iget v6, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    sub-float/2addr v6, v7

    cmpl-float v6, p2, v6

    if-ltz v6, :cond_7c

    iget v6, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    add-float/2addr v6, v7

    cmpg-float v6, p2, v6

    if-gez v6, :cond_7c

    move v3, v4

    .line 167
    .local v3, "verticalCheck":Z
    :goto_1e
    iget v6, v1, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    sub-float/2addr v6, v7

    cmpl-float v6, p1, v6

    if-ltz v6, :cond_7e

    iget v6, v1, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    add-float/2addr v6, v7

    cmpg-float v6, p1, v6

    if-gez v6, :cond_7e

    move v0, v4

    .line 168
    .local v0, "horizCheck":Z
    :goto_2f
    iget v5, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v7

    if-gez v5, :cond_3f

    if-eqz v3, :cond_3f

    .line 169
    or-int/lit8 v2, v2, 0x2

    .line 171
    :cond_3f
    iget v5, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v7

    if-gez v5, :cond_4f

    if-eqz v3, :cond_4f

    .line 172
    or-int/lit8 v2, v2, 0x4

    .line 174
    :cond_4f
    iget v5, v1, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v7

    if-gez v5, :cond_5f

    if-eqz v0, :cond_5f

    .line 175
    or-int/lit8 v2, v2, 0x8

    .line 177
    :cond_5f
    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v7

    if-gez v5, :cond_6f

    if-eqz v0, :cond_6f

    .line 178
    or-int/lit8 v2, v2, 0x10

    .line 180
    :cond_6f
    if-ne v2, v4, :cond_7b

    float-to-int v4, p1

    float-to-int v5, p2

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 181
    const/16 v2, 0x20

    .line 183
    :cond_7b
    return v2

    .end local v0    # "horizCheck":Z
    .end local v3    # "verticalCheck":Z
    :cond_7c
    move v3, v5

    .line 166
    goto :goto_1e

    .restart local v3    # "verticalCheck":Z
    :cond_7e
    move v0, v5

    .line 167
    goto :goto_2f
.end method

.method public getInvalidateRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 539
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotion:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 715
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method protected getScale()F
    .registers 3

    .prologue
    .line 543
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 544
    .local v0, "values":[F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 545
    const/4 v1, 0x0

    aget v1, v0, v1

    return v1
.end method

.method growWithConstantAspectSize(IDD)V
    .registers 32
    .param p1, "edge"    # I
    .param p2, "dx"    # D
    .param p4, "dy"    # D

    .prologue
    .line 402
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isLeftEdge(I)Z

    move-result v8

    .line 403
    .local v8, "left":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isRightEdge(I)Z

    move-result v9

    .line 404
    .local v9, "right":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isTopEdge(I)Z

    move-result v15

    .line 405
    .local v15, "top":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isBottomEdge(I)Z

    move-result v6

    .line 406
    .local v6, "bottom":Z
    if-nez v8, :cond_14

    if-eqz v9, :cond_db

    :cond_14
    const/4 v7, 0x1

    .line 407
    .local v7, "horizontal":Z
    :goto_15
    if-nez v15, :cond_19

    if-eqz v6, :cond_de

    :cond_19
    const/16 v16, 0x1

    .line 408
    .local v16, "vertical":Z
    :goto_1b
    if-eqz v7, :cond_1f

    if-nez v16, :cond_e2

    :cond_1f
    const/4 v14, 0x1

    .line 411
    .local v14, "singleSide":Z
    :goto_20
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMinSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getScale()F

    move-result v17

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v22, v0

    div-double v18, v20, v22

    .line 414
    .local v18, "widthCap":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 416
    if-eqz v14, :cond_17c

    .line 417
    if-eqz v7, :cond_113

    .line 419
    move-wide/from16 v10, p2

    .line 420
    .local v10, "ndx":D
    const-wide/16 v20, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v0, v10, v11, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->calculateDy(DD)D

    move-result-wide v12

    .line 422
    .local v12, "ndy":D
    if-eqz v8, :cond_e5

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 424
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    const-wide/16 v20, 0x0

    const-wide/high16 v22, 0x4000000000000000L

    div-double v22, v12, v22

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    move-wide/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    .line 463
    :cond_84
    :goto_84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v20

    cmpl-double v17, v20, v18

    if-ltz v17, :cond_c9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v20

    cmpl-double v17, v20, v18

    if-ltz v17, :cond_c9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->contains(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)Z

    move-result v17

    if-eqz v17, :cond_c9

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 467
    :cond_c9
    const/16 v17, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 468
    return-void

    .line 406
    .end local v7    # "horizontal":Z
    .end local v10    # "ndx":D
    .end local v12    # "ndy":D
    .end local v14    # "singleSide":Z
    .end local v16    # "vertical":Z
    .end local v18    # "widthCap":D
    :cond_db
    const/4 v7, 0x0

    goto/16 :goto_15

    .line 407
    .restart local v7    # "horizontal":Z
    :cond_de
    const/16 v16, 0x0

    goto/16 :goto_1b

    .line 408
    .restart local v16    # "vertical":Z
    :cond_e2
    const/4 v14, 0x0

    goto/16 :goto_20

    .line 426
    .restart local v10    # "ndx":D
    .restart local v12    # "ndy":D
    .restart local v14    # "singleSide":Z
    .restart local v18    # "widthCap":D
    :cond_e5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    const-wide/16 v20, 0x0

    neg-double v0, v12

    move-wide/from16 v22, v0

    const-wide/high16 v24, 0x4000000000000000L

    div-double v22, v22, v24

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    move-wide/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto/16 :goto_84

    .line 432
    .end local v10    # "ndx":D
    .end local v12    # "ndy":D
    :cond_113
    move-wide/from16 v12, p4

    .line 433
    .restart local v12    # "ndy":D
    const-wide/16 v20, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, v20

    invoke-virtual {v0, v12, v13, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->calculateDx(DD)D

    move-result-wide v10

    .line 434
    .restart local v10    # "ndx":D
    if-eqz v15, :cond_14c

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-wide/from16 v20, v0

    add-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 436
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    const-wide/high16 v20, 0x4000000000000000L

    div-double v20, v10, v20

    const-wide/16 v22, 0x0

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    move-wide/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto/16 :goto_84

    .line 437
    :cond_14c
    if-eqz v6, :cond_84

    .line 438
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    move-wide/from16 v20, v0

    add-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    neg-double v0, v10

    move-wide/from16 v20, v0

    const-wide/high16 v22, 0x4000000000000000L

    div-double v20, v20, v22

    const-wide/16 v22, 0x0

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    move-wide/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto/16 :goto_84

    .line 445
    .end local v10    # "ndx":D
    .end local v12    # "ndy":D
    :cond_17c
    move-wide/from16 v10, p2

    .line 446
    .restart local v10    # "ndx":D
    const-wide/16 v20, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    move-wide/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->calculateDy(DD)D

    move-result-wide v12

    .line 448
    .restart local v12    # "ndy":D
    if-eqz v8, :cond_1b8

    if-eqz v15, :cond_1b8

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-wide/from16 v20, v0

    add-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    goto/16 :goto_84

    .line 451
    :cond_1b8
    if-eqz v8, :cond_1e6

    if-eqz v6, :cond_1e6

    .line 452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    move-wide/from16 v20, v0

    sub-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    goto/16 :goto_84

    .line 454
    :cond_1e6
    if-eqz v9, :cond_214

    if-eqz v15, :cond_214

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 456
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    move-wide/from16 v20, v0

    sub-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    goto/16 :goto_84

    .line 457
    :cond_214
    if-eqz v9, :cond_84

    if-eqz v6, :cond_84

    .line 458
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    move-wide/from16 v20, v0

    add-double v20, v20, v10

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    move-wide/from16 v20, v0

    add-double v20, v20, v12

    move-wide/from16 v0, v20

    move-object/from16 v2, v17

    iput-wide v0, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    goto/16 :goto_84
.end method

.method growWithoutConstantAspectSize(IDD)V
    .registers 24
    .param p1, "edge"    # I
    .param p2, "dx"    # D
    .param p4, "dy"    # D

    .prologue
    .line 473
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isLeftEdge(I)Z

    move-result v4

    .line 474
    .local v4, "left":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isRightEdge(I)Z

    move-result v5

    .line 475
    .local v5, "right":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isTopEdge(I)Z

    move-result v6

    .line 476
    .local v6, "top":Z
    invoke-virtual/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->isBottomEdge(I)Z

    move-result v2

    .line 477
    .local v2, "bottom":Z
    if-nez v4, :cond_14

    if-eqz v5, :cond_a7

    :cond_14
    const/4 v3, 0x1

    .line 478
    .local v3, "horizontal":Z
    :goto_15
    if-nez v6, :cond_19

    if-eqz v2, :cond_aa

    :cond_19
    const/4 v7, 0x1

    .line 481
    .local v7, "vertical":Z
    :goto_1a
    move-object/from16 v0, p0

    iget v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMinSize:I

    int-to-double v10, v10

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getScale()F

    move-result v12

    float-to-double v12, v12

    div-double v8, v10, v12

    .line 483
    .local v8, "widthCap":D
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 485
    if-eqz v3, :cond_4e

    .line 487
    if-eqz v4, :cond_ad

    .line 488
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    add-double v12, v12, p2

    iput-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    .line 489
    if-nez v7, :cond_4e

    .line 490
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    const-wide/16 v12, 0x0

    const-wide/high16 v14, 0x4000000000000000L

    div-double v14, p4, v14

    invoke-virtual {v10, v12, v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    .line 500
    :cond_4e
    :goto_4e
    if-eqz v7, :cond_6b

    .line 502
    if-eqz v6, :cond_ca

    .line 503
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    add-double v12, v12, p4

    iput-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    .line 504
    if-nez v3, :cond_6b

    .line 505
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    const-wide/high16 v12, 0x4000000000000000L

    div-double v12, p2, v12

    const-wide/16 v14, 0x0

    invoke-virtual {v10, v12, v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    .line 515
    :cond_6b
    :goto_6b
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v10

    cmpl-double v10, v10, v8

    if-ltz v10, :cond_9c

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v10

    cmpl-double v10, v10, v8

    if-ltz v10, :cond_9c

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->contains(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)Z

    move-result v10

    if-eqz v10, :cond_9c

    .line 516
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->set(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 519
    :cond_9c
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 520
    return-void

    .line 477
    .end local v3    # "horizontal":Z
    .end local v7    # "vertical":Z
    .end local v8    # "widthCap":D
    :cond_a7
    const/4 v3, 0x0

    goto/16 :goto_15

    .line 478
    .restart local v3    # "horizontal":Z
    :cond_aa
    const/4 v7, 0x0

    goto/16 :goto_1a

    .line 493
    .restart local v7    # "vertical":Z
    .restart local v8    # "widthCap":D
    :cond_ad
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    add-double v12, v12, p2

    iput-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    .line 494
    if-nez v7, :cond_4e

    .line 495
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    const-wide/16 v12, 0x0

    move-wide/from16 v0, p4

    neg-double v14, v0

    const-wide/high16 v16, 0x4000000000000000L

    div-double v14, v14, v16

    invoke-virtual {v10, v12, v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto :goto_4e

    .line 508
    :cond_ca
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    add-double v12, v12, p4

    iput-wide v12, v10, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    .line 509
    if-nez v3, :cond_6b

    .line 510
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotionD:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-wide/from16 v0, p2

    neg-double v12, v0

    const-wide/high16 v14, 0x4000000000000000L

    div-double/2addr v12, v14

    const-wide/16 v14, 0x0

    invoke-virtual {v10, v12, v13, v14, v15}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->inset(DD)V

    goto :goto_6b
.end method

.method handleMotion(IFF)V
    .registers 16
    .param p1, "edge"    # I
    .param p2, "dx"    # F
    .param p3, "dy"    # F

    .prologue
    .line 344
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    if-eqz v0, :cond_5

    .line 367
    :goto_4
    return-void

    .line 347
    :cond_5
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 348
    const/16 v0, 0x20

    if-ne p1, v0, :cond_33

    .line 349
    float-to-double v0, p2

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v6

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-double v8, v8

    div-double/2addr v6, v8

    mul-double/2addr v0, v6

    float-to-double v6, p3

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v8

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->height()I

    move-result v10

    int-to-double v10, v10

    div-double/2addr v8, v10

    mul-double/2addr v6, v8

    invoke-virtual {p0, v0, v1, v6, v7}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->moveBy(DD)V

    goto :goto_4

    .line 351
    :cond_33
    and-int/lit8 v0, p1, 0x6

    if-nez v0, :cond_38

    .line 352
    const/4 p2, 0x0

    .line 354
    :cond_38
    and-int/lit8 v0, p1, 0x18

    if-nez v0, :cond_3d

    .line 355
    const/4 p3, 0x0

    .line 359
    :cond_3d
    float-to-double v0, p2

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v6

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-double v8, v8

    div-double/2addr v6, v8

    mul-double/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-double v2, v0

    .line 360
    .local v2, "xDelta":D
    float-to-double v0, p3

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v6

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRect4:Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-double v8, v8

    div-double/2addr v6, v8

    mul-double/2addr v0, v6

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-double v4, v0

    .line 361
    .local v4, "yDelta":D
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v0, :cond_71

    move-object v0, p0

    move v1, p1

    .line 362
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->growWithConstantAspectSize(IDD)V

    goto :goto_4

    :cond_71
    move-object v0, p0

    move v1, p1

    .line 364
    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->growWithoutConstantAspectSize(IDD)V

    goto :goto_4
.end method

.method public invalidate()V
    .registers 3

    .prologue
    .line 668
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    if-nez v0, :cond_a

    .line 669
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 671
    :cond_a
    return-void
.end method

.method isBottomEdge(I)Z
    .registers 4
    .param p1, "edge"    # I

    .prologue
    .line 340
    and-int/lit8 v0, p1, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isLeftEdge(I)Z
    .registers 4
    .param p1, "edge"    # I

    .prologue
    .line 328
    and-int/lit8 v0, p1, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method isRightEdge(I)Z
    .registers 4
    .param p1, "edge"    # I

    .prologue
    .line 332
    and-int/lit8 v0, p1, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 549
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mRunning:Z

    return v0
.end method

.method isTopEdge(I)Z
    .registers 4
    .param p1, "edge"    # I

    .prologue
    .line 336
    and-int/lit8 v0, p1, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method moveBy(DD)V
    .registers 8
    .param p1, "dx"    # D
    .param p3, "dy"    # D

    .prologue
    .line 523
    double-to-float v0, p1

    double-to-float v1, p3

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->moveBy(FF)V

    .line 524
    return-void
.end method

.method moveBy(FF)V
    .registers 13
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    const-wide/16 v8, 0x0

    .line 527
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotion:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 528
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    float-to-double v2, p1

    float-to-double v4, p2

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 529
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->left:D

    sub-double/2addr v2, v4

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->top:D

    sub-double/2addr v4, v6

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 530
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->right:D

    sub-double/2addr v2, v4

    invoke-static {v8, v9, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v4, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-wide v6, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->bottom:D

    sub-double/2addr v4, v6

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->offset(DD)V

    .line 532
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 534
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotion:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 535
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->tmpRectMotion:Landroid/graphics/Rect;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dWidth:I

    neg-int v1, v1

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->dHeight:I

    neg-int v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->inset(II)V

    .line 536
    return-void
.end method

.method public onSizeChanged(Lcom/adobe/creativesdk/aviary/widget/CropImageView;IIII)V
    .registers 7
    .param p1, "cropImageView"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "oldw"    # I
    .param p5, "oldh"    # I

    .prologue
    .line 732
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 733
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentWidth:I

    .line 734
    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mParentHeight:I

    .line 735
    return-void
.end method

.method public setMinSize(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 113
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMinSize:I

    .line 114
    return-void
.end method

.method public setMode(Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;I)V
    .registers 7
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;
    .param p2, "edge"    # I

    .prologue
    const/16 v3, 0x8

    .line 630
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMode:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    if-eq p1, v0, :cond_5e

    .line 631
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMode:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    .line 632
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMode:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->None:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    if-ne v0, v2, :cond_5f

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColor:I

    :goto_12
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 633
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMode:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->None:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    if-ne v0, v2, :cond_62

    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColor:I

    :goto_1f
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 635
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 636
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 637
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 638
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 640
    const/16 v0, 0x20

    if-ne p2, v0, :cond_65

    .line 641
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 642
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 643
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 644
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 665
    :cond_5e
    :goto_5e
    return-void

    .line 632
    :cond_5f
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeColorPressed:I

    goto :goto_12

    .line 633
    :cond_62
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColorPressed:I

    goto :goto_1f

    .line 646
    :cond_65
    and-int/lit8 v0, p2, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7e

    .line 647
    and-int/lit8 v0, p2, 0x8

    if-ne v0, v3, :cond_76

    .line 649
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_5e

    .line 652
    :cond_76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_5e

    .line 655
    :cond_7e
    and-int/lit8 v0, p2, 0x8

    if-ne v0, v3, :cond_8a

    .line 657
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_5e

    .line 660
    :cond_8a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_5e
.end method

.method public setup(Landroid/graphics/Matrix;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;Z)V
    .registers 11
    .param p1, "m"    # Landroid/graphics/Matrix;
    .param p2, "imageRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p3, "cropRect"    # Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    .param p4, "maintainAspectRatio"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 675
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    .line 676
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 677
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-direct {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mImageRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    .line 678
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mMaintainAspectRatio:Z

    .line 680
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->width()D

    move-result-wide v0

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mCropRect:Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;->height()D

    move-result-wide v2

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mInitialAspectRatio:D

    .line 682
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-direct {p0, v5, v0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->computeLayout(ZLandroid/graphics/Rect;)V

    .line 684
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mStrokeWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 685
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 686
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 687
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setHinting(I)V

    .line 689
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutsideFillColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 690
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 691
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 692
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setDither(Z)V

    .line 693
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setHinting(I)V

    .line 695
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->None:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    invoke-virtual {p0, v0, v5}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMode(Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;I)V

    .line 696
    return-void
.end method
