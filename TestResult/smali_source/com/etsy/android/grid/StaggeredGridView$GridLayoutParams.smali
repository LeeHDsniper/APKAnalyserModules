.class public Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;
.super Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
.source "StaggeredGridView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/StaggeredGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GridLayoutParams"
.end annotation


# instance fields
.field column:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 1218
    invoke-direct {p0, p1, p2}, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;-><init>(II)V

    .line 1219
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->enforceStaggeredLayout()V

    .line 1220
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 2
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1228
    invoke-direct {p0, p1}, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1229
    invoke-direct {p0}, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->enforceStaggeredLayout()V

    .line 1230
    return-void
.end method

.method private enforceStaggeredLayout()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 1238
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->width:I

    if-eq v0, v1, :cond_7

    .line 1239
    iput v1, p0, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->width:I

    .line 1241
    :cond_7
    iget v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->height:I

    if-ne v0, v1, :cond_e

    .line 1242
    const/4 v0, -0x2

    iput v0, p0, Lcom/etsy/android/grid/StaggeredGridView$GridLayoutParams;->height:I

    .line 1244
    :cond_e
    return-void
.end method
