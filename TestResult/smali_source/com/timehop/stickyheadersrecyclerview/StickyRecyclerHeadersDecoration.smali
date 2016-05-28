.class public Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "StickyRecyclerHeadersDecoration.java"


# instance fields
.field private final mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

.field private final mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

.field private final mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

.field private final mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

.field private final mHeaderRects:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private final mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

.field private final mRenderer:Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;


# direct methods
.method public constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;)V
    .registers 4
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    .prologue
    .line 29
    new-instance v0, Lcom/timehop/stickyheadersrecyclerview/util/LinearLayoutOrientationProvider;

    invoke-direct {v0}, Lcom/timehop/stickyheadersrecyclerview/util/LinearLayoutOrientationProvider;-><init>()V

    new-instance v1, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-direct {v1}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V

    .line 30
    return-void
.end method

.method private constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;)V
    .registers 8
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;
    .param p2, "headerRenderer"    # Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;
    .param p3, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;
    .param p4, "dimensionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;
    .param p5, "headerProvider"    # Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;
    .param p6, "headerPositionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 20
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderRects:Landroid/util/SparseArray;

    .line 48
    iput-object p1, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    .line 49
    iput-object p5, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    .line 50
    iput-object p3, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    .line 51
    iput-object p2, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mRenderer:Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;

    .line 52
    iput-object p4, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .line 53
    iput-object p6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    .line 54
    return-void
.end method

.method private constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V
    .registers 10
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;
    .param p2, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;
    .param p3, "dimensionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    .prologue
    .line 34
    new-instance v4, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;

    invoke-direct {v4, p2}, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;-><init>(Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;)V

    new-instance v5, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;

    invoke-direct {v5, p1, p2}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderViewCache;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;)V

    .line 36
    return-void
.end method

.method private constructor <init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;)V
    .registers 13
    .param p1, "adapter"    # Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;
    .param p2, "orientationProvider"    # Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;
    .param p3, "dimensionCalculator"    # Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;
    .param p4, "headerRenderer"    # Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;
    .param p5, "headerProvider"    # Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    .prologue
    .line 40
    new-instance v6, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    invoke-direct {v6, p1, p5, p2, p3}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p4

    move-object v3, p2

    move-object v4, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;)V

    .line 43
    return-void
.end method

.method private setItemOffsetsForHeader(Landroid/graphics/Rect;Landroid/view/View;I)V
    .registers 7
    .param p1, "itemOffsets"    # Landroid/graphics/Rect;
    .param p2, "header"    # Landroid/view/View;
    .param p3, "orientation"    # I

    .prologue
    .line 77
    iget-object v1, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mDimensionCalculator:Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;

    invoke-virtual {v1, p2}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMargins(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    .line 78
    .local v0, "headerMargins":Landroid/graphics/Rect;
    const/4 v1, 0x1

    if-ne p3, v1, :cond_16

    .line 79
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 83
    :goto_15
    return-void

    .line 81
    :cond_16
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    iget v2, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    goto :goto_15
.end method


# virtual methods
.method public getHeaderView(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;
    .registers 4
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "position"    # I

    .prologue
    .line 138
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v0, p1, p2}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 58
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 59
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    .line 60
    .local v1, "itemPosition":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_b

    .line 67
    :cond_a
    :goto_a
    return-void

    .line 63
    :cond_b
    iget-object v2, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    invoke-virtual {v2, v1}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->hasNewHeader(I)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 64
    invoke-virtual {p0, p3, v1}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->getHeaderView(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v0

    .line 65
    .local v0, "header":Landroid/view/View;
    iget-object v2, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v2, p3}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v2

    invoke-direct {p0, p1, v0, v2}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->setItemOffsetsForHeader(Landroid/graphics/Rect;Landroid/view/View;I)V

    goto :goto_a
.end method

.method public invalidateHeaders()V
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v0}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->invalidate()V

    .line 147
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 87
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 88
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderRects:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->clear()V

    .line 90
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v6

    if-lez v6, :cond_16

    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mAdapter:Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;

    invoke-interface {v6}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;->getItemCount()I

    move-result v6

    if-gtz v6, :cond_17

    .line 110
    :cond_16
    return-void

    .line 94
    :cond_17
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_18
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_16

    .line 95
    invoke-virtual {p2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 96
    .local v4, "itemView":Landroid/view/View;
    invoke-virtual {p2, v4}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v5

    .line 97
    .local v5, "position":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_2c

    .line 94
    :cond_29
    :goto_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 101
    :cond_2c
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    iget-object v7, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mOrientationProvider:Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;

    invoke-interface {v7, p2}, Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v7

    invoke-virtual {v6, v4, v7, v5}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->hasStickyHeader(Landroid/view/View;II)Z

    move-result v0

    .line 102
    .local v0, "hasStickyHeader":Z
    if-nez v0, :cond_42

    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    invoke-virtual {v6, v5}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->hasNewHeader(I)Z

    move-result v6

    if-eqz v6, :cond_29

    .line 103
    :cond_42
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderProvider:Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;

    invoke-interface {v6, p2, v5}, Lcom/timehop/stickyheadersrecyclerview/caching/HeaderProvider;->getHeader(Landroid/support/v7/widget/RecyclerView;I)Landroid/view/View;

    move-result-object v1

    .line 104
    .local v1, "header":Landroid/view/View;
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderPositionCalculator:Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;

    invoke-virtual {v6, p2, v1, v4, v0}, Lcom/timehop/stickyheadersrecyclerview/HeaderPositionCalculator;->getHeaderBounds(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Landroid/view/View;Z)Landroid/graphics/Rect;

    move-result-object v2

    .line 106
    .local v2, "headerOffset":Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mRenderer:Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;

    invoke-virtual {v6, p2, p1, v1, v2}, Lcom/timehop/stickyheadersrecyclerview/rendering/HeaderRenderer;->drawHeader(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 107
    iget-object v6, p0, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;->mHeaderRects:Landroid/util/SparseArray;

    invoke-virtual {v6, v5, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_29
.end method
