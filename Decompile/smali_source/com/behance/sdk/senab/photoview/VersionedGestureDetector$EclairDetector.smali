.class Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;
.super Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;
.source "VersionedGestureDetector.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x5
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EclairDetector"
.end annotation


# instance fields
.field private mActivePointerId:I

.field private mActivePointerIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 175
    invoke-direct {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;-><init>(Landroid/content/Context;)V

    .line 171
    const/4 v0, -0x1

    iput v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    .line 172
    const/4 v0, 0x0

    iput v0, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerIndex:I

    .line 176
    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 181
    :try_start_0
    iget v1, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 183
    :goto_6
    return v1

    .line 182
    :catch_7
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    goto :goto_6
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 190
    :try_start_0
    iget v1, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 192
    :goto_6
    return v1

    .line 191
    :catch_7
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_6
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 10
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, -0x1

    const/4 v4, 0x0

    .line 198
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 199
    .local v0, "action":I
    and-int/lit16 v5, v0, 0xff

    packed-switch v5, :pswitch_data_50

    .line 221
    :cond_b
    :goto_b
    :pswitch_b
    iget v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    if-eq v5, v7, :cond_11

    iget v4, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    :cond_11
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    iput v4, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerIndex:I

    .line 222
    invoke-super {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    return v4

    .line 201
    :pswitch_1c
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    goto :goto_b

    .line 205
    :pswitch_23
    iput v7, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    goto :goto_b

    .line 208
    :pswitch_26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    const v6, 0xff00

    and-int/2addr v5, v6

    shr-int/lit8 v3, v5, 0x8

    .line 209
    .local v3, "pointerIndex":I
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 210
    .local v2, "pointerId":I
    iget v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    if-ne v2, v5, :cond_b

    .line 213
    if-nez v3, :cond_4e

    const/4 v1, 0x1

    .line 214
    .local v1, "newPointerIndex":I
    :goto_3b
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mActivePointerId:I

    .line 215
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    iput v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mLastTouchX:F

    .line 216
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    iput v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$EclairDetector;->mLastTouchY:F

    goto :goto_b

    .end local v1    # "newPointerIndex":I
    :cond_4e
    move v1, v4

    .line 213
    goto :goto_3b

    .line 199
    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_23
        :pswitch_b
        :pswitch_23
        :pswitch_b
        :pswitch_b
        :pswitch_26
    .end packed-switch
.end method
