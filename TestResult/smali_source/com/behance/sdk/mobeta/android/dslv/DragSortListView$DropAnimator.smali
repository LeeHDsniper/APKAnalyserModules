.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;
.super Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropAnimator"
.end annotation


# instance fields
.field private mDropPos:I

.field private mInitDeltaX:F

.field private mInitDeltaY:F

.field private srcPos:I

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V
    .registers 4
    .param p2, "smoothness"    # F
    .param p3, "duration"    # I

    .prologue
    .line 1219
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 1220
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V

    .line 1221
    return-void
.end method

.method private getTargetY()I
    .registers 7

    .prologue
    .line 1233
    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v0

    .line 1234
    .local v0, "first":I
    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mItemHeightCollapsed:I
    invoke-static {v4}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1000(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v4

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getDividerHeight()I

    move-result v5

    add-int/2addr v4, v5

    div-int/lit8 v1, v4, 0x2

    .line 1235
    .local v1, "otherAdjust":I
    iget-object v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mDropPos:I

    sub-int/2addr v5, v0

    invoke-virtual {v4, v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1236
    .local v3, "v":Landroid/view/View;
    const/4 v2, -0x1

    .line 1237
    .local v2, "targetY":I
    if-eqz v3, :cond_47

    .line 1238
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mDropPos:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->srcPos:I

    if-ne v4, v5, :cond_2c

    .line 1239
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v2

    .line 1252
    :goto_2b
    return v2

    .line 1240
    :cond_2c
    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mDropPos:I

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->srcPos:I

    if-ge v4, v5, :cond_39

    .line 1242
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int v2, v4, v1

    goto :goto_2b

    .line 1245
    :cond_39
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v4

    add-int/2addr v4, v1

    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatViewHeight:I
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1100(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v5

    sub-int v2, v4, v5

    goto :goto_2b

    .line 1249
    :cond_47
    invoke-virtual {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->cancel()V

    goto :goto_2b
.end method


# virtual methods
.method public onStart()V
    .registers 3

    .prologue
    .line 1225
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatPos:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mDropPos:I

    .line 1226
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSrcPos:I
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->srcPos:I

    .line 1227
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v1, 0x2

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I
    invoke-static {v0, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$102(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    .line 1228
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Point;->y:I

    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->getTargetY()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaY:F

    .line 1229
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaX:F

    .line 1230
    return-void
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 1271
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->dropFloatView()V
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1200(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    .line 1272
    return-void
.end method

.method public onUpdate(FF)V
    .registers 11
    .param p1, "frac"    # F
    .param p2, "smoothFrac"    # F

    .prologue
    .line 1257
    invoke-direct {p0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->getTargetY()I

    move-result v4

    .line 1258
    .local v4, "targetY":I
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingLeft()I

    move-result v3

    .line 1259
    .local v3, "targetX":I
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v4

    int-to-float v1, v5

    .line 1260
    .local v1, "deltaY":F
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Point;->x:I

    sub-int/2addr v5, v3

    int-to-float v0, v5

    .line 1261
    .local v0, "deltaX":F
    const/high16 v5, 0x3f800000

    sub-float v2, v5, p2

    .line 1262
    .local v2, "f":F
    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaY:F

    div-float v5, v1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v2, v5

    if-ltz v5, :cond_3a

    iget v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaX:F

    div-float v5, v0, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpg-float v5, v2, v5

    if-gez v5, :cond_60

    .line 1263
    :cond_3a
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v5

    iget v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaY:F

    mul-float/2addr v6, v2

    float-to-int v6, v6

    add-int/2addr v6, v4

    iput v6, v5, Landroid/graphics/Point;->y:I

    .line 1264
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v5}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v5

    iget-object v6, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getPaddingLeft()I

    move-result v6

    iget v7, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->mInitDeltaX:F

    mul-float/2addr v7, v2

    float-to-int v7, v7

    add-int/2addr v6, v7

    iput v6, v5, Landroid/graphics/Point;->x:I

    .line 1265
    iget-object v5, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$DropAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v6, 0x1

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V
    invoke-static {v5, v6}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)V

    .line 1267
    :cond_60
    return-void
.end method
