.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
.super Ljava/lang/Object;
.source "MoaAction.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final serialVersionUID:J = 0x776f3876f5a9b46cL


# instance fields
.field protected description:Ljava/lang/String;

.field protected jsonParameters:Lorg/json/JSONArray;

.field private final mOptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected name:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->name:Ljava/lang/String;

    .line 30
    return-void
.end method

.method private addParam(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->name:Ljava/lang/String;

    invoke-direct {v0, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;-><init>(Ljava/lang/String;)V

    .line 36
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->description:Ljava/lang/String;

    iput-object v6, v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->description:Ljava/lang/String;

    .line 38
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->jsonParameters:Lorg/json/JSONArray;

    if-eqz v6, :cond_1c

    .line 40
    :try_start_f
    new-instance v6, Lorg/json/JSONArray;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->jsonParameters:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iput-object v6, v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->jsonParameters:Lorg/json/JSONArray;
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1c} :catch_50

    .line 46
    :cond_1c
    :goto_1c
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    monitor-enter v7

    .line 47
    :try_start_1f
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 48
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :goto_29
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_59

    .line 49
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 50
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 51
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 53
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    if-eqz v6, :cond_55

    .line 54
    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;->clone()Ljava/lang/Object;

    move-result-object v6

    invoke-direct {v0, v4, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_29

    .line 59
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4    # "key":Ljava/lang/String;
    :catchall_4d
    move-exception v6

    monitor-exit v7
    :try_end_4f
    .catchall {:try_start_1f .. :try_end_4f} :catchall_4d

    throw v6

    .line 41
    :catch_50
    move-exception v1

    .line 42
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1c

    .line 56
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v4    # "key":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_55
    :try_start_55
    invoke-direct {v0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_29

    .line 59
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_59
    monitor-exit v7
    :try_end_5a
    .catchall {:try_start_55 .. :try_end_5a} :catchall_4d

    .line 61
    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->mOptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 66
    .end local p2    # "defaultValue":Ljava/lang/Object;
    :cond_e
    return-object p2
.end method

.method public setValue(Ljava/lang/String;D)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 98
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    return-void
.end method

.method public setValue(Ljava/lang/String;F)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 94
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    return-void
.end method

.method public setValue(Ljava/lang/String;I)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 90
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 91
    return-void
.end method

.method public setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p2, "value":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;, "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter<*>;"
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/CharSequence;

    .prologue
    .line 86
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/util/Collection;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p2, "value":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method public setValue(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 102
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->addParam(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    return-void
.end method
