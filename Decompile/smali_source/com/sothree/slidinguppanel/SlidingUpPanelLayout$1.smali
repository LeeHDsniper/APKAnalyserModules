.class Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;
.super Ljava/lang/Object;
.source "SlidingUpPanelLayout.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setDragView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;


# direct methods
.method constructor <init>(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    .prologue
    .line 495
    iput-object p1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 498
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->isTouchEnabled()Z

    move-result v0

    if-nez v0, :cond_11

    .line 508
    :cond_10
    :goto_10
    return-void

    .line 499
    :cond_11
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    move-result-object v0

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->EXPANDED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    if-eq v0, v1, :cond_41

    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    move-result-object v0

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->ANCHORED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    if-eq v0, v1, :cond_41

    .line 500
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v0

    const/high16 v1, 0x3f800000

    cmpg-float v0, v0, v1

    if-gez v0, :cond_39

    .line 501
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->ANCHORED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    goto :goto_10

    .line 503
    :cond_39
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->EXPANDED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    goto :goto_10

    .line 506
    :cond_41
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    goto :goto_10
.end method
