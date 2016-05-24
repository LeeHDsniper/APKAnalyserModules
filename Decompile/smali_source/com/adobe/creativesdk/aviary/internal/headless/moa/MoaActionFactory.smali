.class public final Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;
.super Ljava/lang/Object;
.source "MoaActionFactory.java"


# direct methods
.method public static action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .registers 2
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 100
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 1

    .prologue
    .line 72
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;-><init>()V

    return-object v0
.end method

.method public static varargs actionList([Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 6
    .param p0, "type"    # [Ljava/lang/String;

    .prologue
    .line 84
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;-><init>()V

    .line 86
    .local v1, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    array-length v4, p0

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v4, :cond_15

    aget-object v2, p0, v3

    .line 87
    .local v2, "name":Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 88
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 86
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 90
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    .end local v2    # "name":Ljava/lang/String;
    :cond_15
    return-object v1
.end method

.method public static metadata()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;
    .registers 1

    .prologue
    .line 109
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;-><init>()V

    return-object v0
.end method
