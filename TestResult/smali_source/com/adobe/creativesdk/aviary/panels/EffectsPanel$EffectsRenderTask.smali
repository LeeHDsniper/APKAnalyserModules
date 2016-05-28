.class public Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRenderTask;
.super Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
.source "EffectsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EffectsRenderTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;IF)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;
    .param p2, "position"    # I
    .param p3, "intensity"    # F

    .prologue
    .line 236
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;

    .line 237
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;IF)V

    .line 238
    return-void
.end method
