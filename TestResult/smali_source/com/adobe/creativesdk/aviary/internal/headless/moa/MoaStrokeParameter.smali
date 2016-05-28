.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaStrokeParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7bd09f93677581e6L


# instance fields
.field private brushmode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

.field private initParams:Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

.field private mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private radius:D


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;D)V
    .registers 6
    .param p1, "m"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .param p2, "r"    # D

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 19
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    .line 20
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    .line 27
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->brushmode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 28
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->radius:D

    .line 29
    return-void
.end method


# virtual methods
.method public addPoint(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 52
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 53
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    monitor-exit v1

    .line 55
    return-void

    .line 54
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public addPoint(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V
    .registers 4
    .param p1, "point"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    .prologue
    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 41
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    monitor-exit v1

    .line 43
    return-void

    .line 42
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public addPoint([F)V
    .registers 7
    .param p1, "points"    # [F

    .prologue
    .line 64
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 65
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    const/4 v3, 0x0

    aget v3, p1, v3

    const/4 v4, 0x1

    aget v4, p1, v4

    invoke-direct {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    monitor-exit v1

    .line 67
    return-void

    .line 66
    :catchall_15
    move-exception v0

    monitor-exit v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 103
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->brushmode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->radius:D

    invoke-direct {v1, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;-><init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;D)V

    .line 105
    .local v1, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 106
    :try_start_c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 107
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 108
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->addPoint(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V

    goto :goto_12

    .line 110
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :catchall_28
    move-exception v2

    monitor-exit v3
    :try_end_2a
    .catchall {:try_start_c .. :try_end_2a} :catchall_28

    throw v2

    .restart local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :cond_2b
    :try_start_2b
    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_28

    .line 111
    return-object v1
.end method

.method public encode()Ljava/lang/Object;
    .registers 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 75
    .local v4, "object":Lorg/json/JSONObject;
    :try_start_5
    const-string v5, "brushmode"

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->brushmode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    const-string v5, "radius"

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->radius:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 80
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mLock:Ljava/lang/Object;

    monitor-enter v6
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_27} :catch_44

    .line 81
    :try_start_27
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->mList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 82
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :goto_2d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_49

    .line 83
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;->encode()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2d

    .line 85
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :catchall_41
    move-exception v5

    monitor-exit v6
    :try_end_43
    .catchall {:try_start_27 .. :try_end_43} :catchall_41

    :try_start_43
    throw v5
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_43 .. :try_end_44} :catch_44

    .line 94
    .end local v0    # "array":Lorg/json/JSONArray;
    :catch_44
    move-exception v1

    .line 95
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 98
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_48
    :goto_48
    return-object v4

    .line 85
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;>;"
    :cond_49
    :try_start_49
    monitor-exit v6
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_41

    .line 87
    :try_start_4a
    const-string v5, "pointlist"

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->initParams:Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    if-eqz v5, :cond_48

    .line 90
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->initParams:Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->encode()Lorg/json/JSONObject;

    move-result-object v2

    .line 91
    .local v2, "initObject":Lorg/json/JSONObject;
    const-string v5, "initparams"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5e
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_5e} :catch_44

    goto :goto_48
.end method

.method public setInitParams(Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;)V
    .registers 4
    .param p1, "value"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    .prologue
    .line 33
    :try_start_0
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->initParams:Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
    :try_end_8
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_8} :catch_9

    .line 37
    :goto_8
    return-void

    .line 34
    :catch_9
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    goto :goto_8
.end method
