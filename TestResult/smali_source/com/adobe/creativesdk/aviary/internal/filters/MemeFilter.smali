.class public Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "MemeFilter.java"


# instance fields
.field private mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 11
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "memegen"

    aput-object v1, v0, v2

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 12
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 13
    return-void
.end method


# virtual methods
.method public setAssetFontName(Ljava/lang/String;)V
    .registers 6
    .param p1, "fontname"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "fontname"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "assets/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public setBottomText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "bottomtext"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    return-void
.end method

.method public setFillColor(I)V
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "fillcolor"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;-><init>(Ljava/lang/Integer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 33
    return-void
.end method

.method public setFontSourceDir(Ljava/lang/String;)V
    .registers 4
    .param p1, "sourceDir"    # Ljava/lang/String;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "fontsourcedir"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public setPaddingBottom(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "paddingbottom"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 49
    return-void
.end method

.method public setPaddingTop(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "paddingtop"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 45
    return-void
.end method

.method public setStrokeColor(I)V
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "outlinecolor"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaColorParameter;-><init>(Ljava/lang/Integer;)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 37
    return-void
.end method

.method public setTextSize(D)V
    .registers 6
    .param p1, "value"    # D

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "textsize"

    invoke-virtual {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 29
    return-void
.end method

.method public setTopText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->mAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "toptext"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    return-void
.end method
