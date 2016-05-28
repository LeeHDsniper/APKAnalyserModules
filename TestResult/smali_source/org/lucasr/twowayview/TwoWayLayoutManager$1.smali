.class Lorg/lucasr/twowayview/TwoWayLayoutManager$1;
.super Landroid/support/v7/widget/LinearSmoothScroller;
.source "TwoWayLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/lucasr/twowayview/TwoWayLayoutManager;->smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/lucasr/twowayview/TwoWayLayoutManager;


# direct methods
.method constructor <init>(Lorg/lucasr/twowayview/TwoWayLayoutManager;Landroid/content/Context;)V
    .registers 3
    .param p1, "this$0"    # Lorg/lucasr/twowayview/TwoWayLayoutManager;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 829
    iput-object p1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;->this$0:Lorg/lucasr/twowayview/TwoWayLayoutManager;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .registers 6
    .param p1, "targetPosition"    # I

    .prologue
    const/4 v3, 0x0

    .line 832
    invoke-virtual {p0}, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;->getChildCount()I

    move-result v1

    if-nez v1, :cond_9

    .line 833
    const/4 v1, 0x0

    .line 840
    :goto_8
    return-object v1

    .line 836
    :cond_9
    iget-object v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;->this$0:Lorg/lucasr/twowayview/TwoWayLayoutManager;

    invoke-virtual {v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->getFirstVisiblePosition()I

    move-result v1

    if-ge p1, v1, :cond_21

    const/4 v0, -0x1

    .line 837
    .local v0, "direction":I
    :goto_12
    iget-object v1, p0, Lorg/lucasr/twowayview/TwoWayLayoutManager$1;->this$0:Lorg/lucasr/twowayview/TwoWayLayoutManager;

    # getter for: Lorg/lucasr/twowayview/TwoWayLayoutManager;->mIsVertical:Z
    invoke-static {v1}, Lorg/lucasr/twowayview/TwoWayLayoutManager;->access$200(Lorg/lucasr/twowayview/TwoWayLayoutManager;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 838
    new-instance v1, Landroid/graphics/PointF;

    int-to-float v2, v0

    invoke-direct {v1, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_8

    .line 836
    .end local v0    # "direction":I
    :cond_21
    const/4 v0, 0x1

    goto :goto_12

    .line 840
    .restart local v0    # "direction":I
    :cond_23
    new-instance v1, Landroid/graphics/PointF;

    int-to-float v2, v0

    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    goto :goto_8
.end method

.method protected getHorizontalSnapPreference()I
    .registers 2

    .prologue
    .line 851
    const/4 v0, -0x1

    return v0
.end method

.method protected getVerticalSnapPreference()I
    .registers 2

    .prologue
    .line 846
    const/4 v0, -0x1

    return v0
.end method
