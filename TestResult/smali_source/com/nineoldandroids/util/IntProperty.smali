.class public abstract Lcom/nineoldandroids/util/IntProperty;
.super Lcom/nineoldandroids/util/Property;
.source "IntProperty.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/nineoldandroids/util/Property",
        "<TT;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 32
    .local p0, "this":Lcom/nineoldandroids/util/IntProperty;, "Lcom/nineoldandroids/util/IntProperty<TT;>;"
    const-class v0, Ljava/lang/Integer;

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 33
    return-void
.end method


# virtual methods
.method public final set(Ljava/lang/Object;Ljava/lang/Integer;)V
    .registers 4
    .param p2, "value"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/nineoldandroids/util/IntProperty;, "Lcom/nineoldandroids/util/IntProperty<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/nineoldandroids/util/IntProperty;->set(Ljava/lang/Object;Ljava/lang/Integer;)V

    .line 44
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 29
    .local p0, "this":Lcom/nineoldandroids/util/IntProperty;, "Lcom/nineoldandroids/util/IntProperty<TT;>;"
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/util/IntProperty;->set(Ljava/lang/Object;Ljava/lang/Integer;)V

    return-void
.end method

.method public abstract setValue(Ljava/lang/Object;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation
.end method
