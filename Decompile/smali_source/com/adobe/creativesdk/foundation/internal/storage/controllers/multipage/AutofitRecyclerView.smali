.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;
.super Landroid/support/v7/widget/RecyclerView;
.source "AutofitRecyclerView.java"


# instance fields
.field private columnWidth:I

.field private manager:Landroid/support/v7/widget/GridLayoutManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 33
    if-eqz p2, :cond_19

    .line 34
    new-array v1, v4, [I

    const v2, 0x1010117

    aput v2, v1, v3

    .line 37
    .local v1, "attrsArray":[I
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 38
    .local v0, "array":Landroid/content/res/TypedArray;
    const/4 v2, -0x1

    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    .line 39
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    .end local v0    # "array":Landroid/content/res/TypedArray;
    .end local v1    # "attrsArray":[I
    :cond_19
    new-instance v2, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->manager:Landroid/support/v7/widget/GridLayoutManager;

    .line 43
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->manager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 44
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 7
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    .line 49
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->onMeasure(II)V

    .line 50
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    if-lez v1, :cond_18

    .line 51
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->getMeasuredWidth()I

    move-result v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->columnWidth:I

    div-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 52
    .local v0, "spanCount":I
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AutofitRecyclerView;->manager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    .line 54
    .end local v0    # "spanCount":I
    :cond_18
    return-void
.end method
