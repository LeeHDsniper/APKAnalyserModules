.class public Lcom/adobe/android/ui/view/SquareImageView;
.super Landroid/widget/ImageView;
.source "SquareImageView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 10
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/view/SquareImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 14
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/view/SquareImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 23
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 25
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/SquareImageView;->getMeasuredWidth()I

    move-result v2

    .line 26
    .local v2, "w":I
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/SquareImageView;->getMeasuredHeight()I

    move-result v0

    .line 27
    .local v0, "h":I
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 29
    .local v1, "max":I
    invoke-virtual {p0, v1, v1}, Lcom/adobe/android/ui/view/SquareImageView;->setMeasuredDimension(II)V

    .line 30
    return-void
.end method
