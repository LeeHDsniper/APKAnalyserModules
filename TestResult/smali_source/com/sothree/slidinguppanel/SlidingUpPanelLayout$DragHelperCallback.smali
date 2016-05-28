.class Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;
.super Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;
.source "SlidingUpPanelLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragHelperCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;


# direct methods
.method private constructor <init>(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)V
    .registers 2

    .prologue
    .line 1158
    iput-object p1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-direct {p0}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
    .param p2, "x1"    # Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$1;

    .prologue
    .line 1158
    invoke-direct {p0, p1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;-><init>(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)V

    return-void
.end method


# virtual methods
.method public clampViewPositionVertical(Landroid/view/View;II)I
    .registers 8
    .param p1, "child"    # Landroid/view/View;
    .param p2, "top"    # I
    .param p3, "dy"    # I

    .prologue
    .line 1247
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    const/4 v3, 0x0

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v0

    .line 1248
    .local v0, "collapsedTop":I
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    const/high16 v3, 0x3f800000

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    .line 1249
    .local v1, "expandedTop":I
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mIsSlidingUp:Z
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$900(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 1250
    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1252
    :goto_1f
    return v2

    :cond_20
    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_1f
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .registers 3
    .param p1, "child"    # Landroid/view/View;

    .prologue
    .line 1242
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideRange:I
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)I

    move-result v0

    return v0
.end method

.method public onViewCaptured(Landroid/view/View;I)V
    .registers 4
    .param p1, "capturedChild"    # Landroid/view/View;
    .param p2, "activePointerId"    # I

    .prologue
    .line 1199
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setAllChildrenVisible()V

    .line 1200
    return-void
.end method

.method public onViewDragStateChanged(I)V
    .registers 6
    .param p1, "state"    # I

    .prologue
    const/4 v3, 0x0

    .line 1171
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mDragHelper:Lcom/sothree/slidinguppanel/ViewDragHelper;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$500(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/ViewDragHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->getViewDragState()I

    move-result v0

    if-nez v0, :cond_4f

    .line 1172
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computeSlideOffset(I)F
    invoke-static {v1, v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$700(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;I)F

    move-result v1

    # setter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$602(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)F

    .line 1174
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v0

    const/high16 v1, 0x3f800000

    cmpl-float v0, v0, v1

    if-nez v0, :cond_50

    .line 1175
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    move-result-object v0

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->EXPANDED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    if-eq v0, v1, :cond_4f

    .line 1176
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->updateObscuredViewVisibility()V

    .line 1177
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->EXPANDED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    # setter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$102(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    .line 1178
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->dispatchOnPanelExpanded(Landroid/view/View;)V

    .line 1195
    :cond_4f
    :goto_4f
    return-void

    .line 1180
    :cond_50
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v0

    cmpl-float v0, v0, v3

    if-nez v0, :cond_77

    .line 1181
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    move-result-object v0

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    if-eq v0, v1, :cond_4f

    .line 1182
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    # setter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$102(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    .line 1183
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->dispatchOnPanelCollapsed(Landroid/view/View;)V

    goto :goto_4f

    .line 1185
    :cond_77
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v0

    cmpg-float v0, v0, v3

    if-gez v0, :cond_9e

    .line 1186
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->HIDDEN:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    # setter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$102(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    .line 1187
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1188
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->dispatchOnPanelHidden(Landroid/view/View;)V

    goto :goto_4f

    .line 1189
    :cond_9e
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$100(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    move-result-object v0

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->ANCHORED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    if-eq v0, v1, :cond_4f

    .line 1190
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->updateObscuredViewVisibility()V

    .line 1191
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v1, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->ANCHORED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    # setter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideState:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;
    invoke-static {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$102(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    .line 1192
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->dispatchOnPanelAnchored(Landroid/view/View;)V

    goto :goto_4f
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .registers 7
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "dx"    # I
    .param p5, "dy"    # I

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->onPanelDragged(I)V
    invoke-static {v0, p3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$800(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;I)V

    .line 1205
    iget-object v0, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v0}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->invalidate()V

    .line 1206
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .registers 11
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "xvel"    # F
    .param p3, "yvel"    # F

    .prologue
    const/high16 v6, 0x40000000

    const/4 v5, 0x0

    const/high16 v4, 0x3f800000

    .line 1210
    const/4 v1, 0x0

    .line 1213
    .local v1, "target":I
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mIsSlidingUp:Z
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$900(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Z

    move-result v2

    if-eqz v2, :cond_2c

    neg-float v0, p3

    .line 1215
    .local v0, "direction":F
    :goto_f
    cmpl-float v2, v0, v5

    if-lez v2, :cond_2e

    .line 1217
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v4}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    .line 1236
    :goto_19
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mDragHelper:Lcom/sothree/slidinguppanel/ViewDragHelper;
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$500(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Lcom/sothree/slidinguppanel/ViewDragHelper;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {v2, v3, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->settleCapturedViewAt(II)Z

    .line 1237
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->invalidate()V

    .line 1238
    return-void

    .end local v0    # "direction":F
    :cond_2c
    move v0, p3

    .line 1213
    goto :goto_f

    .line 1218
    .restart local v0    # "direction":F
    :cond_2e
    cmpg-float v2, v0, v5

    if-gez v2, :cond_39

    .line 1220
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v5}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto :goto_19

    .line 1221
    :cond_39
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_5c

    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    iget-object v3, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v3

    add-float/2addr v3, v4

    div-float/2addr v3, v6

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_5c

    .line 1223
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v4}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto :goto_19

    .line 1224
    :cond_5c
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    cmpl-float v2, v2, v4

    if-nez v2, :cond_79

    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    const/high16 v3, 0x3f000000

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_79

    .line 1226
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v4}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto :goto_19

    .line 1227
    :cond_79
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_a1

    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    iget-object v3, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v3

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_a1

    .line 1228
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v3, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v3

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto/16 :goto_19

    .line 1229
    :cond_a1
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_ca

    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideOffset:F
    invoke-static {v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$600(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v2

    iget-object v3, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v3

    div-float/2addr v3, v6

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_ca

    .line 1230
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iget-object v3, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mAnchorPoint:F
    invoke-static {v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$200(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)F

    move-result v3

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto/16 :goto_19

    .line 1233
    :cond_ca
    iget-object v2, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # invokes: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->computePanelTopPosition(F)I
    invoke-static {v2, v5}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$1000(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;F)I

    move-result v1

    goto/16 :goto_19
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "pointerId"    # I

    .prologue
    const/4 v0, 0x0

    .line 1162
    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mIsUnableToDrag:Z
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$300(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1166
    :cond_9
    :goto_9
    return v0

    :cond_a
    iget-object v1, p0, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$DragHelperCallback;->this$0:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    # getter for: Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->mSlideableView:Landroid/view/View;
    invoke-static {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->access$400(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;)Landroid/view/View;

    move-result-object v1

    if-ne p1, v1, :cond_9

    const/4 v0, 0x1

    goto :goto_9
.end method
