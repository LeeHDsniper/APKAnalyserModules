.class public Lcom/timehop/stickyheadersrecyclerview/util/LinearLayoutOrientationProvider;
.super Ljava/lang/Object;
.source "LinearLayoutOrientationProvider.java"

# interfaces
.implements Lcom/timehop/stickyheadersrecyclerview/util/OrientationProvider;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOrientation(Landroid/support/v7/widget/RecyclerView;)I
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 13
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    .line 15
    .local v0, "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    instance-of v1, v0, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v1, :cond_f

    .line 16
    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v0    # "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->getOrientation()I

    move-result v1

    return v1

    .line 18
    .restart local v0    # "layoutManager":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :cond_f
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "StickyListHeadersDecoration can only be used with a LinearLayoutManager."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
