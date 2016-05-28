.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SetToolBarTileEvent"
.end annotation


# instance fields
.field public final title:Ljava/lang/CharSequence;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 634
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 635
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEvent;->title:Ljava/lang/CharSequence;

    .line 636
    return-void
.end method
