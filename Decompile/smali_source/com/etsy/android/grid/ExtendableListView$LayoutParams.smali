.class public Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
.super Landroid/widget/AbsListView$LayoutParams;
.source "ExtendableListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field itemId:J

.field position:I

.field recycledHeaderFooter:Z

.field viewType:I


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 2138
    invoke-direct {p0, p1, p2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 2128
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->itemId:J

    .line 2139
    return-void
.end method

.method public constructor <init>(III)V
    .registers 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "viewType"    # I

    .prologue
    .line 2142
    invoke-direct {p0, p1, p2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 2128
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->itemId:J

    .line 2143
    iput p3, p0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    .line 2144
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 2147
    invoke-direct {p0, p1}, Landroid/widget/AbsListView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2128
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->itemId:J

    .line 2148
    return-void
.end method
