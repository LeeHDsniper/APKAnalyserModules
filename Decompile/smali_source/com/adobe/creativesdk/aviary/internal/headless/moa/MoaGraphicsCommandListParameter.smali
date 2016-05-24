.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaGraphicsCommandListParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x622423e3cd7b1031L


# instance fields
.field mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;",
            ">;"
        }
    .end annotation
.end field

.field final mLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mLock:Ljava/lang/Object;

    .line 16
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V
    .registers 4
    .param p1, "command"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    .prologue
    .line 19
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 20
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    monitor-exit v1

    .line 22
    return-void

    .line 21
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 40
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;-><init>()V

    .line 42
    .local v1, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 43
    :try_start_8
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 44
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V

    goto :goto_e

    .line 47
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :catchall_24
    move-exception v2

    monitor-exit v3
    :try_end_26
    .catchall {:try_start_8 .. :try_end_26} :catchall_24

    throw v2

    .restart local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :cond_27
    :try_start_27
    monitor-exit v3
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_24

    .line 48
    return-object v1
.end method

.method public encode()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 26
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 28
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 29
    :try_start_8
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandListParameter;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 30
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->encode()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_e

    .line 33
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :catchall_22
    move-exception v2

    monitor-exit v3
    :try_end_24
    .catchall {:try_start_8 .. :try_end_24} :catchall_22

    throw v2

    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :cond_25
    :try_start_25
    monitor-exit v3
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_22

    .line 35
    return-object v0
.end method
