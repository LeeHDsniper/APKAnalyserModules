.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "GridSpacesItemDecoration.java"


# instance fields
.field private offset:I


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .registers 4
    .param p1, "space"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->dpToPx(ILandroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->offset:I

    .line 18
    return-void
.end method


# virtual methods
.method public dpToPx(ILandroid/content/Context;)I
    .registers 8
    .param p1, "dp"    # I
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 22
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    int-to-float v2, p1

    iget v3, v0, Landroid/util/DisplayMetrics;->xdpi:F

    const/high16 v4, 0x43200000

    div-float/2addr v3, v4

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 23
    .local v1, "px":I
    return v1
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 9
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 28
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 29
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->offset:I

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->offset:I

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->offset:I

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/GridSpacesItemDecoration;->offset:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 30
    return-void
.end method
