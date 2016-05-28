.class Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;
.super Ljava/lang/Object;
.source "ReceiptManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EndpointInfo"
.end annotation


# instance fields
.field final signatureRequired:Z

.field final uriContent:Ljava/lang/String;

.field final uriFree:Ljava/lang/String;

.field final uriPaid:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "uriFree"    # Ljava/lang/String;
    .param p2, "uriPaid"    # Ljava/lang/String;
    .param p3, "uriContent"    # Ljava/lang/String;
    .param p4, "signatureRequired"    # Z

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriFree:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriPaid:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->uriContent:Ljava/lang/String;

    .line 54
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;->signatureRequired:Z

    .line 55
    return-void
.end method
