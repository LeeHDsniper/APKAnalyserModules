.class public Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
.super Landroid/support/v7/widget/RecyclerView$LayoutParams;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field private mSpanIndex:I

.field private mSpanSize:I


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 862
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 853
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 855
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    .line 863
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 858
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 853
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 855
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    .line 859
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 870
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 853
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 855
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    .line 871
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 866
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 853
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 855
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    .line 867
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .prologue
    .line 846
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    return v0
.end method

.method static synthetic access$002(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .param p1, "x1"    # I

    .prologue
    .line 846
    iput p1, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    return p1
.end method

.method static synthetic access$100(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .prologue
    .line 846
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    return v0
.end method

.method static synthetic access$102(Landroid/support/v7/widget/GridLayoutManager$LayoutParams;I)I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    .param p1, "x1"    # I

    .prologue
    .line 846
    iput p1, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    return p1
.end method


# virtual methods
.method public getSpanIndex()I
    .registers 2

    .prologue
    .line 891
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    return v0
.end method

.method public getSpanSize()I
    .registers 2

    .prologue
    .line 901
    iget v0, p0, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    return v0
.end method
