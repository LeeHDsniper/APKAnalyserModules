.class public Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "OverlayFilter.java"


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 7
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "overlay"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 8
    return-void
.end method


# virtual methods
.method public setSourceDir(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "source"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    return-void
.end method
