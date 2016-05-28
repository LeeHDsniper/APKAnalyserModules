.class Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;
.super Landroid/graphics/drawable/shapes/Shape;
.source "AddFloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getbase/floatingactionbutton/AddFloatingActionButton;->getIconDrawable()Landroid/graphics/drawable/Drawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

.field final synthetic val$iconHalfSize:F

.field final synthetic val$iconSize:F

.field final synthetic val$plusHalfStroke:F

.field final synthetic val$plusOffset:F


# direct methods
.method constructor <init>(Lcom/getbase/floatingactionbutton/AddFloatingActionButton;FFFF)V
    .registers 6
    .param p1, "this$0"    # Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->this$0:Lcom/getbase/floatingactionbutton/AddFloatingActionButton;

    iput p2, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusOffset:F

    iput p3, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconHalfSize:F

    iput p4, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusHalfStroke:F

    iput p5, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconSize:F

    invoke-direct {p0}, Landroid/graphics/drawable/shapes/Shape;-><init>()V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 74
    iget v1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusOffset:F

    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconHalfSize:F

    iget v2, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusHalfStroke:F

    sub-float v2, v0, v2

    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconSize:F

    iget v3, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusOffset:F

    sub-float v3, v0, v3

    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconHalfSize:F

    iget v4, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusHalfStroke:F

    add-float/2addr v4, v0

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 75
    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconHalfSize:F

    iget v1, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusHalfStroke:F

    sub-float v1, v0, v1

    iget v2, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusOffset:F

    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconHalfSize:F

    iget v3, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusHalfStroke:F

    add-float/2addr v3, v0

    iget v0, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$iconSize:F

    iget v4, p0, Lcom/getbase/floatingactionbutton/AddFloatingActionButton$1;->val$plusOffset:F

    sub-float v4, v0, v4

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 76
    return-void
.end method
