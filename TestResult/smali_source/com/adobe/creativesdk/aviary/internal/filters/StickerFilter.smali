.class public Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "StickerFilter.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "sourceDir"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 8
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "addsticker"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setSourceDir(Ljava/lang/String;)V

    .line 10
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->setUrl(Ljava/lang/String;)V

    .line 11
    return-void
.end method


# virtual methods
.method public setAlpha(I)V
    .registers 4
    .param p1, "alpha"    # I

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "alpha"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 59
    return-void
.end method

.method public setBottomRight(FF)V
    .registers 6
    .param p1, "right"    # F
    .param p2, "bottom"    # F

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "bottomright"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 39
    return-void
.end method

.method public setCenter(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "center"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 47
    return-void
.end method

.method public setFlipH(Z)V
    .registers 4
    .param p1, "flip"    # Z

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "fliph"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Z)V

    .line 55
    return-void
.end method

.method public setRotation(D)V
    .registers 6
    .param p1, "radians"    # D

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "rotation"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 43
    return-void
.end method

.method public setScale(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "scale"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 51
    return-void
.end method

.method public setSize(II)V
    .registers 8
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "size"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-direct {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 31
    return-void
.end method

.method public setSourceDir(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "source"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return-void
.end method

.method public setTopLeft(FF)V
    .registers 6
    .param p1, "left"    # F
    .param p2, "top"    # F

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "topleft"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-direct {v2, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 35
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/StickerFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    return-void
.end method
