.class Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;
.super Ljava/lang/Object;
.source "ReceiptManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Status"
.end annotation


# instance fields
.field final count:I

.field final id:J

.field final status:I


# direct methods
.method public constructor <init>(JII)V
    .registers 6
    .param p1, "id"    # J
    .param p3, "status"    # I
    .param p4, "count"    # I

    .prologue
    .line 455
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 456
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->id:J

    .line 457
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->status:I

    .line 458
    iput p4, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;->count:I

    .line 459
    return-void
.end method
