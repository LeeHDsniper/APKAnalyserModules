.class public Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;
.super Ljava/lang/Object;
.source "Lanes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/Lanes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LaneInfo"
.end annotation


# instance fields
.field public anchorLane:I

.field public startLane:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isUndefined()Z
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 44
    iget v0, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    if-eq v0, v1, :cond_9

    iget v0, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    if-ne v0, v1, :cond_b

    :cond_9
    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public set(II)V
    .registers 3
    .param p1, "startLane"    # I
    .param p2, "anchorLane"    # I

    .prologue
    .line 48
    iput p1, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    .line 49
    iput p2, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    .line 50
    return-void
.end method

.method public setUndefined()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 53
    iput v0, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->startLane:I

    .line 54
    iput v0, p0, Lorg/lucasr/twowayview/widget/Lanes$LaneInfo;->anchorLane:I

    .line 55
    return-void
.end method
