.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel$ContentReadyEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractContentPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContentReadyEvent"
.end annotation


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V
    .registers 2
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 60
    return-void
.end method
