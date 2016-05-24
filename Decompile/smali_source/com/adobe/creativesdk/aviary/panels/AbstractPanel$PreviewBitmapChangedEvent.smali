.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PreviewBitmapChangedEvent"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final reset:Z


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/Bitmap;Z)V
    .registers 4
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "reset"    # Z

    .prologue
    .line 659
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 660
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;->bitmap:Landroid/graphics/Bitmap;

    .line 661
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PreviewBitmapChangedEvent;->reset:Z

    .line 662
    return-void
.end method
