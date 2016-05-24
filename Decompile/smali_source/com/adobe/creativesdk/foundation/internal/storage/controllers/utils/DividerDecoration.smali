.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "DividerDecoration.java"


# static fields
.field private static final ATTRS:[I


# instance fields
.field private mDivider:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 18
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010214

    aput v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->ATTRS:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 29
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->ATTRS:[I

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 30
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 31
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    return-void
.end method

.method private getOrientation(Landroid/support/v7/widget/RecyclerView;)I
    .registers 6
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 37
    :try_start_0
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;
    :try_end_6
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_6} :catch_b

    .line 42
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v1}, Landroid/support/v7/widget/LinearLayoutManager;->getOrientation()I

    move-result v2

    return v2

    .line 38
    .end local v1    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    :catch_b
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "DividerDecoration can only be used with a LinearLayoutManager."

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public drawHorizontal(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;)V
    .registers 15
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 74
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v9

    .line 75
    .local v9, "top":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v10

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v11

    sub-int v0, v10, v11

    .line 76
    .local v0, "bottom":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v6

    .line 77
    .local v6, "recyclerViewLeft":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v10

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v11

    sub-int v7, v10, v11

    .line 78
    .local v7, "recyclerViewRight":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    .line 79
    .local v2, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_21
    if-ge v3, v2, :cond_50

    .line 80
    invoke-virtual {p2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 82
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 83
    .local v5, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v10

    iget v11, v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;->rightMargin:I

    add-int/2addr v10, v11

    invoke-static {v6, v10}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 84
    .local v4, "left":I
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    add-int/2addr v10, v4

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 85
    .local v8, "right":I
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v4, v9, v8, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 86
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 79
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 88
    .end local v1    # "child":Landroid/view/View;
    .end local v4    # "left":I
    .end local v5    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .end local v8    # "right":I
    :cond_50
    return-void
.end method

.method public drawVertical(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;)V
    .registers 15
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 57
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v4

    .line 58
    .local v4, "left":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v10

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v11

    sub-int v8, v10, v11

    .line 59
    .local v8, "right":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v7

    .line 60
    .local v7, "recyclerViewTop":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v10

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v11

    sub-int v6, v10, v11

    .line 61
    .local v6, "recyclerViewBottom":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    .line 62
    .local v2, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_21
    if-ge v3, v2, :cond_50

    .line 63
    invoke-virtual {p2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 65
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 66
    .local v5, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v10

    iget v11, v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    add-int/2addr v10, v11

    invoke-static {v7, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 67
    .local v9, "top":I
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v10

    add-int/2addr v10, v9

    invoke-static {v6, v10}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 68
    .local v0, "bottom":I
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v4, v9, v8, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 69
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 62
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 71
    .end local v0    # "bottom":I
    .end local v1    # "child":Landroid/view/View;
    .end local v5    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .end local v9    # "top":I
    :cond_50
    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 8
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v2, 0x0

    .line 92
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 93
    invoke-direct {p0, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-virtual {p1, v2, v2, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 98
    :goto_14
    return-void

    .line 96
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1, v2, v2, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_14
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 47
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 49
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->getOrientation(Landroid/support/v7/widget/RecyclerView;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_e

    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->drawVertical(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;)V

    .line 54
    :goto_d
    return-void

    .line 52
    :cond_e
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/DividerDecoration;->drawHorizontal(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;)V

    goto :goto_d
.end method
