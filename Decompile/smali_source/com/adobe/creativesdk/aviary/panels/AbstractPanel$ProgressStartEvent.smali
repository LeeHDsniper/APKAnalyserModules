.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProgressStartEvent"
.end annotation


# instance fields
.field public final isModal:Z


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Z)V
    .registers 3
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "isModal"    # Z

    .prologue
    .line 589
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 590
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;->isModal:Z

    .line 591
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 595
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ProgressStartEvent("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$ProgressStartEvent;->isModal:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
