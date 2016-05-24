.class public abstract Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AdapterDataObserver"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8500
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 1

    .prologue
    .line 8503
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .registers 3
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 8515
    return-void
.end method
