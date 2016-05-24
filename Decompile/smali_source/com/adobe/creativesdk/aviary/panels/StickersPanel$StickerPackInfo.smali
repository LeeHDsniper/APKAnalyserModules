.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;
.super Ljava/lang/Object;
.source "StickersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StickerPackInfo"
.end annotation


# instance fields
.field packId:J

.field packIdentifier:Ljava/lang/String;


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .registers 5
    .param p1, "packId"    # J
    .param p3, "packIdentifier"    # Ljava/lang/String;

    .prologue
    .line 1440
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1441
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packId:J

    .line 1442
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$StickerPackInfo;->packIdentifier:Ljava/lang/String;

    .line 1443
    return-void
.end method
