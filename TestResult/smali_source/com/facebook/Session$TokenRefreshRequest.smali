.class Lcom/facebook/Session$TokenRefreshRequest;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/Session;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TokenRefreshRequest"
.end annotation


# instance fields
.field final messageReceiver:Landroid/os/Messenger;

.field messageSender:Landroid/os/Messenger;

.field final synthetic this$0:Lcom/facebook/Session;


# direct methods
.method constructor <init>(Lcom/facebook/Session;)V
    .registers 4

    .prologue
    .line 1648
    iput-object p1, p0, Lcom/facebook/Session$TokenRefreshRequest;->this$0:Lcom/facebook/Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1650
    new-instance v0, Landroid/os/Messenger;

    .line 1651
    new-instance v1, Lcom/facebook/Session$TokenRefreshRequestHandler;

    invoke-direct {v1, p1, p0}, Lcom/facebook/Session$TokenRefreshRequestHandler;-><init>(Lcom/facebook/Session;Lcom/facebook/Session$TokenRefreshRequest;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/facebook/Session$TokenRefreshRequest;->messageReceiver:Landroid/os/Messenger;

    .line 1653
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/Session$TokenRefreshRequest;->messageSender:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$0(Lcom/facebook/Session$TokenRefreshRequest;)V
    .registers 1

    .prologue
    .line 1680
    invoke-direct {p0}, Lcom/facebook/Session$TokenRefreshRequest;->cleanup()V

    return-void
.end method

.method private cleanup()V
    .registers 3

    .prologue
    .line 1681
    iget-object v0, p0, Lcom/facebook/Session$TokenRefreshRequest;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->currentTokenRefreshRequest:Lcom/facebook/Session$TokenRefreshRequest;
    invoke-static {v0}, Lcom/facebook/Session;->access$3(Lcom/facebook/Session;)Lcom/facebook/Session$TokenRefreshRequest;

    move-result-object v0

    if-ne v0, p0, :cond_e

    .line 1682
    iget-object v0, p0, Lcom/facebook/Session$TokenRefreshRequest;->this$0:Lcom/facebook/Session;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/Session;->access$4(Lcom/facebook/Session;Lcom/facebook/Session$TokenRefreshRequest;)V

    .line 1684
    :cond_e
    return-void
.end method

.method private refreshToken()V
    .registers 6

    .prologue
    .line 1687
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 1688
    .local v2, "requestData":Landroid/os/Bundle;
    const-string v3, "access_token"

    iget-object v4, p0, Lcom/facebook/Session$TokenRefreshRequest;->this$0:Lcom/facebook/Session;

    invoke-virtual {v4}, Lcom/facebook/Session;->getTokenInfo()Lcom/facebook/AccessToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1690
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    .line 1691
    .local v1, "request":Landroid/os/Message;
    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1692
    iget-object v3, p0, Lcom/facebook/Session$TokenRefreshRequest;->messageReceiver:Landroid/os/Messenger;

    iput-object v3, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 1695
    :try_start_1f
    iget-object v3, p0, Lcom/facebook/Session$TokenRefreshRequest;->messageSender:Landroid/os/Messenger;

    invoke-virtual {v3, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_24
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_24} :catch_25

    .line 1699
    :goto_24
    return-void

    .line 1696
    :catch_25
    move-exception v0

    .line 1697
    .local v0, "e":Landroid/os/RemoteException;
    invoke-direct {p0}, Lcom/facebook/Session$TokenRefreshRequest;->cleanup()V

    goto :goto_24
.end method


# virtual methods
.method public bind()V
    .registers 4

    .prologue
    .line 1656
    invoke-static {}, Lcom/facebook/Session;->getStaticContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/internal/NativeProtocol;->createTokenRefreshIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 1657
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_20

    .line 1658
    # getter for: Lcom/facebook/Session;->staticContext:Landroid/content/Context;
    invoke-static {}, Lcom/facebook/Session;->access$2()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v0, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-eqz v1, :cond_20

    .line 1659
    iget-object v1, p0, Lcom/facebook/Session$TokenRefreshRequest;->this$0:Lcom/facebook/Session;

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Lcom/facebook/Session;->setLastAttemptedTokenExtendDate(Ljava/util/Date;)V

    .line 1663
    :goto_1f
    return-void

    .line 1661
    :cond_20
    invoke-direct {p0}, Lcom/facebook/Session$TokenRefreshRequest;->cleanup()V

    goto :goto_1f
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 4
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 1667
    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/facebook/Session$TokenRefreshRequest;->messageSender:Landroid/os/Messenger;

    .line 1668
    invoke-direct {p0}, Lcom/facebook/Session$TokenRefreshRequest;->refreshToken()V

    .line 1669
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3
    .param p1, "arg"    # Landroid/content/ComponentName;

    .prologue
    .line 1673
    invoke-direct {p0}, Lcom/facebook/Session$TokenRefreshRequest;->cleanup()V

    .line 1677
    # getter for: Lcom/facebook/Session;->staticContext:Landroid/content/Context;
    invoke-static {}, Lcom/facebook/Session;->access$2()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 1678
    return-void
.end method
