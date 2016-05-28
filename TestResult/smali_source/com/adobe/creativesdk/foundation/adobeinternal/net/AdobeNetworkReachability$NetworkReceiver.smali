.class Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AdobeNetworkReachability.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NetworkReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 159
    const-string v2, "connectivity"

    .line 160
    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 161
    .local v0, "conn":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 163
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->decideNetworkConnectivity(Landroid/net/NetworkInfo;)V

    .line 164
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;->this$0:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->notifyNetworkChange()V

    .line 165
    return-void
.end method
