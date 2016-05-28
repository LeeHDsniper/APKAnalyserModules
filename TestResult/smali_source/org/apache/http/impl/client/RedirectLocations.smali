.class public Lorg/apache/http/impl/client/RedirectLocations;
.super Ljava/util/AbstractList;
.source "RedirectLocations.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final all:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field

.field private final unique:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 54
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    .line 56
    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 185
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    move-object v0, p2

    check-cast v0, Ljava/net/URI;

    invoke-interface {v1, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 186
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    check-cast p2, Ljava/net/URI;

    .end local p2    # "element":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 187
    return-void
.end method

.method public add(Ljava/net/URI;)V
    .registers 3
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 70
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public contains(Ljava/net/URI;)Z
    .registers 3
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/RedirectLocations;->get(I)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Ljava/net/URI;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URI;

    return-object v0
.end method

.method public getAll()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/RedirectLocations;->remove(I)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Ljava/net/URI;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 204
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URI;

    .line 205
    .local v0, "removed":Ljava/net/URI;
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 206
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    if-eq v1, v2, :cond_22

    .line 207
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    iget-object v2, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 209
    :cond_22
    return-object v0
.end method

.method public remove(Ljava/net/URI;)Z
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 77
    iget-object v3, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    .line 78
    .local v2, "removed":Z
    if-eqz v2, :cond_24

    .line 79
    iget-object v3, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 80
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/net/URI;>;"
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    .line 81
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URI;

    .line 82
    .local v0, "current":Ljava/net/URI;
    invoke-virtual {v0, p1}, Ljava/net/URI;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 83
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_e

    .line 87
    .end local v0    # "current":Ljava/net/URI;
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/net/URI;>;"
    :cond_24
    return v2
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 153
    iget-object v2, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    move-object v1, p2

    check-cast v1, Ljava/net/URI;

    invoke-interface {v2, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URI;

    .line 154
    .local v0, "removed":Ljava/net/URI;
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 155
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    check-cast p2, Ljava/net/URI;

    .end local p2    # "element":Ljava/lang/Object;
    invoke-interface {v1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 156
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    if-eq v1, v2, :cond_2c

    .line 157
    iget-object v1, p0, Lorg/apache/http/impl/client/RedirectLocations;->unique:Ljava/util/Set;

    iget-object v2, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 159
    :cond_2c
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/http/impl/client/RedirectLocations;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
