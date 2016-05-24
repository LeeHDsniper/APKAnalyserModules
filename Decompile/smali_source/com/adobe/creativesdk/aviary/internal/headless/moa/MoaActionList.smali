.class public final Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
.super Ljava/lang/Object;
.source "MoaActionList.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;
.implements Ljava/util/List;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;",
        "Ljava/util/List",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x13fe502bec0bc3bfL


# instance fields
.field protected final actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    .line 24
    return-void
.end method


# virtual methods
.method public add(ILcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)V
    .registers 4
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .prologue
    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 136
    return-void
.end method

.method public bridge synthetic add(ILjava/lang/Object;)V
    .registers 3

    .prologue
    .line 16
    check-cast p2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(ILcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)V

    return-void
.end method

.method public add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z
    .registers 3
    .param p1, "action"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 16
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    move-result v0

    return v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 4
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 140
    .local p2, "arg1":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 58
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 28
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-direct {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;-><init>()V

    .line 30
    .local v2, "list":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    monitor-enter v4

    .line 31
    :try_start_8
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 32
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_29

    move-result v3

    if-eqz v3, :cond_2c

    .line 34
    :try_start_14
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z
    :try_end_23
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_14 .. :try_end_23} :catch_24
    .catchall {:try_start_14 .. :try_end_23} :catchall_29

    goto :goto_e

    .line 35
    :catch_24
    move-exception v0

    .line 36
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    :try_start_25
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    goto :goto_e

    .line 39
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :catchall_29
    move-exception v3

    monitor-exit v4
    :try_end_2b
    .catchall {:try_start_25 .. :try_end_2b} :catchall_29

    throw v3

    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :cond_2c
    :try_start_2c
    monitor-exit v4
    :try_end_2d
    .catchall {:try_start_2c .. :try_end_2d} :catchall_29

    .line 40
    return-object v2
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "action"    # Ljava/lang/Object;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .registers 3
    .param p1, "arg0"    # I

    .prologue
    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 156
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    monitor-enter v3

    .line 157
    :try_start_3
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 158
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 161
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 162
    monitor-exit v3

    .line 166
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :goto_20
    return-object v0

    .line 165
    :cond_21
    monitor-exit v3

    .line 166
    const/4 v0, 0x0

    goto :goto_20

    .line 165
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;>;"
    :catchall_24
    move-exception v2

    monitor-exit v3
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_24

    throw v2
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->lastIndexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 3
    .param p1, "arg0"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;"
        }
    .end annotation

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .registers 3
    .param p1, "arg0"    # I

    .prologue
    .line 191
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    return-object v0
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->remove(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "action"    # Ljava/lang/Object;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "arg0":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    return v0
.end method

.method public set(ILcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .registers 4
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .prologue
    .line 16
    check-cast p2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->set(ILcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .registers 4
    .param p1, "arg0"    # I
    .param p2, "arg1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "arg0":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
