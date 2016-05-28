.class public Landroid/support/v7/widget/AppCompatRatingBar;
.super Landroid/widget/RatingBar;
.source "AppCompatRatingBar.java"


# static fields
.field private static final TINT_ATTRS:[I


# instance fields
.field private mSampleTile:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v7/widget/AppCompatRatingBar;->TINT_ATTRS:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x101013b
        0x101013c
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 60
    sget v0, Landroid/support/v7/appcompat/R$attr;->ratingBarStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v4, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 66
    sget-boolean v2, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v2, :cond_30

    .line 67
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatRatingBar;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/support/v7/widget/AppCompatRatingBar;->TINT_ATTRS:[I

    invoke-static {v2, p2, v3, p3, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 70
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawableIfKnown(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 71
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_1f

    .line 72
    invoke-direct {p0, v1}, Landroid/support/v7/widget/AppCompatRatingBar;->tileifyIndeterminate(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AppCompatRatingBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    :cond_1f
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawableIfKnown(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 76
    if-eqz v1, :cond_2d

    .line 77
    invoke-direct {p0, v1, v4}, Landroid/support/v7/widget/AppCompatRatingBar;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AppCompatRatingBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 80
    :cond_2d
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 82
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_30
    return-void
.end method

.method private getDrawableShape()Landroid/graphics/drawable/shapes/Shape;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 154
    const/16 v1, 0x8

    new-array v0, v1, [F

    fill-array-data v0, :array_e

    .line 155
    .local v0, "roundedCorners":[F
    new-instance v1, Landroid/graphics/drawable/shapes/RoundRectShape;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    return-object v1

    .line 154
    :array_e
    .array-data 4
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
        0x40a00000
    .end array-data
.end method

.method private tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;
    .registers 16
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "clip"    # Z

    .prologue
    const/4 v11, 0x1

    .line 89
    instance-of v10, p1, Landroid/support/v4/graphics/drawable/DrawableWrapper;

    if-eqz v10, :cond_1a

    move-object v10, p1

    .line 90
    check-cast v10, Landroid/support/v4/graphics/drawable/DrawableWrapper;

    invoke-interface {v10}, Landroid/support/v4/graphics/drawable/DrawableWrapper;->getWrappedDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 91
    .local v5, "inner":Landroid/graphics/drawable/Drawable;
    if-eqz v5, :cond_18

    .line 92
    invoke-direct {p0, v5, p2}, Landroid/support/v7/widget/AppCompatRatingBar;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    move-object v10, p1

    .line 93
    check-cast v10, Landroid/support/v4/graphics/drawable/DrawableWrapper;

    invoke-interface {v10, v5}, Landroid/support/v4/graphics/drawable/DrawableWrapper;->setWrappedDrawable(Landroid/graphics/drawable/Drawable;)V

    .end local v5    # "inner":Landroid/graphics/drawable/Drawable;
    :cond_18
    move-object v6, p1

    .line 127
    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_19
    :goto_19
    return-object v6

    .line 95
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1a
    instance-of v10, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v10, :cond_5a

    move-object v1, p1

    .line 96
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 97
    .local v1, "background":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    .line 98
    .local v0, "N":I
    new-array v7, v0, [Landroid/graphics/drawable/Drawable;

    .line 100
    .local v7, "outDrawables":[Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_28
    if-ge v3, v0, :cond_48

    .line 101
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v4

    .line 102
    .local v4, "id":I
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    const v10, 0x102000d

    if-eq v4, v10, :cond_3c

    const v10, 0x102000f

    if-ne v4, v10, :cond_46

    :cond_3c
    move v10, v11

    :goto_3d
    invoke-direct {p0, v12, v10}, Landroid/support/v7/widget/AppCompatRatingBar;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    aput-object v10, v7, v3

    .line 100
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 102
    :cond_46
    const/4 v10, 0x0

    goto :goto_3d

    .line 105
    .end local v4    # "id":I
    :cond_48
    new-instance v6, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v6, v7}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 107
    .local v6, "newBg":Landroid/graphics/drawable/LayerDrawable;
    const/4 v3, 0x0

    :goto_4e
    if-ge v3, v0, :cond_19

    .line 108
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v10

    invoke-virtual {v6, v3, v10}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    .line 107
    add-int/lit8 v3, v3, 0x1

    goto :goto_4e

    .line 113
    .end local v0    # "N":I
    .end local v1    # "background":Landroid/graphics/drawable/LayerDrawable;
    .end local v3    # "i":I
    .end local v6    # "newBg":Landroid/graphics/drawable/LayerDrawable;
    .end local v7    # "outDrawables":[Landroid/graphics/drawable/Drawable;
    :cond_5a
    instance-of v10, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v10, :cond_18

    .line 114
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v9

    .line 115
    .local v9, "tileBitmap":Landroid/graphics/Bitmap;
    iget-object v10, p0, Landroid/support/v7/widget/AppCompatRatingBar;->mSampleTile:Landroid/graphics/Bitmap;

    if-nez v10, :cond_6a

    .line 116
    iput-object v9, p0, Landroid/support/v7/widget/AppCompatRatingBar;->mSampleTile:Landroid/graphics/Bitmap;

    .line 119
    :cond_6a
    new-instance v8, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatRatingBar;->getDrawableShape()Landroid/graphics/drawable/shapes/Shape;

    move-result-object v10

    invoke-direct {v8, v10}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 120
    .local v8, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v10, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v12, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v9, v10, v12}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 122
    .local v2, "bitmapShader":Landroid/graphics/BitmapShader;
    invoke-virtual {v8}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v10

    invoke-virtual {v10, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 123
    if-eqz p2, :cond_8c

    new-instance v10, Landroid/graphics/drawable/ClipDrawable;

    const/4 v12, 0x3

    invoke-direct {v10, v8, v12, v11}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    move-object v8, v10

    .end local v8    # "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    :cond_8c
    move-object v6, v8

    goto :goto_19
.end method

.method private tileifyIndeterminate(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/16 v7, 0x2710

    .line 136
    instance-of v5, p1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v5, :cond_36

    move-object v1, p1

    .line 137
    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 138
    .local v1, "background":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v0

    .line 139
    .local v0, "N":I
    new-instance v4, Landroid/graphics/drawable/AnimationDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 140
    .local v4, "newBg":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isOneShot()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    .line 142
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    if-ge v3, v0, :cond_32

    .line 143
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Landroid/support/v7/widget/AppCompatRatingBar;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 144
    .local v2, "frame":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2, v7}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 145
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v5

    invoke-virtual {v4, v2, v5}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 142
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 147
    .end local v2    # "frame":Landroid/graphics/drawable/Drawable;
    :cond_32
    invoke-virtual {v4, v7}, Landroid/graphics/drawable/AnimationDrawable;->setLevel(I)Z

    .line 148
    move-object p1, v4

    .line 150
    .end local v0    # "N":I
    .end local v1    # "background":Landroid/graphics/drawable/AnimationDrawable;
    .end local v3    # "i":I
    .end local v4    # "newBg":Landroid/graphics/drawable/AnimationDrawable;
    :cond_36
    return-object p1
.end method


# virtual methods
.method protected declared-synchronized onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 160
    monitor-enter p0

    :try_start_1
    invoke-super {p0, p1, p2}, Landroid/widget/RatingBar;->onMeasure(II)V

    .line 162
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatRatingBar;->mSampleTile:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_20

    .line 163
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatRatingBar;->mSampleTile:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatRatingBar;->getNumStars()I

    move-result v2

    mul-int v0, v1, v2

    .line 164
    .local v0, "width":I
    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/v4/view/ViewCompat;->resolveSizeAndState(III)I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatRatingBar;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/AppCompatRatingBar;->setMeasuredDimension(II)V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 167
    .end local v0    # "width":I
    :cond_20
    monitor-exit p0

    return-void

    .line 160
    :catchall_22
    move-exception v1

    monitor-exit p0

    throw v1
.end method
