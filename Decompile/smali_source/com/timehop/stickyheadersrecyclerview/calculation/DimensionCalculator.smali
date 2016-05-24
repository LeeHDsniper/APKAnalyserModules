.class public Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;
.super Ljava/lang/Object;
.source "DimensionCalculator.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getMarginRect(Landroid/view/ViewGroup$MarginLayoutParams;)Landroid/graphics/Rect;
    .registers 7
    .param p1, "marginLayoutParams"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 39
    new-instance v0, Landroid/graphics/Rect;

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method


# virtual methods
.method public getMargins(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 23
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_10

    move-object v1, v0

    .line 24
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 25
    .local v1, "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-direct {p0, v1}, Lcom/timehop/stickyheadersrecyclerview/calculation/DimensionCalculator;->getMarginRect(Landroid/view/ViewGroup$MarginLayoutParams;)Landroid/graphics/Rect;

    move-result-object v2

    .line 27
    .end local v1    # "marginLayoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :goto_f
    return-object v2

    :cond_10
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    goto :goto_f
.end method
