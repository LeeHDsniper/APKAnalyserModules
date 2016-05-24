.class Lcom/getbase/floatingactionbutton/FloatingActionButton$1;
.super Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;
.source "FloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getbase/floatingactionbutton/FloatingActionButton;->createInnerStrokesDrawable(IF)Landroid/graphics/drawable/Drawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getbase/floatingactionbutton/FloatingActionButton;

.field final synthetic val$bottomStrokeColor:I

.field final synthetic val$bottomStrokeColorHalfTransparent:I

.field final synthetic val$color:I

.field final synthetic val$topStrokeColor:I

.field final synthetic val$topStrokeColorHalfTransparent:I


# direct methods
.method constructor <init>(Lcom/getbase/floatingactionbutton/FloatingActionButton;IIIII)V
    .registers 7
    .param p1, "this$0"    # Lcom/getbase/floatingactionbutton/FloatingActionButton;

    .prologue
    .line 396
    iput-object p1, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->this$0:Lcom/getbase/floatingactionbutton/FloatingActionButton;

    iput p2, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$topStrokeColor:I

    iput p3, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$topStrokeColorHalfTransparent:I

    iput p4, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$color:I

    iput p5, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$bottomStrokeColorHalfTransparent:I

    iput p6, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$bottomStrokeColor:I

    invoke-direct {p0}, Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public resize(II)Landroid/graphics/Shader;
    .registers 12
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v8, 0x5

    .line 399
    new-instance v0, Landroid/graphics/LinearGradient;

    div-int/lit8 v1, p1, 0x2

    int-to-float v1, v1

    const/4 v2, 0x0

    div-int/lit8 v3, p1, 0x2

    int-to-float v3, v3

    int-to-float v4, p2

    new-array v5, v8, [I

    const/4 v6, 0x0

    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$topStrokeColor:I

    aput v7, v5, v6

    const/4 v6, 0x1

    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$topStrokeColorHalfTransparent:I

    aput v7, v5, v6

    const/4 v6, 0x2

    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$color:I

    aput v7, v5, v6

    const/4 v6, 0x3

    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$bottomStrokeColorHalfTransparent:I

    aput v7, v5, v6

    const/4 v6, 0x4

    iget v7, p0, Lcom/getbase/floatingactionbutton/FloatingActionButton$1;->val$bottomStrokeColor:I

    aput v7, v5, v6

    new-array v6, v8, [F

    fill-array-data v6, :array_32

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    return-object v0

    nop

    :array_32
    .array-data 4
        0x0
        0x3e4ccccd
        0x3f000000
        0x3f4ccccd
        0x3f800000
    .end array-data
.end method
