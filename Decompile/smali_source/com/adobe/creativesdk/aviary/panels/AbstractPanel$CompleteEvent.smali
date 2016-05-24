.class public final Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;
.source "AbstractPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CompleteEvent"
.end annotation


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public final editResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 4
    .param p1, "panel"    # Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 618
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$PanelEvent;-><init>(Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;)V

    .line 619
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;->bitmap:Landroid/graphics/Bitmap;

    .line 620
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanel$CompleteEvent;->editResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .line 621
    return-void
.end method
