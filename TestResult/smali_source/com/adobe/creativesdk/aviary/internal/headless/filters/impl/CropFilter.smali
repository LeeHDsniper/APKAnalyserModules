.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "CropFilter.java"


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 10
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "crop"

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>([Ljava/lang/String;)V

    .line 11
    return-void
.end method


# virtual methods
.method public setPreviewSize(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V
    .registers 5
    .param p1, "value"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    .prologue
    .line 24
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 25
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    const-string v1, "previewsize"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 26
    return-void
.end method

.method public setSize(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V
    .registers 5
    .param p1, "size"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    .prologue
    .line 19
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 20
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    const-string v1, "size"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 21
    return-void
.end method

.method public setTopLeft(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;)V
    .registers 5
    .param p1, "topleft"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    .prologue
    .line 14
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 15
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    const-string v1, "upperleftpoint"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 16
    return-void
.end method
