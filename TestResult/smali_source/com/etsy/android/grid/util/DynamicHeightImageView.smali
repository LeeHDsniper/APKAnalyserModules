.class public Lcom/etsy/android/grid/util/DynamicHeightImageView;
.super Landroid/widget/ImageView;
.source "DynamicHeightImageView.java"


# static fields
.field public static radius:F


# instance fields
.field clipPath:Landroid/graphics/Path;

.field private mHeightRatio:D

.field rect:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const/high16 v0, 0x40000000

    sput v0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->radius:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 34
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 21
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->clipPath:Landroid/graphics/Path;

    .line 22
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    .line 35
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_27

    .line 36
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 38
    :cond_27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->clipPath:Landroid/graphics/Path;

    .line 22
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_27

    .line 28
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 30
    :cond_27
    return-void
.end method


# virtual methods
.method public getHeightRatio()D
    .registers 3

    .prologue
    .line 48
    iget-wide v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->mHeightRatio:D

    return-wide v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 66
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 67
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 68
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 69
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 70
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->clipPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->rect:Landroid/graphics/RectF;

    sget v2, Lcom/etsy/android/grid/util/DynamicHeightImageView;->radius:F

    sget v3, Lcom/etsy/android/grid/util/DynamicHeightImageView;->radius:F

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 71
    iget-object v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->clipPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 72
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 73
    return-void
.end method

.method protected onMeasure(II)V
    .registers 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 53
    iget-wide v2, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->mHeightRatio:D

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-lez v2, :cond_15

    .line 55
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 56
    .local v1, "width":I
    int-to-double v2, v1

    iget-wide v4, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->mHeightRatio:D

    mul-double/2addr v2, v4

    double-to-int v0, v2

    .line 57
    .local v0, "height":I
    invoke-virtual {p0, v1, v0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->setMeasuredDimension(II)V

    .line 62
    .end local v0    # "height":I
    .end local v1    # "width":I
    :goto_14
    return-void

    .line 60
    :cond_15
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    goto :goto_14
.end method

.method public setHeightRatio(D)V
    .registers 6
    .param p1, "ratio"    # D

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->mHeightRatio:D

    cmpl-double v0, p1, v0

    if-eqz v0, :cond_b

    .line 42
    iput-wide p1, p0, Lcom/etsy/android/grid/util/DynamicHeightImageView;->mHeightRatio:D

    .line 43
    invoke-virtual {p0}, Lcom/etsy/android/grid/util/DynamicHeightImageView;->requestLayout()V

    .line 45
    :cond_b
    return-void
.end method
