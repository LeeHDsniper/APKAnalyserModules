.class Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;
.super Landroid/graphics/drawable/LayerDrawable;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getbase/floatingactionbutton/FloatingActionButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TranslucentLayerDrawable"
.end annotation


# instance fields
.field private final mAlpha:I


# direct methods
.method public varargs constructor <init>(I[Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "alpha"    # I
    .param p2, "layers"    # [Landroid/graphics/drawable/Drawable;

    .prologue
    .line 316
    invoke-direct {p0, p2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 317
    iput p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;->mAlpha:I

    .line 318
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    .line 323
    .local v7, "bounds":Landroid/graphics/Rect;
    iget v0, v7, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget v0, v7, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget v0, v7, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget v0, v7, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget v5, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$TranslucentLayerDrawable;->mAlpha:I

    const/16 v6, 0x1f

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    .line 324
    invoke-super {p0, p1}, Landroid/graphics/drawable/LayerDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 325
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 326
    return-void
.end method
