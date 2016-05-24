.class public abstract Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "IntensityNativeFilter.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>(Ljava/lang/String;)V

    .line 10
    return-void
.end method


# virtual methods
.method public getIntensity()D
    .registers 5

    .prologue
    .line 20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "intensity"

    const-wide/high16 v2, 0x3ff0000000000000L

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->getValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public setIntensity(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "intensity"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 17
    return-void
.end method
