.class public final Lcom/squareup/okhttp/internal/RouteDatabase;
.super Ljava/lang/Object;
.source "RouteDatabase.java"


# instance fields
.field private final failedRoutes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/squareup/okhttp/Route;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/RouteDatabase;->failedRoutes:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public declared-synchronized connected(Lcom/squareup/okhttp/Route;)V
    .registers 3
    .param p1, "route"    # Lcom/squareup/okhttp/Route;

    .prologue
    .line 39
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/internal/RouteDatabase;->failedRoutes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 40
    monitor-exit p0

    return-void

    .line 39
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized failed(Lcom/squareup/okhttp/Route;)V
    .registers 3
    .param p1, "failedRoute"    # Lcom/squareup/okhttp/Route;

    .prologue
    .line 34
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/internal/RouteDatabase;->failedRoutes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 35
    monitor-exit p0

    return-void

    .line 34
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shouldPostpone(Lcom/squareup/okhttp/Route;)Z
    .registers 3
    .param p1, "route"    # Lcom/squareup/okhttp/Route;

    .prologue
    .line 44
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/internal/RouteDatabase;->failedRoutes:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
