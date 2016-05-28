.class Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;
.super Ljava/lang/Object;
.source "MessageService.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/services/MessageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/aviary/internal/threading/FutureListener",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFutureDone(Lcom/adobe/creativesdk/aviary/internal/threading/Future;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/threading/Future",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "future":Lcom/adobe/creativesdk/aviary/internal/threading/Future;, "Lcom/adobe/creativesdk/aviary/internal/threading/Future<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onFutureDone"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 37
    :try_start_9
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/MessageService$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/MessageService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->handleActiveMessage()Z
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/MessageService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/MessageService;)Z
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_e} :catch_f

    .line 41
    :goto_e
    return-void

    .line 38
    :catch_f
    move-exception v0

    .line 39
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_e
.end method
