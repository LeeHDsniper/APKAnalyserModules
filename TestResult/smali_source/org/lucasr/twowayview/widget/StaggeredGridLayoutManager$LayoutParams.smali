.class public Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
.super Landroid/support/v7/widget/RecyclerView$LayoutParams;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public span:I


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 276
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 277
    const/4 v0, 0x1

    iput v0, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    .line 278
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 281
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 283
    sget-object v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_StaggeredGridViewChild:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 284
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_StaggeredGridViewChild_twowayview_span:I

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    .line 285
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 286
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 2
    .param p1, "other"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 294
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 295
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->init(Landroid/view/ViewGroup$LayoutParams;)V

    .line 296
    return-void
.end method

.method private init(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "other"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 299
    instance-of v1, p1, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    if-eqz v1, :cond_c

    move-object v0, p1

    .line 300
    check-cast v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 301
    .local v0, "lp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    iget v1, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    iput v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    .line 305
    .end local v0    # "lp":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    :goto_b
    return-void

    .line 303
    :cond_c
    const/4 v1, 0x1

    iput v1, p0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    goto :goto_b
.end method
