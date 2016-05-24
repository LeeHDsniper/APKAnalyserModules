.class public Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;
.super Ljava/lang/Object;
.source "HeaderRenderer.java"


# instance fields
.field private final mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

.field private final mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;


# direct methods
.method public constructor <init>(Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;)V
    .registers 3
    .param p1, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .prologue
    .line 21
    new-instance v0, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-direct {v0}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;-><init>(Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V

    .line 22
    return-void
.end method

.method private constructor <init>(Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V
    .registers 3
    .param p1, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;
    .param p2, "dimensionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .line 27
    iput-object p2, p0, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .line 28
    return-void
.end method

.method private getClipRectForHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Landroid/graphics/Rect;
    .registers 10
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "header"    # Landroid/view/View;

    .prologue
    .line 66
    iget-object v1, p0, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v1, p2}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 67
    .local v0, "headerMargins":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v1, p1}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_32

    .line 68
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v5

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v5

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 74
    :goto_31
    return-object v1

    :cond_32
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v5

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_31
.end method


# virtual methods
.method public drawHeader(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "canvas"    # Landroid/graphics/Canvas;
    .param p3, "header"    # Landroid/view/View;
    .param p4, "offset"    # Landroid/graphics/Rect;

    .prologue
    .line 40
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 42
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getClipToPadding()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 44
    invoke-direct {p0, p1, p3}, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->getClipRectForHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 45
    .local v0, "clipRect":Landroid/graphics/Rect;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    .line 48
    .end local v0    # "clipRect":Landroid/graphics/Rect;
    :cond_14
    iget v1, p4, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, p4, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p2, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 50
    invoke-virtual {p3, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 51
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 52
    return-void
.end method
