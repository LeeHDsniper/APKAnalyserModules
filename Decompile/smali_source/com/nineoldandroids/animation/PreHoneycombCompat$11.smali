.class final Lcom/nineoldandroids/animation/PreHoneycombCompat$11;
.super Lcom/nineoldandroids/util/IntProperty;
.source "PreHoneycombCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/PreHoneycombCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nineoldandroids/util/IntProperty",
        "<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/nineoldandroids/util/IntProperty;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Landroid/view/View;)Ljava/lang/Integer;
    .registers 3
    .param p1, "object"    # Landroid/view/View;

    .prologue
    .line 128
    invoke-static {p1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->getScrollX()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 120
    check-cast p1, Landroid/view/View;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$11;->get(Landroid/view/View;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Landroid/view/View;I)V
    .registers 4
    .param p1, "object"    # Landroid/view/View;
    .param p2, "value"    # I

    .prologue
    .line 123
    invoke-static {p1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setScrollX(I)V

    .line 124
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;I)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 120
    check-cast p1, Landroid/view/View;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/animation/PreHoneycombCompat$11;->setValue(Landroid/view/View;I)V

    return-void
.end method
