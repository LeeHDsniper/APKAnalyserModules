.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$2;
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
        "Ljava/lang/Object;",
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
    .line 222
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)V
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountConnection;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "disposed!"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 226
    return-void
.end method
