.class public Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "AdjustFilter.java"


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 33
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method private setFeatherEditSize(II)V
    .registers 6
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 80
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const-string v2, "setfeathereditsize"

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 81
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    if-nez v0, :cond_15

    .line 82
    const-string v1, "setfeathereditsize"

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 83
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 85
    :cond_15
    const-string v1, "width"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 86
    const-string v1, "height"

    invoke-virtual {v0, v1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 87
    return-void
.end method


# virtual methods
.method public setFixedRotation(I)Z
    .registers 6
    .param p1, "value"    # I

    .prologue
    const/4 v1, 0x1

    .line 66
    rem-int/lit8 v2, p1, 0x5a

    if-nez v2, :cond_25

    if-eqz p1, :cond_25

    .line 67
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const-string v3, "rotate90"

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 68
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    if-nez v0, :cond_1f

    .line 69
    const-string v2, "rotate90"

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 70
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 71
    invoke-direct {p0, v1, v1}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->setFeatherEditSize(II)V

    .line 73
    :cond_1f
    const-string v2, "angle"

    invoke-virtual {v0, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 76
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :goto_24
    return v1

    :cond_25
    const/4 v1, 0x0

    goto :goto_24
.end method

.method public setFlip(ZZ)Z
    .registers 6
    .param p1, "horizontal"    # Z
    .param p2, "vertical"    # Z

    .prologue
    .line 97
    if-nez p1, :cond_4

    if-eqz p2, :cond_25

    .line 98
    :cond_4
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const-string v2, "flip"

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 99
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    if-nez v0, :cond_19

    .line 100
    const-string v1, "flip"

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 103
    :cond_19
    const-string v1, "horizontal"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Z)V

    .line 104
    const-string v1, "vertical"

    invoke-virtual {v0, v1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Z)V

    .line 105
    const/4 v1, 0x1

    .line 107
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :goto_24
    return v1

    :cond_25
    const/4 v1, 0x0

    goto :goto_24
.end method

.method public setStraighten(DDD)Z
    .registers 12
    .param p1, "angle"    # D
    .param p3, "width"    # D
    .param p5, "height"    # D

    .prologue
    .line 45
    const-wide/16 v2, 0x0

    cmpl-double v1, p1, v2

    if-eqz v1, :cond_2c

    .line 46
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const-string v2, "rotate"

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 47
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    if-nez v0, :cond_1b

    .line 48
    const-string v1, "rotate"

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 49
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 51
    :cond_1b
    const-string v1, "angle"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 52
    const-string v1, "width"

    invoke-virtual {v0, v1, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 53
    const-string v1, "height"

    invoke-virtual {v0, v1, p5, p6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 54
    const/4 v1, 0x1

    .line 56
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :goto_2b
    return v1

    :cond_2c
    const/4 v1, 0x0

    goto :goto_2b
.end method
