.class public Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
.source "BorderFilter.java"


# instance fields
.field private mFrameDefaultSize:D


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 9
    const-string v0, "imageborders"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method


# virtual methods
.method public setHiRes(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "large"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Z)V

    .line 30
    return-void
.end method

.method public setIdentifier(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/CharSequence;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "bordername"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 26
    return-void
.end method

.method public setIntensity(D)V
    .registers 8
    .param p1, "value"    # D

    .prologue
    .line 14
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->setIntensity(D)V

    .line 15
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mFrameDefaultSize:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1a

    .line 16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "bordersize"

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mFrameDefaultSize:D

    mul-double/2addr v2, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 18
    :cond_1a
    return-void
.end method

.method public setSize(D)V
    .registers 6
    .param p1, "size"    # D

    .prologue
    .line 33
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mFrameDefaultSize:D

    .line 34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "bordersize"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 35
    return-void
.end method

.method public setSourceDir(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/CharSequence;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "source"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 22
    return-void
.end method
