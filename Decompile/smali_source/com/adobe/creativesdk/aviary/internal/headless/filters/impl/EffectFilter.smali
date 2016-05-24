.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
.source "EffectFilter.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 13
    const-string v0, "effects"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;-><init>(Ljava/lang/String;)V

    .line 14
    sget v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->SEED:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setSeed(I)V

    .line 15
    return-void
.end method


# virtual methods
.method public setIntensity(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "intensity"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 56
    return-void
.end method

.method public final setMoaLiteEffect(Ljava/lang/String;)V
    .registers 4
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "filename"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method
