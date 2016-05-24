.class public Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
.super Ljava/lang/Object;
.source "DrawableHighlightView.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;,
        Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;,
        Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;,
        Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;
    }
.end annotation


# static fields
.field static final STATE_SET_NONE:[I

.field static final STATE_SET_SELECTED:[I

.field static final STATE_SET_SELECTED_FOCUSED:[I

.field static final STATE_SET_SELECTED_PRESSED:[I


# instance fields
.field private final fpoints:[F

.field private mAlignVerticalMode:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

.field private mAnchorDelete:Landroid/graphics/drawable/Drawable;

.field private mAnchorDeleteHeight:I

.field private mAnchorDeleteWidth:I

.field private mAnchorFlip:Landroid/graphics/drawable/Drawable;

.field private mAnchorFlipHeight:I

.field private mAnchorFlipWidth:I

.field private mAnchorOpacity:Landroid/graphics/drawable/Drawable;

.field private mAnchorOpacityHeight:I

.field private mAnchorOpacityWidth:I

.field private mAnchorRotate:Landroid/graphics/drawable/Drawable;

.field private mAnchorRotateHeight:I

.field private mAnchorRotateWidth:I

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mConfirmedOpacity:I

.field private mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

.field private mContentFlipListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

.field private mCropRect:Landroid/graphics/RectF;

.field private mDeleteClickListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

.field private mDrawRect:Landroid/graphics/RectF;

.field private mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

.field private mHidden:Z

.field mInvalidateRect:Landroid/graphics/Rect;

.field mInvalidateRectF:Landroid/graphics/RectF;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMode:I

.field private mMoveEnabled:Z

.field private mOpacity:I

.field private mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

.field private mPadding:I

.field private mRatio:F

.field private mResizeEdgeMode:I

.field private mRotateEnabled:Z

.field private mRotateMatrix:Landroid/graphics/Matrix;

.field private mRotation:F

.field private mScaleEnabled:Z

.field private mShowAnchors:Z

.field private mState:I

.field private final mTempRect:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-array v0, v2, [I

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .line 41
    new-array v0, v3, [I

    const v1, 0x10100a1

    aput v1, v0, v2

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_22

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    .line 43
    new-array v0, v3, [I

    const v1, 0x101009c

    aput v1, v0, v2

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_FOCUSED:[I

    return-void

    .line 42
    nop

    :array_22
    .array-data 4
        0x10100a1
        0x10100a7
    .end array-data
.end method

.method public constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;ILcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;)V
    .registers 11
    .param p1, "context"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
    .param p2, "styleId"    # I
    .param p3, "content"    # Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    .prologue
    const/16 v3, 0xff

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput v4, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    .line 50
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    .line 51
    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_142

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    .line 52
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    .line 53
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRect:Landroid/graphics/Rect;

    .line 81
    iput v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    .line 82
    const/high16 v2, 0x3f800000

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    .line 83
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    .line 84
    iput v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    .line 85
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mShowAnchors:Z

    .line 86
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Center:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAlignVerticalMode:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    .line 88
    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacity:I

    .line 89
    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mConfirmedOpacity:I

    .line 92
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    .line 93
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 95
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 97
    instance-of v2, p3, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v2, :cond_134

    .line 98
    check-cast p3, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .end local p3    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 99
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-interface {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setOnSizeChangeListener(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;)V

    .line 104
    :goto_56
    const/high16 v1, -0x40800000

    .line 106
    .local v1, "minSize":F
    if-lez p2, :cond_139

    .line 107
    invoke-virtual {p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView:[I

    invoke-virtual {v2, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 109
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_rotateDrawable:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    .line 110
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_deleteDrawable:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    .line 111
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_opacityDrawable:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    .line 112
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getHorizontalFlipEnabled()Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 113
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_flipDrawable:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    .line 115
    :cond_8c
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_android_background:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 116
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_android_padding:I

    const/16 v3, 0xa

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    .line 117
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_resizeEdgeMode:I

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mResizeEdgeMode:I

    .line 118
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_moveEnabled:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMoveEnabled:Z

    .line 119
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_rotateEnabled:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateEnabled:Z

    .line 120
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_resizeEnabled:I

    invoke-virtual {v0, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    .line 122
    sget v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImageDrawableHighlightView_adobe_minSize:I

    const/high16 v3, 0x41a00000

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    .line 123
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    .end local v0    # "array":Landroid/content/res/TypedArray;
    :goto_c9
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_e1

    .line 129
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateWidth:I

    .line 130
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateHeight:I

    .line 133
    :cond_e1
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_f9

    .line 134
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteWidth:I

    .line 135
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteHeight:I

    .line 138
    :cond_f9
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_111

    .line 139
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityWidth:I

    .line 140
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityHeight:I

    .line 143
    :cond_111
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_129

    .line 144
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipWidth:I

    .line 145
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipHeight:I

    .line 148
    :cond_129
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->updateRatio()V

    .line 150
    cmpl-float v2, v1, v5

    if-lez v2, :cond_133

    .line 151
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMinSize(F)V

    .line 153
    :cond_133
    return-void

    .line 101
    .end local v1    # "minSize":F
    .restart local p3    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    :cond_134
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    goto/16 :goto_56

    .line 125
    .end local p3    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    .restart local v1    # "minSize":F
    :cond_139
    const-string v2, "drawable-view"

    const-string v3, "styleId not set"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c9

    .line 51
    nop

    :array_142
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    return-object v0
.end method

.method private updateRatio()V
    .registers 4

    .prologue
    .line 156
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentWidth()F

    move-result v1

    .line 157
    .local v1, "w":F
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentHeight()F

    move-result v0

    .line 158
    .local v0, "h":F
    div-float v2, v1, v0

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    .line 159
    return-void
.end method


# virtual methods
.method public animateContent()V
    .registers 5

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    .line 187
    .local v1, "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    if-eqz v1, :cond_1a

    .line 188
    const-string v2, "alpha"

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_1c

    invoke-static {v1, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 189
    .local v0, "animator":Lcom/nineoldandroids/animation/ObjectAnimator;
    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 190
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 192
    .end local v0    # "animator":Lcom/nineoldandroids/animation/ObjectAnimator;
    :cond_1a
    return-void

    .line 188
    nop

    :array_1c
    .array-data 4
        0x0
        0xff
    .end array-data
.end method

.method protected computeLayout()Landroid/graphics/RectF;
    .registers 3

    .prologue
    .line 777
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public copyBounds(Landroid/graphics/RectF;)V
    .registers 4
    .param p1, "outRect"    # Landroid/graphics/RectF;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 292
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v0, v0

    int-to-float v0, v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 293
    return-void
.end method

.method public dispose()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 174
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDeleteClickListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

    .line 175
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    .line 176
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContentFlipListener:Ljava/lang/ref/WeakReference;

    .line 177
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 178
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    .line 179
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 180
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 216
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mHidden:Z

    if-eqz v7, :cond_5

    .line 288
    :goto_4
    return-void

    .line 220
    :cond_5
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->copyBounds(Landroid/graphics/RectF;)V

    .line 222
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v5

    .line 223
    .local v5, "saveCount":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 225
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_35

    .line 226
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    float-to-int v8, v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-int v9, v9

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    float-to-int v10, v10

    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    float-to-int v11, v11

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 227
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 230
    :cond_35
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isSelected()Z

    move-result v2

    .line 231
    .local v2, "isSelected":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isFocused()Z

    move-result v1

    .line 233
    .local v1, "isFocused":Z
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v7, :cond_ec

    .line 234
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    invoke-interface {v7, v8, v9, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setBounds(FFFF)V

    .line 239
    :goto_56
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v7, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 241
    if-nez v2, :cond_5f

    if-eqz v1, :cond_e7

    .line 243
    :cond_5f
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mShowAnchors:Z

    if-eqz v7, :cond_e7

    .line 244
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    float-to-int v3, v7

    .line 245
    .local v3, "left":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    float-to-int v4, v7

    .line 246
    .local v4, "right":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    float-to-int v6, v7

    .line 247
    .local v6, "top":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mTempRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    float-to-int v0, v7

    .line 249
    .local v0, "bottom":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_93

    .line 250
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateWidth:I

    sub-int v8, v4, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateHeight:I

    sub-int v9, v0, v9

    iget v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateWidth:I

    add-int/2addr v10, v4

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateHeight:I

    add-int/2addr v11, v0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 255
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 258
    :cond_93
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_af

    .line 259
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteWidth:I

    sub-int v8, v3, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteHeight:I

    sub-int v9, v6, v9

    iget v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteWidth:I

    add-int/2addr v10, v3

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteHeight:I

    add-int/2addr v11, v6

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 264
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 267
    :cond_af
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_cb

    .line 268
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityWidth:I

    sub-int v8, v4, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityHeight:I

    sub-int v9, v6, v9

    iget v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityWidth:I

    add-int/2addr v10, v4

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacityHeight:I

    add-int/2addr v11, v6

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 273
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 276
    :cond_cb
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_e7

    .line 277
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipWidth:I

    sub-int v8, v3, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipHeight:I

    sub-int v9, v0, v9

    iget v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipWidth:I

    add-int/2addr v10, v3

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlipHeight:I

    add-int/2addr v11, v0

    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 282
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 287
    .end local v0    # "bottom":I
    .end local v3    # "left":I
    .end local v4    # "right":I
    .end local v6    # "top":I
    :cond_e7
    invoke-virtual {p1, v5}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_4

    .line 236
    :cond_ec
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->left:F

    float-to-int v8, v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v9, v9, Landroid/graphics/RectF;->top:F

    float-to-int v9, v9

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->right:F

    float-to-int v10, v10

    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    float-to-int v11, v11

    invoke-interface {v7, v8, v9, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setBounds(IIII)V

    goto/16 :goto_56
.end method

.method public flipHorizontal()V
    .registers 11

    .prologue
    const/high16 v5, 0x3f800000

    const/high16 v4, -0x40800000

    .line 597
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    if-eqz v3, :cond_55

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getHorizontalFlipEnabled()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 598
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getHorizontalFlip()Z

    move-result v1

    .line 599
    .local v1, "flipped":Z
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    const-string v7, "scaleX"

    const/4 v3, 0x2

    new-array v8, v3, [F

    const/4 v9, 0x0

    if-eqz v1, :cond_56

    move v3, v4

    :goto_21
    aput v3, v8, v9

    const/4 v3, 0x1

    if-eqz v1, :cond_58

    :goto_26
    aput v5, v8, v3

    invoke-static {v6, v7, v8}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 600
    .local v0, "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    const-wide/16 v4, 0x96

    invoke-virtual {v0, v4, v5}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 601
    new-instance v3, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v3}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 602
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 603
    new-instance v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;

    invoke-direct {v3, p0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Z)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 622
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContentFlipListener:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_55

    .line 623
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContentFlipListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;

    .line 624
    .local v2, "listener":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;
    if-eqz v2, :cond_55

    .line 625
    invoke-interface {v2, p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;->onContentFlip(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 629
    .end local v0    # "anim":Lcom/nineoldandroids/animation/ObjectAnimator;
    .end local v1    # "flipped":Z
    .end local v2    # "listener":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;
    :cond_55
    return-void

    .restart local v1    # "flipped":Z
    :cond_56
    move v3, v5

    .line 599
    goto :goto_21

    :cond_58
    move v5, v4

    goto :goto_26
.end method

.method public forceUpdate()Z
    .registers 15

    .prologue
    .line 883
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v0

    .line 884
    .local v0, "cropRect":Landroid/graphics/RectF;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDrawRect()Landroid/graphics/RectF;

    move-result-object v1

    .line 886
    .local v1, "drawRect":Landroid/graphics/RectF;
    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v11, :cond_7e

    .line 888
    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentWidth()F

    move-result v8

    .line 889
    .local v8, "textWidth":F
    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getCurrentHeight()F

    move-result v6

    .line 891
    .local v6, "textHeight":F
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->updateRatio()V

    .line 893
    new-instance v7, Landroid/graphics/RectF;

    invoke-direct {v7, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 894
    .local v7, "textRect":Landroid/graphics/RectF;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    invoke-virtual {v11, v7}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 896
    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v11

    sub-float v2, v8, v11

    .line 897
    .local v2, "dx":F
    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v11

    sub-float v3, v6, v11

    .line 899
    .local v3, "dy":F
    const/4 v11, 0x2

    new-array v4, v11, [F

    const/4 v11, 0x0

    aput v2, v4, v11

    const/4 v11, 0x1

    aput v3, v4, v11

    .line 901
    .local v4, "fpoints":[F
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 902
    .local v5, "rotateMatrix":Landroid/graphics/Matrix;
    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    neg-float v11, v11

    invoke-virtual {v5, v11}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 904
    const/4 v11, 0x0

    aget v2, v4, v11

    .line 905
    const/4 v11, 0x1

    aget v3, v4, v11

    .line 907
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v11

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float/2addr v11, v12

    mul-float v9, v2, v11

    .line 908
    .local v9, "xDelta":F
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v11

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v12

    div-float/2addr v11, v12

    mul-float v10, v3, v11

    .line 910
    .local v10, "yDelta":F
    const/4 v11, 0x0

    cmpl-float v11, v9, v11

    if-nez v11, :cond_6d

    const/4 v11, 0x0

    cmpl-float v11, v10, v11

    if-eqz v11, :cond_79

    .line 911
    :cond_6d
    const/high16 v11, 0x40000000

    div-float v11, v9, v11

    const/high16 v12, 0x40000000

    div-float v12, v10, v12

    const/4 v13, 0x0

    invoke-virtual {p0, v11, v12, v13}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->growBy(FFZ)V

    .line 914
    :cond_79
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    .line 915
    const/4 v11, 0x1

    .line 917
    .end local v2    # "dx":F
    .end local v3    # "dy":F
    .end local v4    # "fpoints":[F
    .end local v5    # "rotateMatrix":Landroid/graphics/Matrix;
    .end local v6    # "textHeight":F
    .end local v7    # "textRect":Landroid/graphics/RectF;
    .end local v8    # "textWidth":F
    .end local v9    # "xDelta":F
    .end local v10    # "yDelta":F
    :goto_7d
    return v11

    :cond_7e
    const/4 v11, 0x0

    goto :goto_7d
.end method

.method public getConfirmedOpacity()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mConfirmedOpacity:I

    return v0
.end method

.method public getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    return-object v0
.end method

.method public getCropRectF()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 434
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getCropRotationMatrix()Landroid/graphics/Matrix;
    .registers 4

    .prologue
    .line 438
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 439
    .local v0, "m":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 440
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 441
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 442
    return-object v0
.end method

.method public getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .registers 4
    .param p1, "m"    # Landroid/graphics/Matrix;
    .param p2, "supportRect"    # Landroid/graphics/RectF;

    .prologue
    .line 781
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 782
    .local v0, "r":Landroid/graphics/RectF;
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 783
    return-object v0
.end method

.method public getDrawRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 452
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getFlipHorizontal()Z
    .registers 2

    .prologue
    .line 396
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->getHorizontalFlip()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getHit(FF)I
    .registers 15
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v11, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    const/high16 v10, 0x42200000

    .line 457
    new-instance v2, Landroid/graphics/RectF;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-direct {v2, v8}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 458
    .local v2, "rect":Landroid/graphics/RectF;
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v8, v8

    int-to-float v8, v8

    iget v9, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v9, v9

    int-to-float v9, v9

    invoke-virtual {v2, v8, v9}, Landroid/graphics/RectF;->inset(FF)V

    .line 460
    new-array v1, v11, [F

    aput p1, v1, v7

    aput p2, v1, v6

    .line 462
    .local v1, "pts":[F
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 463
    .local v4, "rotateMatrix":Landroid/graphics/Matrix;
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    neg-float v8, v8

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    neg-float v9, v9

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 464
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    neg-float v8, v8

    invoke-virtual {v4, v8}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 465
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 466
    invoke-virtual {v4, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 468
    aget p1, v1, v7

    .line 469
    aget p2, v1, v6

    .line 471
    const/4 v3, 0x1

    .line 472
    .local v3, "retval":I
    iget v8, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v8, v10

    cmpl-float v8, p2, v8

    if-ltz v8, :cond_168

    iget v8, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v8, v10

    cmpg-float v8, p2, v8

    if-gez v8, :cond_168

    move v5, v6

    .line 473
    .local v5, "verticalCheck":Z
    :goto_57
    iget v8, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v8, v10

    cmpl-float v8, p1, v8

    if-ltz v8, :cond_16b

    iget v8, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v8, v10

    cmpg-float v8, p1, v8

    if-gez v8, :cond_16b

    move v0, v6

    .line 477
    .local v0, "horizCheck":Z
    :goto_66
    if-eqz v5, :cond_6c

    if-eqz v0, :cond_6c

    .line 478
    const/16 v3, 0x40

    .line 481
    :cond_6c
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    if-eqz v7, :cond_d1

    .line 482
    iget v7, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, p1

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_87

    if-eqz v5, :cond_87

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mResizeEdgeMode:I

    .line 484
    invoke-static {v7, v11}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v7

    if-eqz v7, :cond_87

    .line 485
    or-int/lit8 v3, v3, 0x2

    .line 488
    :cond_87
    iget v7, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v7, p1

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_9f

    if-eqz v5, :cond_9f

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mResizeEdgeMode:I

    const/4 v8, 0x4

    .line 490
    invoke-static {v7, v8}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v7

    if-eqz v7, :cond_9f

    .line 491
    or-int/lit8 v3, v3, 0x4

    .line 494
    :cond_9f
    iget v7, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, p2

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_b8

    if-eqz v0, :cond_b8

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mResizeEdgeMode:I

    const/16 v8, 0x8

    .line 496
    invoke-static {v7, v8}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v7

    if-eqz v7, :cond_b8

    .line 497
    or-int/lit8 v3, v3, 0x8

    .line 500
    :cond_b8
    iget v7, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, p2

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_d1

    if-eqz v0, :cond_d1

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mResizeEdgeMode:I

    const/16 v8, 0x10

    .line 502
    invoke-static {v7, v8}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v7

    if-eqz v7, :cond_d1

    .line 503
    or-int/lit8 v3, v3, 0x10

    .line 507
    :cond_d1
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateEnabled:Z

    if-nez v7, :cond_d9

    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    if-eqz v7, :cond_f5

    :cond_d9
    iget v7, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v7, p1

    .line 508
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_f5

    iget v7, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, p2

    .line 509
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpg-float v7, v7, v10

    if-gez v7, :cond_f5

    if-eqz v5, :cond_f5

    if-eqz v0, :cond_f5

    .line 511
    const/16 v3, 0x20

    .line 514
    :cond_f5
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMoveEnabled:Z

    if-eqz v7, :cond_107

    if-ne v3, v6, :cond_107

    float-to-int v6, p1

    int-to-float v6, v6

    float-to-int v7, p2

    int-to-float v7, v7

    invoke-virtual {v2, v6, v7}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v6

    if-eqz v6, :cond_107

    .line 515
    const/16 v3, 0x40

    .line 518
    :cond_107
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_127

    .line 519
    iget v6, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v6, p1

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_127

    iget v6, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v6, p2

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_127

    if-eqz v5, :cond_127

    if-eqz v0, :cond_127

    .line 521
    const/16 v3, 0x80

    .line 525
    :cond_127
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_147

    .line 526
    iget v6, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v6, p1

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_147

    iget v6, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v6, p2

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_147

    if-eqz v5, :cond_147

    if-eqz v0, :cond_147

    .line 528
    const/16 v3, 0x100

    .line 532
    :cond_147
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_167

    .line 533
    iget v6, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v6, p1

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_167

    iget v6, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v6, p2

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v10

    if-gez v6, :cond_167

    if-eqz v5, :cond_167

    if-eqz v0, :cond_167

    .line 535
    const/16 v3, 0x200

    .line 539
    :cond_167
    return v3

    .end local v0    # "horizCheck":Z
    .end local v5    # "verticalCheck":Z
    :cond_168
    move v5, v7

    .line 472
    goto/16 :goto_57

    .restart local v5    # "verticalCheck":Z
    :cond_16b
    move v0, v7

    .line 473
    goto/16 :goto_66
.end method

.method public getInvalidationRect()Landroid/graphics/Rect;
    .registers 8

    .prologue
    .line 632
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 633
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v3, v3

    int-to-float v3, v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v4, v4

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 634
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 636
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    float-to-int v3, v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    float-to-int v4, v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRectF:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    float-to-int v6, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 642
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateWidth:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteWidth:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 643
    .local v1, "w":I
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotateHeight:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDeleteHeight:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 645
    .local v0, "h":I
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRect:Landroid/graphics/Rect;

    neg-int v3, v1

    mul-int/lit8 v3, v3, 0x2

    neg-int v4, v0

    mul-int/lit8 v4, v4, 0x2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->inset(II)V

    .line 646
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mInvalidateRect:Landroid/graphics/Rect;

    return-object v2
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 650
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 654
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 195
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacity:I

    return v0
.end method

.method public getRotation()F
    .registers 2

    .prologue
    .line 665
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    return v0
.end method

.method protected growBy(F)V
    .registers 4
    .param p1, "dx"    # F

    .prologue
    .line 673
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    div-float v0, p1, v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->growBy(FFZ)V

    .line 674
    return-void
.end method

.method protected growBy(FFZ)V
    .registers 10
    .param p1, "dx"    # F
    .param p2, "dy"    # F
    .param p3, "checkMinSize"    # Z

    .prologue
    const/high16 v5, 0x40000000

    const/4 v4, 0x0

    .line 677
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    if-nez v2, :cond_8

    .line 701
    :cond_7
    :goto_7
    return-void

    .line 681
    :cond_8
    new-instance v0, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-direct {v0, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 683
    .local v0, "r":Landroid/graphics/RectF;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAlignVerticalMode:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Center:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    if-ne v2, v3, :cond_33

    .line 684
    neg-float v2, p1

    neg-float v3, p2

    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 693
    :goto_1a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v2, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getDisplayRect(Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/RectF;

    move-result-object v1

    .line 695
    .local v1, "testRect":Landroid/graphics/RectF;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    invoke-interface {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->validateSize(Landroid/graphics/RectF;)Z

    move-result v2

    if-nez v2, :cond_2a

    if-nez p3, :cond_7

    .line 699
    :cond_2a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 700
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto :goto_7

    .line 685
    .end local v1    # "testRect":Landroid/graphics/RectF;
    :cond_33
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAlignVerticalMode:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Top:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    if-ne v2, v3, :cond_45

    .line 686
    neg-float v2, p1

    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 687
    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    mul-float v3, p2, v5

    add-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    goto :goto_1a

    .line 689
    :cond_45
    neg-float v2, p1

    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 690
    iget v2, v0, Landroid/graphics/RectF;->top:F

    mul-float v3, p2, v5

    sub-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->top:F

    goto :goto_1a
.end method

.method public invalidate()V
    .registers 4

    .prologue
    .line 769
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->computeLayout()Landroid/graphics/RectF;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    .line 770
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 771
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 772
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 773
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 774
    return-void
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 401
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 402
    return-void
.end method

.method public isFocused()Z
    .registers 3

    .prologue
    .line 372
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isSelected()Z
    .registers 3

    .prologue
    .line 296
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method moveBy(FF)V
    .registers 4
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .prologue
    .line 762
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMoveEnabled:Z

    if-eqz v0, :cond_c

    .line 763
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->offset(FF)V

    .line 764
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    .line 766
    :cond_c
    return-void
.end method

.method public onMouseMove(ILandroid/view/MotionEvent;FF)V
    .registers 15
    .param p1, "edge"    # I
    .param p2, "event2"    # Landroid/view/MotionEvent;
    .param p3, "dx"    # F
    .param p4, "dy"    # F

    .prologue
    const/high16 v9, -0x40800000

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 704
    if-ne p1, v7, :cond_7

    .line 759
    :goto_6
    return-void

    .line 708
    :cond_7
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aput p3, v6, v8

    .line 709
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aput p4, v6, v7

    .line 714
    const/16 v6, 0x40

    if-ne p1, v6, :cond_33

    .line 715
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float/2addr v6, v7

    mul-float/2addr v6, p3

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->height()F

    move-result v8

    div-float/2addr v7, v8

    mul-float/2addr v7, p4

    invoke-virtual {p0, v6, v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->moveBy(FF)V

    goto :goto_6

    .line 716
    :cond_33
    const/16 v6, 0x20

    if-ne p1, v6, :cond_4e

    .line 717
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aget p3, v6, v8

    .line 718
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aget p4, v6, v7

    .line 719
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-virtual {p0, v6, v7, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->rotateBy(FFFF)V

    .line 720
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto :goto_6

    .line 723
    :cond_4e
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 724
    .local v3, "rotateMatrix":Landroid/graphics/Matrix;
    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    neg-float v6, v6

    invoke-virtual {v3, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 725
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    invoke-virtual {v3, v6}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 726
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aget p3, v6, v8

    .line 727
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->fpoints:[F

    aget p4, v6, v7

    .line 729
    and-int/lit8 v6, p1, 0x6

    if-nez v6, :cond_6b

    .line 730
    const/4 p3, 0x0

    .line 732
    :cond_6b
    and-int/lit8 v6, p1, 0x18

    if-nez v6, :cond_70

    .line 733
    const/4 p4, 0x0

    .line 736
    :cond_70
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float/2addr v6, v7

    mul-float v4, p3, v6

    .line 737
    .local v4, "xDelta":F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float/2addr v6, v7

    mul-float v5, p4, v6

    .line 739
    .local v5, "yDelta":F
    const/4 v6, 0x2

    invoke-static {p1, v6}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v1

    .line 740
    .local v1, "isLeft":Z
    const/16 v6, 0x8

    invoke-static {p1, v6}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v2

    .line 744
    .local v2, "isTop":Z
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v6, v6, v7

    if-ltz v6, :cond_b1

    .line 745
    move v0, v4

    .line 746
    .local v0, "delta":F
    if-eqz v1, :cond_a9

    .line 747
    mul-float/2addr v0, v9

    .line 756
    :cond_a9
    :goto_a9
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->growBy(F)V

    .line 757
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    goto/16 :goto_6

    .line 750
    .end local v0    # "delta":F
    :cond_b1
    move v0, v5

    .line 751
    .restart local v0    # "delta":F
    if-eqz v2, :cond_a9

    .line 752
    mul-float/2addr v0, v9

    goto :goto_a9
.end method

.method public onSingleTapConfirmed(FF)V
    .registers 13
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/high16 v9, 0x42200000

    .line 544
    new-instance v2, Landroid/graphics/RectF;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    invoke-direct {v2, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 545
    .local v2, "rect":Landroid/graphics/RectF;
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v7, v7

    int-to-float v7, v7

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mPadding:I

    neg-int v8, v8

    int-to-float v8, v8

    invoke-virtual {v2, v7, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 547
    const/4 v7, 0x2

    new-array v1, v7, [F

    aput p1, v1, v6

    aput p2, v1, v5

    .line 549
    .local v1, "pts":[F
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 550
    .local v3, "rotateMatrix":Landroid/graphics/Matrix;
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v7

    neg-float v7, v7

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    neg-float v8, v8

    invoke-virtual {v3, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 551
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    neg-float v7, v7

    invoke-virtual {v3, v7}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 552
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    invoke-virtual {v3, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 553
    invoke-virtual {v3, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 555
    aget p1, v1, v6

    .line 556
    aget p2, v1, v5

    .line 558
    iget v7, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v9

    cmpl-float v7, p2, v7

    if-ltz v7, :cond_8d

    iget v7, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v7, v9

    cmpg-float v7, p2, v7

    if-gez v7, :cond_8d

    move v4, v5

    .line 559
    .local v4, "verticalCheck":Z
    :goto_56
    iget v7, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, v9

    cmpl-float v7, p1, v7

    if-ltz v7, :cond_8f

    iget v7, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v7, v9

    cmpg-float v7, p1, v7

    if-gez v7, :cond_8f

    move v0, v5

    .line 561
    .local v0, "horizCheck":Z
    :goto_65
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_91

    .line 562
    iget v5, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_91

    iget v5, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_91

    if-eqz v4, :cond_91

    if-eqz v0, :cond_91

    .line 564
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDeleteClickListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

    if-eqz v5, :cond_91

    .line 565
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDeleteClickListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

    invoke-interface {v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;->onDeleteClick()V

    .line 594
    :cond_8c
    :goto_8c
    return-void

    .end local v0    # "horizCheck":Z
    .end local v4    # "verticalCheck":Z
    :cond_8d
    move v4, v6

    .line 558
    goto :goto_56

    .restart local v4    # "verticalCheck":Z
    :cond_8f
    move v0, v6

    .line 559
    goto :goto_65

    .line 571
    .restart local v0    # "horizCheck":Z
    :cond_91
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_af

    .line 572
    iget v5, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_af

    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_af

    if-eqz v4, :cond_af

    if-nez v0, :cond_8c

    .line 578
    :cond_af
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_d7

    .line 579
    iget v5, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_d7

    iget v5, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_d7

    if-eqz v4, :cond_d7

    if-eqz v0, :cond_d7

    .line 581
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    if-eqz v5, :cond_d7

    .line 582
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    invoke-interface {v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;->onChangeOpacity()V

    goto :goto_8c

    .line 588
    :cond_d7
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_8c

    .line 589
    iget v5, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_8c

    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, p2

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v5, v9

    if-gez v5, :cond_8c

    if-eqz v4, :cond_8c

    if-eqz v0, :cond_8c

    .line 591
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->flipHorizontal()V

    goto :goto_8c
.end method

.method public onSizeChanged(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;FFFF)V
    .registers 8
    .param p1, "content"    # Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .param p2, "left"    # F
    .param p3, "top"    # F
    .param p4, "right"    # F
    .param p5, "bottom"    # F

    .prologue
    .line 927
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    if-eqz v0, :cond_3b

    .line 945
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpl-float v0, v0, p2

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, v0, p3

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, p4

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, p5

    if-eqz v0, :cond_3b

    .line 946
    :cond_2c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 947
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 953
    :cond_3b
    :goto_3b
    return-void

    .line 949
    :cond_3c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContext:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    goto :goto_3b
.end method

.method rotateBy(FFFF)V
    .registers 27
    .param p1, "dx"    # F
    .param p2, "dy"    # F
    .param p3, "diffx"    # F
    .param p4, "diffy"    # F

    .prologue
    .line 788
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateEnabled:Z

    move/from16 v19, v0

    if-nez v19, :cond_11

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    move/from16 v19, v0

    if-nez v19, :cond_11

    .line 824
    :cond_10
    :goto_10
    return-void

    .line 792
    :cond_11
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v12, v0, [F

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->centerX()F

    move-result v20

    aput v20, v12, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->centerY()F

    move-result v20

    aput v20, v12, v19

    .line 793
    .local v12, "pt1":[F
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v13, v0, [F

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v20, v0

    aput v20, v13, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v20, v0

    aput v20, v13, v19

    .line 794
    .local v13, "pt2":[F
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v14, v0, [F

    const/16 v19, 0x0

    aput p1, v14, v19

    const/16 v19, 0x1

    aput p2, v14, v19

    .line 796
    .local v14, "pt3":[F
    invoke-static {v13, v12}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints([F[F)D

    move-result-wide v2

    .line 797
    .local v2, "angle1":D
    invoke-static {v14, v12}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angleBetweenPoints([F[F)D

    move-result-wide v4

    .line 799
    .local v4, "angle2":D
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateEnabled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_89

    .line 800
    sub-double v20, v4, v2

    move-wide/from16 v0, v20

    double-to-float v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    neg-float v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    .line 803
    :cond_89
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mScaleEnabled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_10

    .line 805
    new-instance v16, Landroid/graphics/Matrix;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/Matrix;-><init>()V

    .line 806
    .local v16, "rotateMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    move/from16 v19, v0

    move/from16 v0, v19

    neg-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 808
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v7, v0, [F

    const/16 v19, 0x0

    aput p3, v7, v19

    const/16 v19, 0x1

    aput p4, v7, v19

    .line 809
    .local v7, "points":[F
    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 811
    const/16 v19, 0x0

    aget p3, v7, v19

    .line 812
    const/16 v19, 0x1

    aget p4, v7, v19

    .line 814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/RectF;->width()F

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->width()F

    move-result v20

    div-float v19, v19, v20

    mul-float v17, p3, v19

    .line 815
    .local v17, "xDelta":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/RectF;->height()F

    move-result v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/RectF;->height()F

    move-result v20

    div-float v19, v19, v20

    mul-float v18, p4, v19

    .line 817
    .local v18, "yDelta":F
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v15, v0, [F

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->right:F

    move/from16 v20, v0

    add-float v20, v20, v17

    aput v20, v15, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDrawRect:Landroid/graphics/RectF;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    move/from16 v20, v0

    add-float v20, v20, v18

    aput v20, v15, v19

    .line 818
    .local v15, "pt4":[F
    invoke-static {v12, v13}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance([F[F)D

    move-result-wide v8

    .line 819
    .local v8, "distance1":D
    invoke-static {v12, v15}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->distance([F[F)D

    move-result-wide v10

    .line 820
    .local v10, "distance2":D
    sub-double v20, v10, v8

    move-wide/from16 v0, v20

    double-to-float v6, v0

    .line 821
    .local v6, "distance":F
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->growBy(F)V

    goto/16 :goto_10
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "runnable"    # Ljava/lang/Runnable;
    .param p3, "l"    # J

    .prologue
    .line 407
    return-void
.end method

.method public setAlignModeV(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;)V
    .registers 2
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAlignVerticalMode:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    .line 171
    return-void
.end method

.method public setConfirmedOpacity(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 212
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mConfirmedOpacity:I

    .line 213
    return-void
.end method

.method public setFocused(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 376
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isFocused()Z

    move-result v0

    .line 377
    .local v0, "isFocused":Z
    if-eq v0, p1, :cond_1a

    .line 378
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    xor-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    .line 380
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v1, :cond_17

    .line 381
    if-eqz p1, :cond_1b

    .line 382
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->beginEdit()V

    .line 387
    :cond_17
    :goto_17
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->updateDrawableState()V

    .line 389
    :cond_1a
    return-void

    .line 384
    :cond_1b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mEditableContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->endEdit()V

    goto :goto_17
.end method

.method public setHidden(Z)V
    .registers 2
    .param p1, "hidden"    # Z

    .prologue
    .line 841
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mHidden:Z

    .line 842
    return-void
.end method

.method public setMinSize(F)V
    .registers 4
    .param p1, "size"    # F

    .prologue
    .line 162
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    const/high16 v1, 0x3f800000

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_12

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    div-float v1, p1, v1

    invoke-interface {v0, p1, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setMinSize(FF)V

    .line 167
    :goto_11
    return-void

    .line 165
    :cond_12
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRatio:F

    mul-float/2addr v1, p1

    invoke-interface {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setMinSize(FF)V

    goto :goto_11
.end method

.method public setMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 658
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    if-eq p1, v0, :cond_9

    .line 659
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    .line 660
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->updateDrawableState()V

    .line 662
    :cond_9
    return-void
.end method

.method public setOnChangeOpacityListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    .prologue
    .line 853
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    .line 854
    return-void
.end method

.method public setOnContentFlipListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnContentFlipListener;

    .prologue
    .line 857
    if-eqz p1, :cond_a

    .line 858
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContentFlipListener:Ljava/lang/ref/WeakReference;

    .line 862
    :goto_9
    return-void

    .line 860
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContentFlipListener:Ljava/lang/ref/WeakReference;

    goto :goto_9
.end method

.method public setOnDeleteClickListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

    .prologue
    .line 849
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mDeleteClickListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;

    .line 850
    return-void
.end method

.method public setOpacity(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 199
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setAlpha(I)V

    .line 200
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacity:I

    .line 201
    return-void
.end method

.method public setSelected(Z)V
    .registers 4
    .param p1, "selected"    # Z

    .prologue
    .line 300
    if-nez p1, :cond_b

    .line 301
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    if-eqz v1, :cond_b

    .line 302
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mOpacityChangeListener:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnOpacityChangeListener;->onLockOpacity()V

    .line 306
    :cond_b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isSelected()Z

    move-result v0

    .line 307
    .local v0, "isSelected":Z
    if-eq v0, p1, :cond_1a

    .line 308
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    xor-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mState:I

    .line 309
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->updateDrawableState()V

    .line 311
    :cond_1a
    return-void
.end method

.method public setup(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;Z)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "m"    # Landroid/graphics/Matrix;
    .param p3, "imageRect"    # Landroid/graphics/Rect;
    .param p4, "cropRect"    # Landroid/graphics/RectF;
    .param p5, "maintainAspectRatio"    # Z

    .prologue
    .line 866
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMatrix:Landroid/graphics/Matrix;

    .line 867
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotation:F

    .line 868
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mRotateMatrix:Landroid/graphics/Matrix;

    .line 869
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mCropRect:Landroid/graphics/RectF;

    .line 870
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setMode(I)V

    .line 871
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->invalidate()V

    .line 872
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 412
    return-void
.end method

.method protected updateDrawableState()V
    .registers 10

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isSelected()Z

    move-result v1

    .line 315
    .local v1, "isSelected":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isFocused()Z

    move-result v0

    .line 318
    .local v0, "isFocused":Z
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .line 319
    .local v3, "state2":[I
    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .line 320
    .local v4, "state3":[I
    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .line 321
    .local v5, "state4":[I
    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .line 323
    .local v6, "state5":[I
    if-eqz v1, :cond_77

    .line 324
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_4c

    .line 325
    if-eqz v0, :cond_49

    .line 326
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_FOCUSED:[I

    .line 354
    .local v2, "state":[I
    :cond_1b
    :goto_1b
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_24

    .line 355
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v2}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 357
    :cond_24
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_2d

    .line 358
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorRotate:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 360
    :cond_2d
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_36

    .line 361
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorDelete:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v4}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 363
    :cond_36
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_3f

    .line 364
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorOpacity:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v5}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 366
    :cond_3f
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_48

    .line 367
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mAnchorFlip:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v6}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 369
    :cond_48
    return-void

    .line 328
    .end local v2    # "state":[I
    :cond_49
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED:[I

    .restart local v2    # "state":[I
    goto :goto_1b

    .line 331
    .end local v2    # "state":[I
    :cond_4c
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    and-int/lit16 v7, v7, 0x80

    const/16 v8, 0x80

    if-ne v7, v8, :cond_56

    .line 332
    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    .line 335
    :cond_56
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    .line 337
    .restart local v2    # "state":[I
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    and-int/lit8 v7, v7, 0x20

    const/16 v8, 0x20

    if-ne v7, v8, :cond_62

    .line 338
    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    .line 341
    :cond_62
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    and-int/lit16 v7, v7, 0x100

    const/16 v8, 0x100

    if-ne v7, v8, :cond_6c

    .line 342
    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    .line 345
    :cond_6c
    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mMode:I

    and-int/lit16 v7, v7, 0x200

    const/16 v8, 0x200

    if-ne v7, v8, :cond_1b

    .line 346
    sget-object v6, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_SELECTED_PRESSED:[I

    goto :goto_1b

    .line 351
    .end local v2    # "state":[I
    :cond_77
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->STATE_SET_NONE:[I

    .restart local v2    # "state":[I
    goto :goto_1b
.end method
