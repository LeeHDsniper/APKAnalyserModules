.class Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;
.super Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;
.source "DragSortListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoveAnimator"
.end annotation


# instance fields
.field private mFirstChildHeight:I

.field private mFirstPos:I

.field private mFirstStartBlank:F

.field private mFloatLocX:F

.field private mSecondChildHeight:I

.field private mSecondPos:I

.field private mSecondStartBlank:F

.field final synthetic this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;


# direct methods
.method public constructor <init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V
    .registers 5
    .param p2, "smoothness"    # F
    .param p3, "duration"    # I

    .prologue
    const/4 v0, -0x1

    .line 1291
    iput-object p1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    .line 1292
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$SmoothAnimator;-><init>(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;FI)V

    .line 1285
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1286
    iput v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1293
    return-void
.end method


# virtual methods
.method public onStart()V
    .registers 7

    .prologue
    const/4 v2, 0x1

    const/high16 v4, 0x40000000

    const/4 v1, -0x1

    const/4 v5, 0x0

    .line 1297
    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1298
    iput v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1299
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFirstExpPos:I
    invoke-static {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1300(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    .line 1300
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mSecondExpPos:I
    invoke-static {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1400(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)I

    move-result v3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    .line 1301
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mDragState:I
    invoke-static {v3, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$102(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;I)I

    .line 1303
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    iput v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    .line 1304
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z
    invoke-static {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Z

    move-result v3

    if-eqz v3, :cond_8b

    .line 1305
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v0, v4, v3

    .line 1306
    .local v0, "minVelocity":F
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v3}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v3

    cmpl-float v3, v3, v5

    if-nez v3, :cond_54

    .line 1307
    iget-object v3, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v4, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_52

    :goto_4c
    int-to-float v1, v1

    mul-float/2addr v1, v0

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v3, v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;F)F

    .line 1318
    .end local v0    # "minVelocity":F
    :cond_51
    :goto_51
    return-void

    .restart local v0    # "minVelocity":F
    :cond_52
    move v1, v2

    .line 1307
    goto :goto_4c

    .line 1309
    :cond_54
    mul-float/2addr v0, v4

    .line 1310
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpg-float v1, v1, v5

    if-gez v1, :cond_71

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    neg-float v2, v0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_71

    .line 1311
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    neg-float v2, v0

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1, v2}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;F)F

    goto :goto_51

    .line 1312
    :cond_71
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpl-float v1, v1, v5

    if-lez v1, :cond_51

    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v1

    cmpg-float v1, v1, v0

    if-gez v1, :cond_51

    .line 1313
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v1, v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;F)F

    goto :goto_51

    .line 1316
    .end local v0    # "minVelocity":F
    :cond_8b
    iget-object v1, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->destroyFloatView()V
    invoke-static {v1}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    goto :goto_51
.end method

.method public onStop()V
    .registers 2

    .prologue
    .line 1372
    iget-object v0, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doRemoveItem()V
    invoke-static {v0}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1900(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)V

    .line 1373
    return-void
.end method

.method public onUpdate(FF)V
    .registers 15
    .param p1, "frac"    # F
    .param p2, "smoothFrac"    # F

    .prologue
    .line 1322
    const/high16 v8, 0x3f800000

    sub-float v3, v8, p2

    .line 1324
    .local v3, "f":F
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getFirstVisiblePosition()I

    move-result v4

    .line 1325
    .local v4, "firstVis":I
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1329
    .local v5, "item":Landroid/view/View;
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mUseRemoveVelocity:Z
    invoke-static {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Z

    move-result v8

    if-eqz v8, :cond_85

    .line 1330
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mStartTime:J

    sub-long/2addr v8, v10

    long-to-float v8, v8

    const/high16 v9, 0x447a0000

    div-float v1, v8, v9

    .line 1331
    .local v1, "dt":F
    const/4 v8, 0x0

    cmpl-float v8, v1, v8

    if-nez v8, :cond_2d

    .line 1368
    .end local v1    # "dt":F
    :cond_2c
    :goto_2c
    return-void

    .line 1333
    .restart local v1    # "dt":F
    :cond_2d
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v8

    mul-float v2, v8, v1

    .line 1334
    .local v2, "dx":F
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    invoke-virtual {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getWidth()I

    move-result v7

    .line 1335
    .local v7, "w":I
    iget-object v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v10

    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1600(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)F

    move-result v8

    const/4 v11, 0x0

    cmpl-float v8, v8, v11

    if-lez v8, :cond_83

    const/4 v8, 0x1

    :goto_4f
    int-to-float v8, v8

    mul-float/2addr v8, v1

    int-to-float v11, v7

    mul-float/2addr v8, v11

    add-float/2addr v8, v10

    # setter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mRemoveVelocityX:F
    invoke-static {v9, v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1602(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;F)F

    .line 1336
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    add-float/2addr v8, v2

    iput v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    .line 1337
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    # getter for: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->mFloatLoc:Landroid/graphics/Point;
    invoke-static {v8}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$500(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;)Landroid/graphics/Point;

    move-result-object v8

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    float-to-int v9, v9

    iput v9, v8, Landroid/graphics/Point;->x:I

    .line 1338
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    int-to-float v9, v7

    cmpg-float v8, v8, v9

    if-gez v8, :cond_85

    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFloatLocX:F

    neg-int v9, v7

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_85

    .line 1339
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mStartTime:J

    .line 1340
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    const/4 v9, 0x1

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->doDragFloatView(Z)V
    invoke-static {v8, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$700(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;Z)V

    goto :goto_2c

    .line 1335
    :cond_83
    const/4 v8, -0x1

    goto :goto_4f

    .line 1345
    .end local v1    # "dt":F
    .end local v2    # "dx":F
    .end local v7    # "w":I
    :cond_85
    if-eqz v5, :cond_b6

    .line 1346
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_a1

    .line 1347
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    const/4 v10, 0x0

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I
    invoke-static {v8, v9, v5, v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)I

    move-result v8

    iput v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    .line 1348
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iput v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstStartBlank:F

    .line 1350
    :cond_a1
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstStartBlank:F

    mul-float/2addr v8, v3

    float-to-int v8, v8

    const/4 v9, 0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1351
    .local v0, "blank":I
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 1352
    .local v6, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstChildHeight:I

    add-int/2addr v8, v0

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1353
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1355
    .end local v0    # "blank":I
    .end local v6    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_b6
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mFirstPos:I

    if-eq v8, v9, :cond_2c

    .line 1356
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    sub-int/2addr v9, v4

    invoke-virtual {v8, v9}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1357
    if-eqz v5, :cond_2c

    .line 1358
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_e1

    .line 1359
    iget-object v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->this$0:Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondPos:I

    const/4 v10, 0x0

    # invokes: Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->getChildHeight(ILandroid/view/View;Z)I
    invoke-static {v8, v9, v5, v10}, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;->access$1800(Lcom/behance/sdk/mobeta/android/dslv/DragSortListView;ILandroid/view/View;Z)I

    move-result v8

    iput v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    .line 1360
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v8

    iget v9, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    iput v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondStartBlank:F

    .line 1362
    :cond_e1
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondStartBlank:F

    mul-float/2addr v8, v3

    float-to-int v8, v8

    const/4 v9, 0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1363
    .restart local v0    # "blank":I
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 1364
    .restart local v6    # "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v8, p0, Lcom/behance/sdk/mobeta/android/dslv/DragSortListView$RemoveAnimator;->mSecondChildHeight:I

    add-int/2addr v8, v0

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1365
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_2c
.end method
