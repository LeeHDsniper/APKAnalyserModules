.class final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;
.super Ljava/lang/Object;
.source "ReceiptManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Status;,
        Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;,
        Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;,
        Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;
    }
.end annotation


# static fields
.field static final S_DISPATCHER_HANDLER_THREAD:Landroid/os/HandlerThread;

.field static final S_UPLOAD_HANDLER_THREAD:Landroid/os/HandlerThread;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->S_DISPATCHER_HANDLER_THREAD:Landroid/os/HandlerThread;

    .line 37
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$UploadHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->S_UPLOAD_HANDLER_THREAD:Landroid/os/HandlerThread;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mContext:Landroid/content/Context;

    .line 61
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;

    const-string v1, "http://receipts-gateway.aviary.com/v2/receipt/android/free"

    const-string v2, "http://receipts-gateway.aviary.com/v2/receipt/android/paid"

    const-string v3, "http://receipts-gateway.aviary.com/v2/content"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 62
    .local v0, "info":Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mContext:Landroid/content/Context;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->S_DISPATCHER_HANDLER_THREAD:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$EndpointInfo;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    .line 65
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    invoke-virtual {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendEmptyMessage(I)Z

    .line 66
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendEmptyMessage(I)Z

    .line 76
    return-void
.end method

.method public open()V
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendEmptyMessage(I)Z

    .line 71
    return-void
.end method

.method public sendContent(Ljava/lang/String;)V
    .registers 5
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    const/16 v2, 0x65

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendMessage(Landroid/os/Message;)Z

    .line 91
    return-void
.end method

.method public sendTicket(Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;)V
    .registers 5
    .param p1, "receipt"    # Lcom/adobe/creativesdk/aviary/internal/receipt/Receipt;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    const/16 v2, 0x64

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendMessage(Landroid/os/Message;)Z

    .line 86
    return-void
.end method

.method public upload()V
    .registers 3

    .prologue
    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager;->mDispatcher:Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptManager$Dispatcher;->sendEmptyMessage(I)Z

    .line 81
    return-void
.end method
