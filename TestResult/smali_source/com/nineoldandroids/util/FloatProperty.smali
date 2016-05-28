.class public abstract Lcom/nineoldandroids/util/FloatProperty;
.super Lcom/nineoldandroids/util/Property;
.source "FloatProperty.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/nineoldandroids/util/Property",
        "<TT;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    .local p0, "this":Lcom/nineoldandroids/util/FloatProperty;, "Lcom/nineoldandroids/util/FloatProperty<TT;>;"
    const-class v0, Ljava/lang/Float;

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 33
    return-void
.end method


# virtual methods
.method public final set(Ljava/lang/Object;Ljava/lang/Float;)V
    .registers 4
    .param p2, "value"    # Ljava/lang/Float;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Float;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/nineoldandroids/util/FloatProperty;, "Lcom/nineoldandroids/util/FloatProperty<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/nineoldandroids/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 44
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 29
    .local p0, "this":Lcom/nineoldandroids/util/FloatProperty;, "Lcom/nineoldandroids/util/FloatProperty<TT;>;"
    check-cast p2, Ljava/lang/Float;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    return-void
.end method

.method public abstract setValue(Ljava/lang/Object;F)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)V"
        }
    .end annotation
.end method
