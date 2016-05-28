.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "NativeRangeFilter.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeRangeFilter;


# instance fields
.field protected defaultParam:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

.field protected mKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>(Ljava/lang/String;)V

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;-><init>(F)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->defaultParam:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    .line 12
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->mKey:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public getValue()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;
    .registers 4

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->mKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->defaultParam:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->getValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    return-object v0
.end method

.method public setValue(Ljava/lang/Float;)V
    .registers 6
    .param p1, "value"    # Ljava/lang/Float;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;->mKey:Ljava/lang/String;

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaFloatParameter;-><init>(F)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 18
    return-void
.end method
