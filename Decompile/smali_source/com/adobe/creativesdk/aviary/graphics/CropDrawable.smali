.class public Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CropDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final canInvert:Z

.field private innerDrawable:Landroid/graphics/drawable/Drawable;

.field final mBounds:Landroid/graphics/Rect;

.field private mCurIndex:I

.field private mCurState:I

.field private final mDrawBounds:Landroid/graphics/RectF;

.field private mDrawBoundsDirty:Z

.field final mPaint:Landroid/graphics/Paint;

.field private mRatio:[I

.field private mRatioIsCustom:Z

.field mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

.field private final padding:I

.field private final strokeColor:I

.field private strokeColorSelected:I

.field private final strokeRadius:F

.field private final strokeSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    const-string v0, "CropDrawable"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x2

    .line 48
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 39
    const/4 v1, -0x1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurIndex:I

    .line 50
    const/4 v1, 0x0

    sget-object v2, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable:[I

    sget v3, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_CropItemDrawableStyle:I

    invoke-virtual {p1, v1, v2, v5, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 54
    .local v0, "array":Landroid/content/res/TypedArray;
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_adobe_strokeColor:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColor:I

    .line 55
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_adobe_strokeColorSelected:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColorSelected:I

    .line 56
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_adobe_strokeSize:I

    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeSize:I

    .line 57
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_android_padding:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->padding:I

    .line 58
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_adobe_radius:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeRadius:F

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_crop_invert_policy:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->canInvert:Z

    .line 61
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->canInvert:Z

    if-eqz v1, :cond_5a

    .line 62
    sget v1, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeImagePreviewCropDrawable_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    .line 63
    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColorSelected:I

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->updateInnerDrawableTint(I)V

    .line 66
    :cond_5a
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 68
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v6}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    .line 69
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 70
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 71
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 72
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    .line 73
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBounds:Landroid/graphics/RectF;

    .line 74
    iput-boolean v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBoundsDirty:Z

    .line 76
    new-instance v1, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    .line 77
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v4, [I

    fill-array-data v2, :array_ee

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 79
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v4, [I

    fill-array-data v2, :array_f6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 80
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v4, [I

    fill-array-data v2, :array_fe

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 81
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v7, [I

    fill-array-data v2, :array_106

    .line 85
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 81
    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 87
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v4, [I

    fill-array-data v2, :array_110

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 88
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    new-array v2, v7, [I

    fill-array-data v2, :array_118

    const/4 v3, 0x5

    .line 92
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 88
    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->addStateSet([ILjava/lang/Integer;)I

    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->getState()[I

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->onStateChange([I)Z

    .line 95
    return-void

    .line 77
    :array_ee
    .array-data 4
        0x10100a7
        -0x10100a1
    .end array-data

    .line 79
    :array_f6
    .array-data 4
        0x10100a1
        -0x10100a0
    .end array-data

    .line 80
    :array_fe
    .array-data 4
        0x10100a1
        0x10100a7
    .end array-data

    .line 81
    :array_106
    .array-data 4
        0x10100a1
        -0x10100a0
        0x10100a7
    .end array-data

    .line 87
    :array_110
    .array-data 4
        0x10100a1
        0x10100a0
    .end array-data

    .line 88
    :array_118
    .array-data 4
        0x10100a1
        0x10100a0
        0x10100a7
    .end array-data
.end method

.method private updateDrawableRect()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    const-wide v8, 0x3ff3333333333333L

    .line 146
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBoundsDirty:Z

    if-eqz v6, :cond_74

    .line 149
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatioIsCustom:Z

    if-nez v6, :cond_9c

    .line 150
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    aget v6, v6, v11

    int-to-double v6, v6

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    const/4 v9, 0x1

    aget v8, v8, v9

    int-to-double v8, v8

    div-double v2, v6, v8

    .line 152
    .local v2, "ratio":D
    const-wide/high16 v6, 0x3ff0000000000000L

    cmpl-double v6, v2, v6

    if-ltz v6, :cond_75

    .line 153
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v5

    .line 154
    .local v5, "width":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v6, v2

    double-to-int v0, v6

    .line 156
    .local v0, "height":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-le v0, v6, :cond_47

    .line 157
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    sub-int v6, v0, v6

    sub-int/2addr v5, v6

    .line 158
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 175
    .end local v2    # "ratio":D
    :cond_47
    :goto_47
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    sub-int/2addr v7, v5

    div-int/lit8 v7, v7, 0x2

    add-int v1, v6, v7

    .line 176
    .local v1, "left":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    sub-int/2addr v7, v0

    div-int/lit8 v7, v7, 0x2

    add-int v4, v6, v7

    .line 177
    .local v4, "top":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBounds:Landroid/graphics/RectF;

    int-to-float v7, v1

    int-to-float v8, v4

    add-int v9, v1, v5

    int-to-float v9, v9

    add-int v10, v4, v0

    int-to-float v10, v10

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 178
    iput-boolean v11, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBoundsDirty:Z

    .line 180
    .end local v0    # "height":I
    .end local v1    # "left":I
    .end local v4    # "top":I
    .end local v5    # "width":I
    :cond_74
    return-void

    .line 162
    .restart local v2    # "ratio":D
    :cond_75
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v0

    .line 163
    .restart local v0    # "height":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-double v6, v6

    mul-double/2addr v6, v2

    double-to-int v5, v6

    .line 165
    .restart local v5    # "width":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    if-le v5, v6, :cond_47

    .line 166
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    sub-int v6, v0, v6

    sub-int/2addr v0, v6

    .line 167
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v5

    goto :goto_47

    .line 171
    .end local v0    # "height":I
    .end local v2    # "ratio":D
    .end local v5    # "width":I
    :cond_9c
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v6, v8

    double-to-int v5, v6

    .line 172
    .restart local v5    # "width":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v6, v8

    double-to-int v0, v6

    .restart local v0    # "height":I
    goto :goto_47
.end method

.method private updateInnerDrawableTint(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setFilterBitmap(Z)V

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setDrawableTint(Landroid/graphics/drawable/Drawable;I)Z

    .line 108
    :cond_f
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    if-nez v0, :cond_5

    .line 143
    :goto_4
    return-void

    .line 125
    :cond_5
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_14

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_14

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4a

    .line 126
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColorSelected:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 128
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_34

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    if-eq v0, v1, :cond_34

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatioIsCustom:Z

    if-nez v0, :cond_34

    .line 129
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 136
    :cond_34
    :goto_34
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->updateDrawableRect()V

    .line 138
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeRadius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_52

    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBounds:Landroid/graphics/RectF;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeRadius:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeRadius:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_4

    .line 133
    :cond_4a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_34

    .line 141
    :cond_52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBounds:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_4
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 194
    const/4 v0, -0x3

    return v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 199
    const/4 v0, 0x1

    return v0
.end method

.method public jumpToCurrentState()V
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 115
    :cond_9
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 116
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 11
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 204
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 205
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 206
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->padding:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->padding:I

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Rect;->inset(II)V

    .line 208
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_4c

    .line 209
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    .line 210
    .local v3, "w":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 211
    .local v0, "h":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    sub-int/2addr v4, v3

    div-int/lit8 v1, v4, 0x2

    .line 212
    .local v1, "left":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    sub-int/2addr v4, v0

    div-int/lit8 v2, v4, 0x2

    .line 213
    .local v2, "top":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v1

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/2addr v6, v2

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v1

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mBounds:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v8, v2

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 216
    .end local v0    # "h":I
    .end local v1    # "left":I
    .end local v2    # "top":I
    .end local v3    # "w":I
    :cond_4c
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBoundsDirty:Z

    .line 217
    return-void
.end method

.method protected onStateChange([I)Z
    .registers 5
    .param p1, "stateSet"    # [I

    .prologue
    .line 221
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_9

    .line 222
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->innerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 225
    :cond_9
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->indexOfStateSet([I)I

    move-result v0

    .line 226
    .local v0, "idx":I
    if-gez v0, :cond_19

    .line 227
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    sget-object v2, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->indexOfStateSet([I)I

    move-result v0

    .line 230
    :cond_19
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->selectDrawable(I)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 231
    const/4 v1, 0x1

    .line 233
    :goto_20
    return v1

    :cond_21
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result v1

    goto :goto_20
.end method

.method public selectDrawable(I)Z
    .registers 8
    .param p1, "idx"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 263
    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurIndex:I

    if-ne p1, v2, :cond_8

    .line 277
    :goto_7
    return v0

    .line 267
    :cond_8
    if-ltz p1, :cond_40

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mNumChildren:I

    if-ge p1, v2, :cond_40

    .line 268
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mStateListState:Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable$StateListState;->mDrawables:[Ljava/lang/Integer;

    aget-object v2, v2, p1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    .line 269
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurIndex:I

    .line 275
    :goto_1e
    sget-object v2, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "%s. mCurIndex: %d, mCurState: %d"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p0, v4, v0

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurIndex:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x2

    iget v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 276
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->invalidateSelf()V

    move v0, v1

    .line 277
    goto :goto_7

    .line 271
    :cond_40
    iput v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurState:I

    .line 272
    iput v3, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mCurIndex:I

    goto :goto_1e
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 185
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 190
    return-void
.end method

.method public setRatio([I)V
    .registers 10
    .param p1, "ratio"    # [I

    .prologue
    const/high16 v7, 0x40000000

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    if-eq v0, p1, :cond_56

    .line 238
    aget v0, p1, v1

    if-eqz v0, :cond_11

    aget v0, p1, v1

    const/4 v3, -0x1

    if-ne v0, v3, :cond_57

    :cond_11
    move v0, v2

    :goto_12
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatioIsCustom:Z

    .line 239
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    .line 240
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mDrawBoundsDirty:Z

    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mRatio:[I

    aget v0, v0, v1

    if-nez v0, :cond_59

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/DashPathEffect;

    const/4 v4, 0x2

    new-array v4, v4, [F

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v5

    const/high16 v6, 0x40800000

    div-float/2addr v5, v6

    aput v5, v4, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    mul-float/2addr v1, v7

    aput v1, v4, v2

    const/4 v1, 0x0

    invoke-direct {v3, v4, v1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 247
    :goto_40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v7}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 250
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->invalidateSelf()V

    .line 252
    :cond_56
    return-void

    :cond_57
    move v0, v1

    .line 238
    goto :goto_12

    .line 245
    :cond_59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_40
.end method

.method public setSelectedTint(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColorSelected:I

    .line 99
    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->strokeColorSelected:I

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->updateInnerDrawableTint(I)V

    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->invalidateSelf()V

    .line 101
    return-void
.end method
