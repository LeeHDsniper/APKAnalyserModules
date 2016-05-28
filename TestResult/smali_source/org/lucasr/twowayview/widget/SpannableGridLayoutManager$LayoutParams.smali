.class public Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
.super Landroid/support/v7/widget/RecyclerView$LayoutParams;
.source "SpannableGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public colSpan:I

.field public rowSpan:I


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v0, 0x1

    .line 298
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 299
    iput v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 300
    iput v0, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 301
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    .line 304
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 306
    sget-object v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_SpannableGridViewChild:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 307
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_SpannableGridViewChild_twowayview_colSpan:I

    .line 308
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 307
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 309
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$styleable;->twowayview_SpannableGridViewChild_twowayview_rowSpan:I

    .line 310
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 309
    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 311
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 312
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 2
    .param p1, "other"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 320
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 321
    invoke-direct {p0, p1}, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->init(Landroid/view/ViewGroup$LayoutParams;)V

    .line 322
    return-void
.end method

.method private init(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "other"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v2, 0x1

    .line 325
    instance-of v1, p1, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    if-eqz v1, :cond_11

    move-object v0, p1

    .line 326
    check-cast v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;

    .line 327
    .local v0, "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    iget v1, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    iput v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 328
    iget v1, v0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    iput v1, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    .line 333
    .end local v0    # "lp":Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;
    :goto_10
    return-void

    .line 330
    :cond_11
    iput v2, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->rowSpan:I

    .line 331
    iput v2, p0, Lorg/lucasr/twowayview/widget/SpannableGridLayoutManager$LayoutParams;->colSpan:I

    goto :goto_10
.end method
