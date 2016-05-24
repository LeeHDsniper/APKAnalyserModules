.class public Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "TextFilter.java"


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 9
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "addtext"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 10
    return-void
.end method


# virtual methods
.method public setBottomRight(DD)V
    .registers 8
    .param p1, "bottom"    # D
    .param p3, "right"    # D

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "bottomright"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p3, p4, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(DD)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 34
    return-void
.end method

.method public setFillColor(I)V
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "fillcolor"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;-><init>(Ljava/lang/Integer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 18
    return-void
.end method

.method public setRotation(F)V
    .registers 4
    .param p1, "angle"    # F

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "rotation"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 26
    return-void
.end method

.method public setStrokeColor(I)V
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 21
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "outlinecolor"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;-><init>(Ljava/lang/Integer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 22
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 14
    return-void
.end method

.method public setTextSize(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "textsize"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 38
    return-void
.end method

.method public setTopLeft(DD)V
    .registers 8
    .param p1, "top"    # D
    .param p3, "left"    # D

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "topleft"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p3, p4, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(DD)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 30
    return-void
.end method
