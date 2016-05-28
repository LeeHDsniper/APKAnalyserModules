.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.source "MoaGraphicsOperationParameter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x70376286bc6f9da9L


# instance fields
.field mBlurSize:I

.field mColor:I

.field mCommands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;",
            ">;"
        }
    .end annotation
.end field

.field mErase:I

.field final mLock:Ljava/lang/Object;

.field mRadius:F


# direct methods
.method public constructor <init>(IFII)V
    .registers 6
    .param p1, "blurSize"    # I
    .param p2, "radius"    # F
    .param p3, "color"    # I
    .param p4, "erase"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;-><init>()V

    .line 14
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mLock:Ljava/lang/Object;

    .line 17
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    .line 20
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mBlurSize:I

    .line 21
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mRadius:F

    .line 22
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mColor:I

    .line 23
    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mErase:I

    .line 24
    return-void
.end method


# virtual methods
.method public addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V
    .registers 4
    .param p1, "command"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    .prologue
    .line 27
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 28
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    monitor-exit v1

    .line 30
    return-void

    .line 29
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 8

    .prologue
    .line 67
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mBlurSize:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mRadius:F

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mColor:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mErase:I

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;-><init>(IFII)V

    .line 68
    .local v2, "param":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mLock:Ljava/lang/Object;

    monitor-enter v4

    .line 69
    :try_start_10
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 70
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :cond_16
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    .line 71
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 72
    .local v0, "current":Ljava/lang/Object;
    if-eqz v0, :cond_16

    .line 73
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    .end local v0    # "current":Ljava/lang/Object;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->addCommand(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;)V

    goto :goto_16

    .line 76
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :catchall_34
    move-exception v3

    monitor-exit v4
    :try_end_36
    .catchall {:try_start_10 .. :try_end_36} :catchall_34

    throw v3

    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :cond_37
    :try_start_37
    monitor-exit v4
    :try_end_38
    .catchall {:try_start_37 .. :try_end_38} :catchall_34

    .line 77
    return-object v2
.end method

.method public encode()Ljava/lang/Object;
    .registers 10

    .prologue
    .line 43
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 45
    .local v3, "object":Lorg/json/JSONObject;
    :try_start_5
    const-string v4, "blursize"

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mBlurSize:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    const-string v4, "radius"

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mRadius:F

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    const-string v4, "color"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mColor:I

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x8

    const/16 v8, 0x30

    invoke-static {v6, v7, v8}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    const-string v4, "erase"

    iget v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mErase:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 50
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 52
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_54} :catch_71

    .line 53
    :try_start_54
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 54
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :goto_5a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_76

    .line 55
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;->encode()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_5a

    .line 57
    .end local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :catchall_6e
    move-exception v4

    monitor-exit v5
    :try_end_70
    .catchall {:try_start_54 .. :try_end_70} :catchall_6e

    :try_start_70
    throw v4
    :try_end_71
    .catch Lorg/json/JSONException; {:try_start_70 .. :try_end_71} :catch_71

    .line 59
    .end local v0    # "array":Lorg/json/JSONArray;
    :catch_71
    move-exception v1

    .line 60
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 62
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_75
    return-object v3

    .line 57
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v2    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;>;"
    :cond_76
    :try_start_76
    monitor-exit v5
    :try_end_77
    .catchall {:try_start_76 .. :try_end_77} :catchall_6e

    .line 58
    :try_start_77
    const-string v4, "commands"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7c
    .catch Lorg/json/JSONException; {:try_start_77 .. :try_end_7c} :catch_71

    goto :goto_75
.end method

.method public getLastCommand()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;
    .registers 4

    .prologue
    .line 33
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 34
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1d

    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsOperationParameter;->mCommands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaGraphicsCommandParameter;

    monitor-exit v1

    .line 38
    :goto_1c
    return-object v0

    .line 37
    :cond_1d
    monitor-exit v1

    .line 38
    const/4 v0, 0x0

    goto :goto_1c

    .line 37
    :catchall_20
    move-exception v0

    monitor-exit v1
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v0
.end method
