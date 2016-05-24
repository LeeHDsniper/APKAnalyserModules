.class public Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;
.super Ljava/lang/Object;
.source "DetailPaletteEvent.java"


# instance fields
.field public final packId:J

.field public final palette:Landroid/support/v7/graphics/Palette;


# direct methods
.method public constructor <init>(Landroid/support/v7/graphics/Palette;J)V
    .registers 4
    .param p1, "palette"    # Landroid/support/v7/graphics/Palette;
    .param p2, "packId"    # J

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;->palette:Landroid/support/v7/graphics/Palette;

    .line 14
    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;->packId:J

    .line 15
    return-void
.end method
