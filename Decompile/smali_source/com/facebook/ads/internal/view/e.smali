.class public Lcom/facebook/ads/internal/view/e;
.super Landroid/widget/LinearLayout;


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:Landroid/graphics/Bitmap;

.field private c:Landroid/widget/ImageView;

.field private d:Landroid/widget/ImageView;

.field private e:Landroid/widget/ImageView;

.field private f:Landroid/graphics/Bitmap;

.field private g:I

.field private h:I


# direct methods
.method private a()V
    .registers 10

    const/4 v6, 0x1

    const/high16 v4, 0x40000000

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/e;->getHeight()I

    move-result v0

    if-lez v0, :cond_88

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/e;->c()I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/view/e;->h:I

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/e;->getHeight()I

    move-result v0

    iget v2, p0, Lcom/facebook/ads/internal/view/e;->h:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    div-float/2addr v0, v4

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v0, v2

    iput v0, p0, Lcom/facebook/ads/internal/view/e;->g:I

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v0, 0x3f800000

    const/high16 v2, -0x40800000

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/e;->getHeight()I

    move-result v0

    iget v2, p0, Lcom/facebook/ads/internal/view/e;->h:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    div-float/2addr v0, v4

    float-to-double v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v7, v2

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Lcom/facebook/ads/internal/view/e;->h:I

    int-to-float v2, v2

    div-float v8, v0, v2

    iget v0, p0, Lcom/facebook/ads/internal/view/e;->g:I

    int-to-float v0, v0

    mul-float/2addr v0, v8

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-lez v4, :cond_68

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/view/e;->f:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->c:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/facebook/ads/internal/view/e;->f:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_68
    int-to-float v0, v7

    mul-float/2addr v0, v8

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-lez v4, :cond_88

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sub-int/2addr v2, v4

    iget-object v3, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/ads/internal/view/e;->e:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_88
    return-void
.end method

.method private c()I
    .registers 5

    invoke-virtual {p0}, Lcom/facebook/ads/internal/view/e;->getWidth()I

    move-result v0

    int-to-double v0, v0

    const-wide v2, 0x3ffe8f5c28f5c28fL

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .registers 5

    if-nez p1, :cond_9

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->d:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_8
    return-void

    :cond_9
    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->d:Landroid/widget/ImageView;

    invoke-static {p1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/facebook/ads/internal/view/e;->a:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-direct {p0}, Lcom/facebook/ads/internal/view/e;->a()V

    goto :goto_8
.end method

.method protected onLayout(ZIIII)V
    .registers 10

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->a:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->b:Landroid/graphics/Bitmap;

    if-nez v0, :cond_c

    :cond_8
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    :goto_b
    return-void

    :cond_c
    invoke-direct {p0}, Lcom/facebook/ads/internal/view/e;->c()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/ads/internal/view/e;->f:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_18

    iget v1, p0, Lcom/facebook/ads/internal/view/e;->h:I

    if-eq v1, v0, :cond_1b

    :cond_18
    invoke-direct {p0}, Lcom/facebook/ads/internal/view/e;->a()V

    :cond_1b
    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->c:Landroid/widget/ImageView;

    iget v1, p0, Lcom/facebook/ads/internal/view/e;->g:I

    invoke-virtual {v0, p2, p3, p4, v1}, Landroid/widget/ImageView;->layout(IIII)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->d:Landroid/widget/ImageView;

    iget v1, p0, Lcom/facebook/ads/internal/view/e;->g:I

    add-int/2addr v1, p3

    iget v2, p0, Lcom/facebook/ads/internal/view/e;->g:I

    iget v3, p0, Lcom/facebook/ads/internal/view/e;->h:I

    add-int/2addr v2, v3

    invoke-virtual {v0, p2, v1, p4, v2}, Landroid/widget/ImageView;->layout(IIII)V

    iget-object v0, p0, Lcom/facebook/ads/internal/view/e;->e:Landroid/widget/ImageView;

    iget v1, p0, Lcom/facebook/ads/internal/view/e;->g:I

    add-int/2addr v1, p3

    iget v2, p0, Lcom/facebook/ads/internal/view/e;->h:I

    add-int/2addr v1, v2

    invoke-virtual {v0, p2, v1, p4, p5}, Landroid/widget/ImageView;->layout(IIII)V

    goto :goto_b
.end method
