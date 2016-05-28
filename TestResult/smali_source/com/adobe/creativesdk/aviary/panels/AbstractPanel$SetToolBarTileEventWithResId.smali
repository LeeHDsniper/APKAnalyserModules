.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SetToolBarTileEventWithResId"
.end annotation


# instance fields
.field public final resId:I


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;I)V
    .registers 3
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "resId"    # I

    .prologue
    .line 643
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 644
    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$SetToolBarTileEventWithResId;->resId:I

    .line 645
    return-void
.end method
