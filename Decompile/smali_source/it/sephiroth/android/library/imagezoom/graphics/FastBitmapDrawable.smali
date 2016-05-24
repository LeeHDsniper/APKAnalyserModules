.class public Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FastBitmapDrawable.java"

# interfaces
.implements Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;


# instance fields
.field protected mBitmap:Landroid/graphics/Bitmap;

.field protected mIntrinsicHeight:I

.field protected mIntrinsicWidth:I

.field protected mPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "b"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 27
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 28
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2d

    .line 29
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicWidth:I

    .line 30
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicHeight:I

    .line 35
    :goto_1b
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    .line 36
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 37
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 38
    return-void

    .line 32
    :cond_2d
    iput v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicWidth:I

    .line 33
    iput v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicHeight:I

    goto :goto_1b
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    .line 50
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 51
    invoke-virtual {p0}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 52
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_20

    .line 53
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 58
    .end local v0    # "bounds":Landroid/graphics/Rect;
    :cond_1f
    :goto_1f
    return-void

    .line 55
    .restart local v0    # "bounds":Landroid/graphics/Rect;
    :cond_20
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_1f
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 82
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicWidth:I

    return v0
.end method

.method public getMinimumHeight()I
    .registers 2

    .prologue
    .line 92
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicHeight:I

    return v0
.end method

.method public getMinimumWidth()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mIntrinsicWidth:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 62
    const/4 v0, -0x3

    return v0
.end method

.method public getPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 67
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 68
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 41
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    .line 42
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 72
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 73
    return-void
.end method
