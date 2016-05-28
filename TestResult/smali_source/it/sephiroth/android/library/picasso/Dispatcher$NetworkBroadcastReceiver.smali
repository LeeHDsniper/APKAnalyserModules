.class Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NetworkBroadcastReceiver"
.end annotation


# instance fields
.field private final dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Dispatcher;)V
    .registers 2
    .param p1, "dispatcher"    # Lit/sephiroth/android/library/picasso/Dispatcher;

    .prologue
    .line 574
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 575
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    .line 576
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 594
    if-nez p2, :cond_3

    .line 607
    :cond_2
    :goto_2
    return-void

    .line 597
    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 598
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 599
    const-string v2, "state"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 602
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    const-string v3, "state"

    const/4 v4, 0x0

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchAirplaneModeChange(Z)V

    goto :goto_2

    .line 603
    :cond_24
    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 604
    const-string v2, "connectivity"

    invoke-static {p1, v2}, Lit/sephiroth/android/library/picasso/Utils;->getService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 605
    .local v1, "connectivityManager":Landroid/net/ConnectivityManager;
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchNetworkStateChange(Landroid/net/NetworkInfo;)V

    goto :goto_2
.end method

.method register()V
    .registers 3

    .prologue
    .line 579
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 580
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 581
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    iget-boolean v1, v1, Lit/sephiroth/android/library/picasso/Dispatcher;->scansNetworkChanges:Z

    if-eqz v1, :cond_15

    .line 582
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 584
    :cond_15
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    iget-object v1, v1, Lit/sephiroth/android/library/picasso/Dispatcher;->context:Landroid/content/Context;

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 585
    return-void
.end method
