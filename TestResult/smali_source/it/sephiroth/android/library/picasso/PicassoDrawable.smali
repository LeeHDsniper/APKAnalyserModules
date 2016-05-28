.class final Lit/sephiroth/android/library/picasso/PicassoDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "PicassoDrawable.java"


# static fields
.field private static final DEBUG_PAINT:Landroid/graphics/Paint;


# instance fields
.field alpha:I

.field animating:Z

.field private final debugging:Z

.field private final density:F

.field fadeTime:J

.field private final loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field placeholder:Landroid/graphics/drawable/Drawable;

.field startTimeMillis:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->DEBUG_PAINT:Landroid/graphics/Paint;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;JZ)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "placeholder"    # Landroid/graphics/drawable/Drawable;
    .param p4, "loadedFrom"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .param p5, "fadeTime"    # J
    .param p7, "debugging"    # Z

    .prologue
    const/4 v1, 0x1

    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 75
    const/16 v2, 0xff

    iput v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->alpha:I

    .line 82
    iput-boolean p7, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->debugging:Z

    .line 83
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    iput v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->density:F

    .line 85
    iput-object p4, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 86
    iput-wide p5, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->fadeTime:J

    .line 88
    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    if-eq p4, v2, :cond_36

    const-wide/16 v2, 0x0

    cmp-long v2, p5, v2

    if-lez v2, :cond_36

    move v0, v1

    .line 89
    .local v0, "fade":Z
    :goto_29
    if-eqz v0, :cond_35

    .line 90
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 91
    iput-boolean v1, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->animating:Z

    .line 92
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->startTimeMillis:J

    .line 94
    :cond_35
    return-void

    .line 88
    .end local v0    # "fade":Z
    :cond_36
    const/4 v0, 0x0

    goto :goto_29
.end method

.method private drawDebugIndicator(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v4, 0x0

    .line 148
    sget-object v1, Lit/sephiroth/android/library/picasso/PicassoDrawable;->DEBUG_PAINT:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 149
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, v4, v4}, Landroid/graphics/Point;-><init>(II)V

    const/high16 v2, 0x41800000

    iget v3, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->density:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->getTrianglePath(Landroid/graphics/Point;I)Landroid/graphics/Path;

    move-result-object v0

    .line 150
    .local v0, "path":Landroid/graphics/Path;
    sget-object v1, Lit/sephiroth/android/library/picasso/PicassoDrawable;->DEBUG_PAINT:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 152
    sget-object v1, Lit/sephiroth/android/library/picasso/PicassoDrawable;->DEBUG_PAINT:Landroid/graphics/Paint;

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    iget v2, v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->debugColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 153
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1, v4, v4}, Landroid/graphics/Point;-><init>(II)V

    const/high16 v2, 0x41700000

    iget v3, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->density:F

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-static {v1, v2}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->getTrianglePath(Landroid/graphics/Point;I)Landroid/graphics/Path;

    move-result-object v0

    .line 154
    sget-object v1, Lit/sephiroth/android/library/picasso/PicassoDrawable;->DEBUG_PAINT:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 155
    return-void
.end method

.method private static getTrianglePath(Landroid/graphics/Point;I)Landroid/graphics/Path;
    .registers 7
    .param p0, "p1"    # Landroid/graphics/Point;
    .param p1, "width"    # I

    .prologue
    .line 158
    new-instance v0, Landroid/graphics/Point;

    iget v3, p0, Landroid/graphics/Point;->x:I

    add-int/2addr v3, p1

    iget v4, p0, Landroid/graphics/Point;->y:I

    invoke-direct {v0, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    .line 159
    .local v0, "p2":Landroid/graphics/Point;
    new-instance v1, Landroid/graphics/Point;

    iget v3, p0, Landroid/graphics/Point;->x:I

    iget v4, p0, Landroid/graphics/Point;->y:I

    add-int/2addr v4, p1

    invoke-direct {v1, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    .line 161
    .local v1, "p3":Landroid/graphics/Point;
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 162
    .local v2, "path":Landroid/graphics/Path;
    iget v3, p0, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iget v4, p0, Landroid/graphics/Point;->y:I

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 163
    iget v3, v0, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iget v4, v0, Landroid/graphics/Point;->y:I

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 164
    iget v3, v1, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iget v4, v1, Landroid/graphics/Point;->y:I

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 166
    return-object v2
.end method

.method static setBitmap(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;JZ)V
    .registers 17
    .param p0, "target"    # Landroid/widget/ImageView;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "loadedFrom"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .param p4, "fadeTime"    # J
    .param p6, "debugging"    # Z

    .prologue
    .line 47
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 48
    .local v4, "placeholder":Landroid/graphics/drawable/Drawable;
    instance-of v0, v4, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v0, :cond_e

    move-object v0, v4

    .line 49
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 51
    :cond_e
    new-instance v1, Lit/sephiroth/android/library/picasso/PicassoDrawable;

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-wide v6, p4

    move/from16 v8, p6

    invoke-direct/range {v1 .. v8}, Lit/sephiroth/android/library/picasso/PicassoDrawable;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;JZ)V

    .line 53
    .local v1, "drawable":Lit/sephiroth/android/library/picasso/PicassoDrawable;
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    return-void
.end method

.method static setPlaceholder(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p0, "target"    # Landroid/widget/ImageView;
    .param p1, "placeholderDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 61
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v0, :cond_14

    .line 63
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 65
    :cond_14
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 97
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->animating:Z

    if-nez v2, :cond_f

    .line 98
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 120
    :cond_7
    :goto_7
    iget-boolean v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->debugging:Z

    if-eqz v2, :cond_e

    .line 121
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->drawDebugIndicator(Landroid/graphics/Canvas;)V

    .line 123
    :cond_e
    return-void

    .line 100
    :cond_f
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->startTimeMillis:J

    sub-long/2addr v2, v4

    long-to-float v2, v2

    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->fadeTime:J

    long-to-float v3, v4

    div-float v0, v2, v3

    .line 101
    .local v0, "normalized":F
    const/high16 v2, 0x3f800000

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_2c

    .line 102
    const/4 v2, 0x0

    iput-boolean v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->animating:Z

    .line 103
    const/4 v2, 0x0

    iput-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    .line 104
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_7

    .line 106
    :cond_2c
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_35

    .line 107
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 110
    :cond_35
    iget v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->alpha:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v1, v2

    .line 111
    .local v1, "partialAlpha":I
    invoke-super {p0, v1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 112
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 113
    iget v2, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->alpha:I

    invoke-super {p0, v2}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 114
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xa

    if-gt v2, v3, :cond_7

    .line 115
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->invalidateSelf()V

    goto :goto_7
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 141
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 142
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 144
    :cond_9
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 145
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 126
    iput p1, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->alpha:I

    .line 127
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_b

    .line 128
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 130
    :cond_b
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->setAlpha(I)V

    .line 131
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 134
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_9

    .line 135
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/PicassoDrawable;->placeholder:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 137
    :cond_9
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 138
    return-void
.end method
