.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ToolBarPixelScroller"
.end annotation


# instance fields
.field private initialized:Z

.field private originalAlpha:I

.field private originalBlue:I

.field private originalColor:I

.field private originalGreen:I

.field private originalRed:I

.field private position:I

.field private final toolbarSoftReference:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/support/v7/widget/Toolbar;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/support/v7/widget/Toolbar;)V
    .registers 3
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 851
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 852
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->toolbarSoftReference:Ljava/lang/ref/SoftReference;

    .line 853
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    .line 854
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->init(Landroid/support/v7/widget/Toolbar;)V

    .line 855
    return-void
.end method

.method private init(Landroid/support/v7/widget/Toolbar;)V
    .registers 5
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 858
    if-eqz p1, :cond_33

    .line 859
    invoke-virtual {p1}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 860
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v2, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_33

    .line 861
    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v0

    .line 862
    .local v0, "currentColor":I
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalAlpha:I

    .line 863
    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalColor:I

    .line 864
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalColor:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalRed:I

    .line 865
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalColor:I

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalGreen:I

    .line 866
    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalColor:I

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalBlue:I

    .line 867
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->initialized:Z

    .line 870
    .end local v0    # "currentColor":I
    :cond_33
    return-void
.end method


# virtual methods
.method public reset()V
    .registers 3

    .prologue
    .line 873
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->initialized:Z

    if-eqz v1, :cond_16

    .line 874
    const/4 v1, 0x0

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    .line 875
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->toolbarSoftReference:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 876
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_16

    .line 877
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalColor:I

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 880
    .end local v0    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_16
    return-void
.end method

.method public scroll(III)V
    .registers 10
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "maxHeight"    # I

    .prologue
    .line 893
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->toolbarSoftReference:Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/Toolbar;

    .line 894
    .local v2, "toolbar":Landroid/support/v7/widget/Toolbar;
    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->initialized:Z

    if-eqz v3, :cond_47

    if-eqz v2, :cond_47

    if-lez p3, :cond_47

    .line 895
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    add-int/2addr v3, p2

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    .line 896
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    if-ltz v3, :cond_47

    .line 897
    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v3

    sub-int v1, p3, v3

    .line 898
    .local v1, "height":I
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalAlpha:I

    int-to-float v3, v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->position:I

    int-to-float v4, v4

    int-to-float v5, v1

    div-float/2addr v4, v5

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalAlpha:I

    rsub-int v5, v5, 0xff

    int-to-float v5, v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    float-to-int v0, v3

    .line 899
    .local v0, "alpha":I
    const/16 v3, 0xff

    const/4 v4, 0x0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 900
    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalRed:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalGreen:I

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalBlue:I

    invoke-static {v0, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 903
    .end local v0    # "alpha":I
    .end local v1    # "height":I
    :cond_47
    return-void
.end method

.method public setColor(I)V
    .registers 7
    .param p1, "color"    # I

    .prologue
    .line 883
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->toolbarSoftReference:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 884
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->initialized:Z

    if-eqz v1, :cond_2f

    if-eqz v0, :cond_2f

    .line 885
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalRed:I

    .line 886
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalGreen:I

    .line 887
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalBlue:I

    .line 888
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalAlpha:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalRed:I

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalGreen:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$ToolBarPixelScroller;->originalBlue:I

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundColor(I)V

    .line 890
    :cond_2f
    return-void
.end method
