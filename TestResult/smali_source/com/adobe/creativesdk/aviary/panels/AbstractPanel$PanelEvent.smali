.class public abstract Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.super Ljava/lang/Object;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PanelEvent"
.end annotation


# instance fields
.field public final panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V
    .registers 2
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .prologue
    .line 580
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 581
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;->panel:Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;

    .line 582
    return-void
.end method
