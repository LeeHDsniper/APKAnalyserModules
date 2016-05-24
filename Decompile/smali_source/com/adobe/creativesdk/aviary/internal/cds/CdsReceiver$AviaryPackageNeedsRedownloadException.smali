.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;
.super Ljava/lang/Exception;
.source "CdsReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AviaryPackageNeedsRedownloadException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V
    .registers 3
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 546
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException;->this$0:Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;

    .line 547
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 548
    return-void
.end method
