.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;
.super Ljava/lang/Object;
.source "AdobeAccountConnection.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->dispose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 227
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$3;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "exception during disposal..."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 231
    return-void
.end method
