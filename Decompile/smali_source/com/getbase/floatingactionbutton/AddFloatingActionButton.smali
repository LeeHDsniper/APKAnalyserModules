.class public Lcom/getbase/floatingactionbutton/AddFloatingActionButton;
.super Lcom/getbase/floatingactionbutton/FloatingActionButton;
.source "AddFloatingActionButton.java"


# instance fields
.field mPlusColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method


# virtual methods
.method getIconDrawable()Landroid/graphics/drawable/Drawable;
    .registers 11

    .prologue
    const/high16 v9, 0x40000000

    .line 64
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_icon_size:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getDimension(I)F

    move-result v5

    .line 65
    .local v5, "iconSize":F
    div-float v3, v5, v9

    .line 67
    .local v3, "iconHalfSize":F
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_plus_icon_size:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getDimension(I)F

    move-result v8

    .line 68
    .local v8, "plusSize":F
    sget v1, Lcom/getbase/floatingactionbutton/R$dimen;->fab_plus_icon_stroke:I

    invoke-virtual {p0, v1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getDimension(I)F

    move-result v1

    div-float v4, v1, v9

    .line 69
    .local v4, "plusHalfStroke":F
    sub-float v1, v5, v8

    div-float v2, v1, v9

    .line 71
    .local v2, "plusOffset":F
    new-instance v0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;-><init>(Lcom/getbase/floatingactionbutton/AddFloatingActionButton;FFFF)V

    .line 79
    .local v0, "shape":Landroid/graphics/drawable/shapes/Shape;
    new-instance v6, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v6, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 81
    .local v6, "drawable":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v6}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v7

    .line 82
    .local v7, "paint":Landroid/graphics/Paint;
    iget v1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->mPlusColor:I

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 83
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 84
    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 86
    return-object v6
.end method

.method public getPlusColor()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->mPlusColor:I

    return v0
.end method

.method init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 32
    sget-object v1, Lcom/getbase/floatingactionbutton/R$styleable;->AddFloatingActionButton:[I

    invoke-virtual {p1, p2, v1, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 33
    .local v0, "attr":Landroid/content/res/TypedArray;
    sget v1, Lcom/getbase/floatingactionbutton/R$styleable;->AddFloatingActionButton_fab_plusIconColor:I

    const v2, 0x106000b

    invoke-virtual {p0, v2}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->mPlusColor:I

    .line 34
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 36
    invoke-super {p0, p1, p2}, Lcom/getbase/floatingactionbutton/FloatingActionButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method

.method public setIcon(I)V
    .registers 4
    .param p1, "icon"    # I

    .prologue
    .line 59
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Use FloatingActionButton if you want to use custom icon"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPlusColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 51
    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->mPlusColor:I

    if-eq v0, p1, :cond_9

    .line 52
    iput p1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->mPlusColor:I

    .line 53
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->updateBackground()V

    .line 55
    :cond_9
    return-void
.end method

.method public setPlusColorResId(I)V
    .registers 3
    .param p1, "plusColor"    # I

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->setPlusColor(I)V

    .line 48
    return-void
.end method
