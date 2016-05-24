.class public Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;
.super Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;
.source "FakeBitmapDrawable.java"


# instance fields
.field private mFakeHeight:I

.field private mFakeWidth:I

.field private mMatrix:Landroid/graphics/Matrix;

.field private mRealHeight:I

.field private mRealWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;II)V
    .registers 5
    .param p1, "b"    # Landroid/graphics/Bitmap;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 29
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeWidth:I

    .line 30
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeHeight:I

    .line 31
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealWidth:I

    .line 32
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealHeight:I

    .line 33
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->update()V

    .line 34
    return-void
.end method

.method private update()V
    .registers 8

    .prologue
    .line 47
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeWidth:I

    int-to-float v1, v4

    .line 48
    .local v1, "fakewidth":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeHeight:I

    int-to-float v0, v4

    .line 49
    .local v0, "fakeheight":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealWidth:I

    int-to-float v3, v4

    .line 50
    .local v3, "realwidth":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealHeight:I

    int-to-float v2, v4

    .line 52
    .local v2, "realheight":F
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mMatrix:Landroid/graphics/Matrix;

    .line 53
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mMatrix:Landroid/graphics/Matrix;

    div-float v5, v1, v3

    div-float v6, v0, v2

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 54
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 59
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 68
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeWidth:I

    return v0
.end method

.method public updateBitmap(Landroid/graphics/Bitmap;II)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 38
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeWidth:I

    .line 39
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mFakeHeight:I

    .line 40
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealWidth:I

    .line 41
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->mRealHeight:I

    .line 42
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->update()V

    .line 43
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->invalidateSelf()V

    .line 44
    return-void
.end method
